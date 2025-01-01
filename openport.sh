#!/bin/bash
#|---/ /+--------------------------+------/ /|#
#|--/ /-|subdomain installation script|--/ /-|#
#|-/ /--|        端口扫描脚本           |-/ /--|#
#|/ /---+----------------------------+/ /---|#

# 定义颜色变量
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 端口扫描
echo -e "${BLUE}"
cat << "EOF"

---------------------------------------------------------
  ____  _____  _____ _   _    _____   ____  _____ _______ 
 / __ \|  __ \|  ___| \ | |  |  __ \ / __ \|  __ \__   __|
| |  | | |__) | |__ |  \| |  | |__) | |  | | |__) | | |   
| |  | |  ___/|  __|| . ` |  |  ___/| |  | |  _  /  | |   
| |__| | |    | |___| |\  |  | |    | |__| | | \ \  | |   
 \____/|_|    |_____|_| \_|  |_|     \____/|_|  \_\ |_|   
                                                           
---------------------------------------------------------
                                v1.0.0 - @vgoer
EOF
echo -e "${NC}"

# 输入主域名
read -p "请输入主域名: " website_input

# 创建输出目录
if [ ! -d "$website_input" ]; then
    if ! mkdir -p "$website_input"; then
        echo "错误：无法创建输出目录 '$website_input'"
        exit 1
    fi
fi


echo -e "${BLUE}开始端口扫描...${NC}"
echo -e "${YELLOW}[1/2] 使用naabu扫描...${NC}"
naabu -host $website_input -c 50 -nmap-cli 'nmap -sV -sC' -o $website_input/$website_input-full.txt
echo -e "${YELLOW}✓[2/2] naabu扫描完成${NC}"

echo -e "${GREEN}端口扫描完成... 结果在 ${BLUE}$website_input/$website_input-full.txt${NC}"
echo -e "${RED}端口扫描完毕...${NC}"



