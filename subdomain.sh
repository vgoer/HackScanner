#!/bin/bash
#|---/ /+--------------------------+------/ /|#
#|--/ /-|subdomain installation script|--/ /-|#
#|-/ /--|        子域名脚本            |-/ /--|#
#|/ /---+----------------------------+/ /---|#

# 定义颜色变量
# Define color variables
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 子域名收集
# Subdomain collection
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

echo -e "${BLUE}Starting subdomain collection...${NC}"
# Subfinder扫描
# Subfinder scanning
echo -e "${YELLOW}[1/2] Scanning with Subfinder...${NC}"
subfinder -d $website_input -all -recursive > $website_input/subdomain1.txt
echo -e "${YELLOW}✓[2/2] Subfinder scan completed${NC}"

# crt扫描
# CRT scanning
echo -e "${YELLOW}[2/2] Scanning with CRT...${NC}"
curl -s "https://crt.sh/?q=%.${website_input}&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u > $website_input/subdomain2.txt
echo -e "${YELLOW}✓[2/2] CRT scan completed${NC}"

# 合并
# Merge results
cat $website_input/subdomain1.txt $website_input/subdomain2.txt  | sort | uniq > $website_input/subdomains.txt
rm -rf $website_input/subdomain1.txt $website_input/subdomain2.txt

# 存活主机
# Check live hosts
echo -e "${YELLOW}[1/2] Checking for live hosts...${NC}"
cat $website_input/subdomains.txt | httpx-toolkit -threads 200 > $website_input/subdomains_alive.txt
echo -e "${YELLOW}✓[2/2] Live host check completed${NC}"

echo -e "${GREEN}Subdomain collection completed... Results in ${BLUE}$website_input/subdomains.txt${NC}"
echo -e "${GREEN}Live hosts results in... Results in ${BLUE}$website_input/subdomains_alive.txt${NC}"
echo -e "${RED}Subdomain collection finished...${NC}"
