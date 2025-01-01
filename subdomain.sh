#!/bin/bash
#|---/ /+--------------------------+------/ /|#
#|--/ /-|subdomain installation script|--/ /-|#
#|-/ /--|        子域名脚本            |-/ /--|#
#|/ /---+----------------------------+/ /---|#

# 子域名收集
cat << "EOF"
 ____  _   _ ____  ____   ___  __  __    _    ___ _   _ 
/ ___|| | | | __ )|  _ \ / _ \|  \/  |  / \  |_ _| \ | |
\___ \| | | |  _ \| | | | | | | |\/| | / _ \  | ||  \| |
 ___) | |_| | |_) | |_| | |_| | |  | |/ ___ \ | || |\  |
|____/ \___/|____/|____/ \___/|_|  |_/_/   \_\___|_| \_|

EOF

# 输入主域名
read -p "请输入主域名: " website_input


# 创建输出目录
if [ ! -d "$website_input" ]; then
    if ! mkdir -p "$website_input"; then
        echo "错误：无法创建输出目录 '$website_input'"
        exit 1
    fi
fi

echo "开始收集子域名..."
# Subfinder扫描
echo "[1/2] 使用Subfinder扫描..."
subfinder -d $website_input -all -recursive > $website_input/subdomain1.txt
echo "✓ Subfinder扫描完成"

# crt扫描
echo "[2/2] 使用CRT扫描..."
curl -s "https://crt.sh/?q=%.${website_input}&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u > $website_input/subdomain2.txt
echo "✓ 使用CRT扫描完成"


# 合并
cat $website_input/subdomain1.txt $website_input/subdomain2.txt  | sort | uniq > $website_input/subdomains.txt

# 删除临时文件
rm -rf $website_input/subdomain1.txt $website_input/subdomain2.txt

echo "子域名收集完成... 结果在 $website_input/subdomains.txt"
