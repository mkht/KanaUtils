# KanaUtils

[![Test](https://github.com/mkht/KanaUtils/actions/workflows/test.yml/badge.svg)](https://github.com/mkht/KanaUtils/actions/workflows/test.yml)

## 概要
PowerShellで日本語のひらがな、カタカナ、ローマ字を扱うための関数群  
ひらがな⇔カタカナの相互変換や、ローマ字への変換機能を提供します


## インストール
[PowerShell Gallery](https://www.powershellgallery.com/packages/KanaUtils) からインストール可能です

```PowerShell
Install-Module -Name KanaUtils
```

## 動作環境
+ Windows PowerShell 3.0 以降
+ PowerShell 7.0 以降 (Windows, macOS and Linux)

## 使い方

- [Convert-KanaToRomaji](#Convert-KanaToRomaji)
- [Convert-HiraganaToKatakana](#Convert-HiraganaToKatakana)
- [Convert-KatakanaToHiragana](#Convert-KatakanaToHiragana)

----
### Convert-KanaToRomaji
全角ひらがな、全角カタカナをヘボン式ローマ字に変換します。

変換方式はパスポート氏名表記用ヘボン式ローマ字に概ね準拠しています。  
  参考: https://www.ezairyu.mofa.go.jp/passport/hebon.html

ローマ字に変換できない文字（記号類、漢字など）が入力文字列に含まれる場合はエラーとなります。  
半角カタカナからローマ字への変換は未対応です。事前に全角カタカナに変換してください。

`v2.0.0`で一部の動作を変更しました。  
人名変換での利用を想定し、一部の文字列に対しては例外的な変換を行います。
```
# v2.0.0 で変更された変換例
いのうえ => inoue     # v1.0.0 では inoe
まつうら => matsuura  # v1.0.0 では matsura
こうちわ => kouchiwa  # v1.0.0 では kochiwa
おおうち => ouchi     # v1.0.0 では ochi
```

#### 使用例

```PowerShell
# カタカナ => ローマ字
PS> Convert-KanaToRomaji 'スズキ イチロー'
suzuki ichiro

# ひらがな => ローマ字
PS> Convert-KanaToRomaji 'みそのう さんぺい'
misono sampei

# パイプライン経由での入力も可能
PS> 'オオノ リョウコ' | Convert-KanaToRomaji
ono ryoko
```

----
### Convert-HiraganaToKatakana
全角ひらがなを全角カタカナに変換します。  
ひらがな以外の文字は変換せずそのまま出力します。

#### 使用例
```PowerShell
# ひらがな => カタカナ
PS> Convert-HiraganaToKatakana 'あかさたなわをん'
アカサタナワヲン

# ひらがな以外の文字は変換しない
PS> Convert-HiraganaToKatakana '漢字 ひらがな カタカナ 0123'
漢字 ヒラガナ カタカナ 0123

# パイプライン経由での入力も可能
PS> 'おちゃのみず' | Convert-HiraganaToKatakana
オチャノミズ
```

----
### Convert-KatakanaToHiragana
全角カタカナを全角ひらがなに変換します。  
カタカナ以外の文字は変換せずそのまま出力します。

#### 使用例
```PowerShell
# カタカナ => ひらがな
PS> Convert-KatakanaToHiragana 'アカサタナワヲン'
あかさたなわをん

# カタカナ以外の文字は変換しない
PS> Convert-KatakanaToHiragana '漢字 ひらがな カタカナ 0123'
漢字 ひらがな かたかな 0123

# パイプライン経由での入力も可能
PS> 'ニッポリ' | Convert-KatakanaToHiragana
にっぽり
```


## Change log
+ **2.0.0**  
  `Convert-KanaToRomaji`
    - 一部の文字列に対して例外的な変換を行うよう変更（イノウエ、マツウラ、オオウチ など）
    - デュ、デャ、デョ をそれぞれ`deyu`、`deya`、`deyo`に変換するよう変更
    - パイプライン入力の不具合を修正

+ **1.0.0**
  - First public release
