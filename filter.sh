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
echo -e "${BLUE}"
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
read -p "请输入域名: " website_input

# 创建输出目录
if [ ! -d "$website_input/output" ]; then
    if ! mkdir -p "$website_input/output"; then
        echo "错误：无法创建输出目录 '$website_input/output'"
        exit 1
    fi
fi

# 添加协议头
if [[ ! $website_input =~ ^https?:// ]]; then
    website_url="https://$website_input"
else
    website_url="$website_input"
fi
# 您输入的域名
echo -e "${RED}您输入的域名: $website_url${NC}"


# katana被动扫描
echo -e "${YELLOW}[1/2] 使用katana被动扫描...${NC}"
echo "$website_url" | katana -fs waybackarchive,commoncrawl,alienvault,urlscan,github,virustotal -f qurl | uro > "$website_input/output/output.txt"
echo -e "${YELLOW}✓[2/2] katana被动扫描完成${NC}"

# katana主动扫描
echo -e "${YELLOW}[1/2] 使用katana主动扫描...${NC}"
katana -u "$website_url" -d 5 -c 15 -f qurl | uro | anew "$website_input/output/output.txt"
echo -e "${YELLOW}✓[2/2] katana主动扫描完成${NC}"

# XSS
echo -e "${YELLOW}[1/2] 使用Gxss和kxss过滤XSS...${NC}"
cat "$website_input/output/output.txt" | Gxss | kxss | grep -oP '^URL: \K\S+' | sed 's/=.*/=/' | sort -u > "$website_input/output/xss.txt"
echo -e "${YELLOW}✓[2/2] 过滤XSS完成${NC}"

# Open Redirect
echo -e "${YELLOW}[1/2] 使用gf过滤Open Redirect...${NC}"
cat "$website_input/output/output.txt" | gf or | sed 's/=.*/=/' | sort -u > "$website_input/output/open_redirect.txt"
echo -e "${YELLOW}✓[2/2] 过滤Open Redirect完成${NC}"

# LFI
echo -e "${YELLOW}[1/2] 使用gf过滤LFI...${NC}"
cat "$website_input/output/output.txt" | gf lfi | sed 's/=.*/=/' | sort -u > "$website_input/output/lfi.txt"
echo -e "${YELLOW}✓[2/2] 过滤LFI完成${NC}"

# SQLi
echo -e "${YELLOW}[1/2] 使用gf过滤SQLi...${NC}"
cat "$website_input/output/output.txt" | gf sqli | sed 's/=.*/=/' | sort -u > "$website_input/output/sqli.txt"
echo -e "${YELLOW}✓[2/2] 过滤SQLi完成${NC}"


# 结果
echo -e "${GREEN}过滤结果:${NC}"
echo -e "${GREEN}  - XSS: $website_input/output/xss.txt${NC}"
echo -e "${GREEN}  - Open Redirect: $website_input/output/open_redirect.txt${NC}"
echo -e "${GREEN}  - LFI: $website_input/output/lfi.txt${NC}"
echo -e "${GREEN}  - SQLi: $website_input/output/sqli.txt${NC}"
echo -e "${RED}过滤完成...${NC}"
