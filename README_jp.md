<h3 align="center">
    HackScanner
</h3>

<p align="center">
   <a href="https://github.com/vgoer/HackScanner"><img src="./HackScanner.gif" hight="225" width="450" align="center"/></a>
  <br><a href="README.md">中文</a> | <a href="README_en.md">English</a> | <a href="README_fr.md">Français</a> | <a href="README_ru.md">Русский</a> | <a href="README_jp.md">日本語</a> | <a href="README_ar.md">عربي</a>
  <br><strong>HackScanner</strong> - 高速な脆弱性スキャンツール<br>一般的な脆弱性を素早くスキャン
</p>

<br>
<hr>
<br>
<br>

> [!WARNING]  
>**警告：** 
> 
> このツールは教育および研究目的のみを意図しています。違法な目的での使用は禁止されています。
> 
> 第三者のウェブサイトやシステムへの不正アクセスは違法かつ非倫理的です。
> 
> `作者は本ツールの誤用に対して一切の責任を負いません。`

<div align="center">

> **HackScanner** は `LFI` - `OR` - `SQLi` - `XSS` - `CRLF` の脆弱性を素早く発見する超シンプルなハッキングツールです。
> 
> 作者：[`Vgoer`](https://github.com/vgoer)

</div>

<br>
<hr>
<br>
<br>

## 1. 機能

| 機能 | 説明 |
|------|------|
| LFIスキャナー | ローカルファイルインクルージョンの脆弱性を検出 |
| ORスキャナー | オープンリダイレクトの脆弱性を特定 |
| SQLスキャナー | SQLインジェクションの脆弱性を検出 |
| XSSスキャナー | クロスサイトスクリプティングの脆弱性を特定 |
| CRLFスキャナー | CRLFインジェクションの脆弱性を検出 |
| マルチスレッドスキャン | マルチスレッドによるパフォーマンス向上 |
| カスタマイズ可能なペイロード | 特定のターゲットに合わせてペイロードを調整 |
| 成功基準 | 特定のユースケースに合わせて検出基準を変更 |
| ユーザーフレンドリーなCLI | シンプルで直感的なコマンドラインインターフェース |
| 脆弱なURLの保存 | 脆弱性のあるURLをファイルに保存するオプション |
| HTMLレポート生成 | 発見された脆弱性の詳細なHTMLレポートを生成 |
| その他... | より多くの機能を開発中... |
| その他... | より多くの機能を開発中... |

<br>
<hr>
<br>
<br>

## 2. ファイル説明

| ファイル | 説明 |
|---------|------|
| HackScanner.py | メインスキャンスクリプト |
| Filter.sh | クイックフィルタリングスクリプト |
| Subdomain.sh | サブドメイン収集スクリプト |
| Install.sh | ツールパッケージインストールスクリプト |

<br>
<hr>
<br>
<br>

## 3. インストール

### リポジトリのクローン

```bash
git clone https://github.com/vgoer/HackScanner
```
```bash
cd HackScanner
```

### ツールパッケージのインストール
```bash
./install.sh
```

### 依存関係のインストール

```bash
# 1. 仮想環境の作成
python3 -m venv venv

# 2. 仮想環境の有効化
source venv/bin/activate

# 3. 依存関係のインストール
pip3 install -r requirements.txt
```

### スクリプトの実行

```bash
python3 HackScanner.py
```

### サブドメインスキャンツール
```shell
./subdomain.sh
```

### フィルタースクリプト
```shell
./filter.sh
```

## 4. 謝辞

1. このプロジェクトは Loxs [Loxs](https://github.com/coffinxp/loxs) にインスパイアされました

----