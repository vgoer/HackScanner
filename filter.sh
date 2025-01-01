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
read -p "请输入主域名: " website_input

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
echo "${RED}您输入的域名: $website_url${NC}"


# katana被动扫描
echo -e "${YELLOW}[1/2] 使用katana被动扫描...${NC}"
echo "$website_url" | katana -fs waybackarchive,commoncrawl,alienvault,urlscan,github,virustotal -f qurl | uro > "$website_input/output.txt"
echo -e "${YELLOW}✓[2/2] katana被动扫描完成${NC}"

# katana主动扫描
echo -e "${YELLOW}[1/2] 使用katana主动扫描...${NC}"
katana -u "$website_url" -d 5 -c 15 -js -silent -timeout 20 -f qurl | uro | anew "$output_dir/output.txt"
echo -e "${YELLOW}✓[2/2] katana主动扫描完成${NC}"

exit;
# XSS
echo "Filtering URLs for potential XSS endpoints..."
cat "$output_dir/output.txt" | Gxss | kxss | grep -oP '^URL: \K\S+' | sed 's/=.*/=/' | sort -u > "$output_dir/xss_output.txt"
echo "Extracting final filtered URLs to $output_dir/xss_output.txt..."

# Open Redirect
echo "Filtering URLs for potential Open Redirect endpoints..."
cat "$output_dir/output.txt" | gf or | sed 's/=.*/=/' | sort -u > "$output_dir/open_redirect_output.txt"

# LFI
echo "Filtering URLs for potential LFI endpoints..."
cat "$output_dir/output.txt" | gf lfi | sed 's/=.*/=/' | sort -u > "$output_dir/lfi_output.txt"

# SQLi
echo "Filtering URLs for potential SQLi endpoints..."
cat "$output_dir/output.txt" | gf sqli | sed 's/=.*/=/' | sort -u > "$output_dir/sqli_output.txt"

# Remove the intermediate file output/output.txt
rm "$output_dir/output.txt"

# Notify the user that all tasks are complete
echo "Filtered URLs have been saved to the respective output files in the 'output' directory:"
echo "  - XSS: $output_dir/xss_output.txt"
echo "  - Open Redirect: $output_dir/open_redirect_output.txt"
echo "  - LFI: $output_dir/lfi_output.txt"
echo "  - SQLi: $output_dir/sqli_output.txt"
