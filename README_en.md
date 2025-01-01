<h3 align="center">
    HackScanner
</h3>

<p align="center">
   <a href="https://github.com/vgoer/HackScanner"><img src="./HackScanner.gif" hight="225" width="450" align="center"/></a>
  <br><a href="README.md">中文</a> | <a href="README_en.md">English</a> | <a href="README_fr.md">Français</a> | <a href="README_ru.md">Русский</a> | <a href="README_jp.md">日本語</a> | <a href="README_ar.md">عربي</a>
  <br><strong>HackScanner</strong> - A Fast Vulnerability Scanning Tool<br>Quickly scan for common vulnerabilities
</p>

<br>
<hr>
<br>
<br>

> [!WARNING]  
>**Warning:** 
> 
> This tool is for educational and research purposes only. Do not use for illegal purposes.
> 
> Unauthorized access to third-party websites or systems is illegal and unethical.
> 
> `The author bears no responsibility for any misuse of this tool.`

<div align="center">

> **HackScanner** is a super simple hacking tool that quickly discovers `LFI` - `OR` - `SQLi` - `XSS` - `CRLF` vulnerabilities.
> 
> Author: [`Vgoer`](https://github.com/vgoer)

</div>

<br>
<hr>
<br>
<br>

## 1. Features

| Feature | Description |
|---------|-------------|
| LFI Scanner | Detect Local File Inclusion vulnerabilities |
| OR Scanner | Identify Open Redirect vulnerabilities |
| SQL Scanner | Detect SQL Injection vulnerabilities |
| XSS Scanner | Identify Cross-Site Scripting vulnerabilities |
| CRLF Scanner | Detect CRLF Injection vulnerabilities |
| Multi-threaded Scanning | Improve performance through multi-threading |
| Customizable Payloads | Adjust payloads to suit specific targets |
| Success Criteria | Modify success detection criteria for specific use cases |
| User-friendly CLI | Simple and intuitive command-line interface |
| Save Vulnerable URLs | Option to save vulnerable URLs to file for future reference |
| HTML Report Generation | Generate detailed HTML reports of found vulnerabilities |
| More... | More features in development... |
| More... | More features in development... |

<br>
<hr>
<br>
<br>

## 2. File Description

| File | Description |
|------|-------------|
| HackScanner.py | Main scanning script |
| Filter.sh | Quick filtering script |
| Subdomain.sh | Subdomain collection script |
| Install.sh | Tool package installation script |

<br>
<hr>
<br>
<br>

## 3. Installation

### Clone Repository

```bash
git clone https://github.com/vgoer/HackScanner
```
```bash
cd HackScanner
```

### Install Tool Package
```bash
./install.sh
```

### Install Dependencies

```bash
# 1. Create virtual environment
python3 -m venv venv

# 2. Activate virtual environment
source venv/bin/activate

# 3. Install dependencies
pip3 install -r requirements.txt
```

### Run Script

```bash
python3 HackScanner.py
```

### Subdomain Scanning Tool
```shell
./subdomain.sh
```

### Filter Script
```shell
./filter.sh
```

## 4. Acknowledgments

1. This project was inspired by Loxs [Loxs](https://github.com/coffinxp/loxs)

----