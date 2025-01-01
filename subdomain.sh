#!/bin/bash
#|---/ /+--------------------------+------/ /|#
#|--/ /-|subdomain installation script|--/ /-|#
#|-/ /--|        子域名脚本            |-/ /--|#
#|/ /---+----------------------------+/ /---|#

# 定义颜色变量
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 子域名收集
echo -e "${BLUE}"
cat << "EOF"

-------------------------------------------------
 ____  _   _ ____  ____   ___  __  __    _    ___ _   _ 
/ ___|| | | | __ )|  _ \ / _ \|  \/  |  / \  |_ _| \ | |
\___ \| | | |  _ \| | | | | | | |\/| | / _ \  | ||  \| |
 ___) | |_| | |_) | |_| | |_| | |  | |/ ___ \ | || |\  |
|____/ \___/|____/|____/ \___/|_|  |_/_/   \_\___|_| \_|

-------------------------------------------------
                                v1.0.0 - @vgoer
EOF
echo -e "${NC}"

# 输入主域名
read -p "请输入主域名: " website_input

echo -e "${BLUE}开始收集子域名...${NC}"
# Subfinder扫描
echo -e "${YELLOW}[1/2] 使用Subfinder扫描...${NC}"
subfinder -d $website_input -all -recursive > $website_input/subdomain1.txt
echo -e "${GREEN}✓[2/2] Subfinder扫描完成${NC}"

# crt扫描
echo -e "${YELLOW}[2/2] 使用CRT扫描...${NC}"
curl -s "https://crt.sh/?q=%.${website_input}&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u > $website_input/subdomain2.txt
echo -e "${GREEN}✓[2/2] 使用CRT扫描完成${NC}"


# 存活主机
echo -e "${YELLOW}[1/2] 查看存活主机...${NC}"
cat $website_input/subdomain1.txt | httpx-toolkit -threads 200 > $website_input/subdomains_alive.txt
echo -e "${GREEN}✓[2/2] 查看存活主机完成${NC}"

echo -e "${GREEN}子域名收集完成... 结果在 ${BLUE}$website_input/subdomains.txt${NC}"
echo -e "${GREEN}存活主机结果在... 结果在 ${BLUE}$website_input/subdomains_alive.txt${NC}"