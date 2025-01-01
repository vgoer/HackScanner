<h3 align="center">
    HackScanner
</h3>

<p align="center">
   <a href="https://github.com/vgoer/HackScanner"><img src="./HackScanner.gif" hight="225" width="450" align="center"/></a>
  <br><a href="README.md">中文</a> | <a href="README_en.md">English</a> | <a href="README_fr.md">Français</a> | <a href="README_ru.md">Русский</a> | <a href="README_jp.md">日本語</a> | <a href="README_ar.md">عربي</a>
  <br><strong>HackScanner</strong> - Un Outil Rapide de Scan de Vulnérabilités<br>Scannez rapidement les vulnérabilités courantes
</p>

<br>
<hr>
<br>
<br>

> [!WARNING]  
>**Avertissement :** 
> 
> Cet outil est destiné uniquement à des fins éducatives et de recherche. Ne pas utiliser à des fins illégales.
> 
> L'accès non autorisé aux sites Web ou systèmes tiers est illégal et contraire à l'éthique.
> 
> `L'auteur n'assume aucune responsabilité en cas d'utilisation abusive de cet outil.`

<div align="center">

> **HackScanner** est un outil de piratage super simple qui découvre rapidement les vulnérabilités `LFI` - `OR` - `SQLi` - `XSS` - `CRLF`.
> 
> Auteur : [`Vgoer`](https://github.com/vgoer)

</div>

<br>
<hr>
<br>
<br>

## 1. Fonctionnalités

| Fonctionnalité | Description |
|----------------|-------------|
| Scanner LFI | Détecte les vulnérabilités d'inclusion de fichiers locaux |
| Scanner OR | Identifie les vulnérabilités de redirection ouverte |
| Scanner SQL | Détecte les vulnérabilités d'injection SQL |
| Scanner XSS | Identifie les vulnérabilités de script intersite |
| Scanner CRLF | Détecte les vulnérabilités d'injection CRLF |
| Scan Multi-thread | Améliore les performances grâce au multi-threading |
| Charges utiles personnalisables | Ajustez les charges utiles selon les cibles spécifiques |
| Critères de succès | Modifiez les critères de détection de succès pour des cas d'utilisation spécifiques |
| CLI conviviale | Interface en ligne de commande simple et intuitive |
| Sauvegarde des URLs vulnérables | Option pour sauvegarder les URLs vulnérables dans un fichier |
| Génération de rapport HTML | Génère des rapports HTML détaillés des vulnérabilités trouvées |
| Plus... | Plus de fonctionnalités en développement... |
| Plus... | Plus de fonctionnalités en développement... |

<br>
<hr>
<br>
<br>

## 2. Description des Fichiers

| Fichier | Description |
|---------|-------------|
| HackScanner.py | Script principal de scan |
| Filter.sh | Script de filtrage rapide |
| Subdomain.sh | Script de collecte de sous-domaines |
| Install.sh | Script d'installation des paquets |

<br>
<hr>
<br>
<br>

## 3. Installation

### Cloner le Dépôt

```bash
git clone https://github.com/vgoer/HackScanner
```
```bash
cd HackScanner
```

### Installer le Paquet d'Outils
```bash
./install.sh
```

### Installer les Dépendances

```bash
# 1. Créer un environnement virtuel
python3 -m venv venv

# 2. Activer l'environnement virtuel
source venv/bin/activate

# 3. Installer les dépendances
pip3 install -r requirements.txt
```

### Exécuter le Script

```bash
python3 HackScanner.py
```

### Outil de Scan de Sous-domaines
```shell
./subdomain.sh
```

### Script de Filtrage
```shell
./filter.sh
```

## 4. Remerciements

1. Ce projet a été inspiré par Loxs [Loxs](https://github.com/coffinxp/loxs)

----