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

返還方式はパスポート氏名表記用ヘボン式ローマ字に概ね準拠しています。  
  参考: https://www.ezairyu.mofa.go.jp/passport/hebon.html

> ただし、長音ではないoオ, oウ, uウの変換には対応していません。  
> かな表記のみからではこれらを長音か否か判定できないためです。  
> 例えば 松浦（まつうら） は本来 mats**uu**ra と表記されますが、この関数では mats**u**ra と出力します

ローマ字に変換できない文字（記号類、漢字など）が入力文字列に含まれる場合はエラーとなります。  
半角カタカナからローマ字への変換は未対応です。事前に全角カタカナに変換してください。


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
+ **1.0.0**
  - First public release
