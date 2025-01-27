#!/bin/bash
#|---/ /+--------------------------+------/ /|#
#|--/ /-|subdomain installation script|--/ /-|#
#|-/ /--|        端口扫描脚本           |-/ /--|#
#|/ /---+----------------------------+/ /---|#

# 定义颜色变量
# Define color variables
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 端口扫描
# Port scanning
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
# Input main domain
read -p "Please enter the main domain: " website_input

# 创建输出目录
# Create output directory
if [ ! -d "$website_input" ]; then
    if ! mkdir -p "$website_input"; then
        echo "Error: Cannot create output directory '$website_input'"
        exit 1
    fi
fi

echo -e "${BLUE}Starting port scan...${NC}"

echo -e "${YELLOW}[1/2] Scanning with naabu...${NC}"
naabu -host $website_input -c 50 -nmap-cli 'nmap -sV -sC' > $website_input/$website_input-full.txt
echo -e "${YELLOW}✓[2/2] Naabu scan completed${NC}"

echo -e "${GREEN}Port scan completed... Results in ${BLUE}$website_input/$website_input-full.txt${NC}"
echo -e "${GREEN}Port scanning finished...${NC}"



