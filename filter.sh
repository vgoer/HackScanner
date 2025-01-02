#!/bin/bash
#|---/ /+--------------------------+---/ /|#
#|--/ /-| filter installation script |--/ /-|#
#|-/ /--|        过滤脚本             |-/ /--|#
#|/ /---+--------------------------+/ /---|#


# 定义颜色变量
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 端口扫描
# Port Scanning
cat << "EOF"

-------------------------------------------------

 _______  ___   ___      _______  _______  ______   
|       ||   | |   |    |       ||       ||    _ |  
|    ___||   | |   |    |_     _||    ___||   | ||  
|   |___ |   | |   |      |   |  |   |___ |   |_||_ 
|    ___||   | |   |___   |   |  |    ___||    __  |
|   |    |   | |       |  |   |  |   |___ |   |  | |
|___|    |___| |_______|  |___|  |_______||___|  |_|

-------------------------------------------------
                                v1.0.0 - @vgoer
EOF
echo -e "${NC}"

# 输入主域名
# Input main domain
read -p "Please enter domain: " website_input


# 创建输出目录
# Create output directory
if [ ! -d "$website_input/output" ]; then
    if ! mkdir -p "$website_input/output"; then
        echo "Error: Cannot create output directory '$website_input/output'"
        exit 1
    fi
fi

# 添加协议头
# Add protocol header
if [[ ! $website_input =~ ^https?:// ]]; then
    website_url="https://$website_input"
else
    website_url="$website_input"
fi
# 您输入的域名
# Your input domain
echo -e "${RED}Your input domain: $website_url${NC}"


# katana被动扫描
# Katana passive scanning
echo -e "${YELLOW}[1/2] Using katana for passive scanning...${NC}"
echo "$website_url" | katana -fs waybackarchive,commoncrawl,alienvault,urlscan,github,virustotal -f qurl | uro > "$website_input/output/output.txt"
echo -e "${YELLOW}✓[2/2] Katana passive scanning completed${NC}"


# katana主动扫描
# Katana active scanning
echo -e "${YELLOW}[1/2] Using katana for active scanning...${NC}"
katana -u "$website_url" -d 5 -c 15 -f qurl | uro | anew "$website_input/output/output.txt"
echo -e "${YELLOW}✓[2/2] Katana active scanning completed${NC}"

# XSS过滤
# XSS filtering
echo -e "${YELLOW}[1/2] Using Gxss and kxss to filter XSS...${NC}"
cat "$website_input/output/output.txt" | Gxss | kxss | grep -oP '^URL: \K\S+' | sed 's/=.*/=/' | sort -u > "$website_input/output/xss.txt"
echo -e "${YELLOW}✓[2/2] XSS filtering completed${NC}"


# Open Redirect过滤
# Open Redirect filtering
echo -e "${YELLOW}[1/2] Using gf to filter Open Redirect...${NC}"
cat "$website_input/output/output.txt" | gf or | sed 's/=.*/=/' | sort -u > "$website_input/output/open_redirect.txt"
echo -e "${YELLOW}✓[2/2] Open Redirect filtering completed${NC}"

# LFI过滤
# LFI filtering
echo -e "${YELLOW}[1/2] Using gf to filter LFI...${NC}"
cat "$website_input/output/output.txt" | gf lfi | sed 's/=.*/=/' | sort -u > "$website_input/output/lfi.txt"
echo -e "${YELLOW}✓[2/2] LFI filtering completed${NC}"


# SQLi过滤
# SQLi filtering
echo -e "${YELLOW}[1/2] Using gf to filter SQLi...${NC}"
cat "$website_input/output/output.txt" | gf sqli | sed 's/=.*/=/' | sort -u > "$website_input/output/sqli.txt"
echo -e "${YELLOW}✓[2/2] SQLi filtering completed${NC}"


# 结果
# Results
echo -e "${GREEN}Filtering results:${NC}"
echo -e "${GREEN}  - XSS: $website_input/output/xss.txt${NC}"
echo -e "${GREEN}  - Open Redirect: $website_input/output/open_redirect.txt${NC}"
echo -e "${GREEN}  - LFI: $website_input/output/lfi.txt${NC}"
echo -e "${GREEN}  - SQLi: $website_input/output/sqli.txt${NC}"
echo -e "${GREEN}Filtering completed...${NC}"
