#!/bin/bash
#|---/ /+--------------------------+-----/ /|#
#|--/ /-|    installation script     |--/ /-|#
#|-/ /--|        安装脚本             |-/ /--|#
#|/ /---+---------------------------+/ /---|#




# 安装基本工具
cat << "EOF"

-------------------------------------------------
 ___   __    _  _______  _______  _______  ___      ___     
|   | |  |  | ||       ||       ||   _   ||   |    |   |    
|   | |   |_| ||  _____||_     _||  |_|  ||   |    |   |    
|   | |       || |_____   |   |  |       ||   |    |   |    
|   | |  _    ||_____  |  |   |  |       ||   |___ |   |___ 
|   | | | |   | _____| |  |   |  |   _   ||       ||       |
|___| |_|  |__||_______|  |___|  |__| |__||_______||_______|
-------------------------------------------------
                                v1.0.0 - @vgoer
EOF

sudo apt update -y
sudo apt upgrade -y
sudo apt install golang jq git python3 python3-pip pipx -y

# 将 Go 环境变量配置追加到 .zshrc 文件
cat << 'EOF' >> ~/.zshrc

# Go 环境变量配置
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
EOF
source ~/.zshrc



# 安装google和驱动
cat << "EOF"
                              _
  _____  ____   ____   ____ | | ____
 / ____|/ __ \ / __ \ / __ \| |/ ___|
| |  __| |  | | |  | | |  | | | |___
| | |_ | |  | | |  | | |  | | |  ___|
| |__| | |__| | |__| | |__| | | |___
 \_____|\____/ \____/ \____/|_|\____|

EOF

# 下载 Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# 安装必要的依赖
sudo apt install libxss1 xdg-utils -y

# 强制安装依赖
sudo apt -f install -y

# 安装 Chrome
sudo dpkg -i google-chrome-stable_current_amd64.deb

# 清理下载文件
rm google-chrome-stable_current_amd64.deb

# 驱动
wget https://storage.googleapis.com/chrome-for-testing-public/128.0.6613.119/linux64/chromedriver-linux64.zip
unzip chromedriver-linux64.zip
cd chromedriver-linux64 
sudo mv chromedriver /usr/bin

# 清理下载文件
cd ..
rm -rf chromedriver-linux64.zip chromedriver-linux64



# 子域名安装工具

cat << "EOF"

               _      __ _           _           
              | |    / _(_)         | |          
 ___ _   _  __| |__ | |_ _ _ __   __| | ___ _ __ 
/ __| | | |/ _` '_ \|  _| | '_ \ / _` |/ _ \ '__|
\__ \ |_| | (_| |_) | | | | | | | (_| |  __/ |   
|___/\__,_|\__,_.__/|_| |_|_| |_|\__,_|\___|_|   
                                                  
EOF
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
sudo apt install httpx-toolkit -y



# 端口扫描工具
cat << "EOF"

  ____  _____  _____ _   _    _____   ____  _____ _______ 
 / __ \|  __ \|  ___| \ | |  |  __ \ / __ \|  __ \__   __|
| |  | | |__) | |__ |  \| |  | |__) | |  | | |__) | | |   
| |  | |  ___/|  __|| . ` |  |  ___/| |  | |  _  /  | |   
| |__| | |    | |___| |\  |  | |    | |__| | | \ \  | |   
 \____/|_|    |_____|_| \_|  |_|     \____/|_|  \_\ |_|   
                                                           
EOF
# 安装 为缺少 libpcap 开发库
sudo apt-get install libpcap-dev -y
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest




# 扫描工具
cat << "EOF"
 _______ ____   ____  _      _____ 
|__   __/ __ \ / __ \| |    / ____|
   | | | |  | | |  | | |   | (___  
   | | | |  | | |  | | |    \___ \ 
   | | | |__| | |__| | |________) |
   |_|  \____/ \____/|______|____/ 
                                   
EOF
go install github.com/projectdiscovery/katana/cmd/katana@latest
sudo apt install pipx -y
# uro url提取
pipx install uro
# anew 文件合并
go install -v github.com/tomnomnom/anew@latest
# xss
go install github.com/KathanP19/Gxss@latest
# kxss
go install github.com/Emoe/kxss@latest
# gf 
go install github.com/tomnomnom/gf@latest
# waybackurls 知道域名下的url
go install github.com/tomnomnom/waybackurls@latest
# krawler 爬虫
go install github.com/hakluke/hakrawler@latest
# unfurl 解析url
go install github.com/tomnomnom/unfurl@latest



echo -e "\033[32m[0/0] Install Finshed...\033[0m"
