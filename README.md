<h3 align="center">
    HackScanner
</h3>



<p align="center">
   <a href="https://github.com/vgoer/HackScanner"><img src="./HackScanner.gif" hight="225" width="450" align="center"/></a>
  <br><a href="README.md">中文</a> | <a href="README_en.md">English</a> | <a href="README_fr.md">Français</a> | <a href="README_ru.md">Русский</a> | <a href="README_jp.md">日本語</a> | <a href="README_ar.md">عربي</a>
  <br><strong>HackScanner</strong><b>黑客</b>快速扫描工具<br>快速扫描常见<b>漏洞</b>
</p>

<br>
<hr>
<br>
<br>

> [!WARNING]  
>**警告：** 
> 
> 本工具仅供学习交流使用，请勿用于非法用途。
> 
> 未经同意擅自使用第三方网站或系统是违法和不道德的。
> 
> `如有出现任何问题，与作者无关`。 

<div align="center">

> **HackScanner** 是一个超级简单使用的黑客工具，快速发现 `LFI` - `OR` - `SQLi` - `XSS` - `CRLF` 漏洞。
> 
> 作者： [`Vgoer`](https://github.com/vgoer) 。

</div>

<br>
<hr>
<br>
<br>

## 1. 功能

| 特征 | 说明 |
|------|------|
| LFI Scanner | 检测本地文件包含漏洞 |
| OR Scanner | 识别开放重定向漏洞 |
| SQL Scanner | 检测 SQL 注入漏洞 |
| XSS Scanner | 识别XSS脚本漏洞 |
| CRLF Scanner | 检测CRLF注入漏洞 |
| Multi-threaded Scanning | 通过多线程提高性能 |
| Customizable Payloads | 调整有效载荷以适合特定目标 |
| Success Criteria | 修改特定用例的成功检测标准 |
| User-friendly CLI | 简单直观的命令行界面 |
| Save Vulnerable URLs | 选择将易受攻击的 URL 保存到文件中以供将来参考 |
| HTML Report Generation | 生成发现的漏洞的详细 HTML 报告 |
| More... | 更多功能开发中... |
| More... | 更多功能开发中... |

<br>
<hr>
<br>
<br>

## 2. 文件介绍

| 文件 | 说明 |
|------|------|
| HackScanner.py | 攻击主脚本 |
| Filter.sh | 快速过滤脚本 |
| Subdomain.sh | 子域名收集脚本 |
| Install.sh | 安装工具包脚本 |


<br>
<hr>
<br>
<br>


## 3. 安装

### 克隆仓库

```bash
git clone https://github.com/vgoer/HackScanner
```
```bash
cd HackScanner
```

### 安装工具包
```bash
sudo ./install.sh
```

### 安装依赖

```bash
# 1. 启动虚拟环境
python3 -m venv venv

# 2. 激活虚拟环境
source venv/bin/activate

# 3. 安装依赖
pip3 install -r requirements.txt
```
### 运行脚本

```bash
python3 HackScanner.py
```

### 子域名扫描工具
```shell
./subdomain.sh
```


### 过滤脚本
```shell
./filter.sh
```


## 4. 感谢

1. Loxs [Loxs](https://github.com/coffinxp/loxs) 项目借鉴了这个项目

----