<#
.SYNOPSIS
ひらがな/カタカナをヘボン式ローマ字に変換します

.DESCRIPTION
ひらがな/カタカナをヘボン式ローマ字(英小文字)に変換します

パスポート氏名表記用ヘボン式ローマ字に概ね準拠しています
  参考: https://www.ezairyu.mofa.go.jp/passport/hebon.html

ただし、長音ではないoオ, oウ, uウの変換には対応していません
かな表記のみからではこれらを長音か否か判定できないためです
例えば 松浦（まつうら） は本来 matsuura と表記されますが、この関数では matsura と出力します

ローマ字に変換できない文字（記号類、漢字など）が入力文字列に含まれる場合はエラーとなります

.PARAMETER Kana
ローマ字に変換するひらがなorカタカナ

.EXAMPLE
PS> Convert-KanaToRomaji -Kana 'ミノソウ コウタ'
minoso kota
#>
function Convert-KanaToRomaji {
    [CmdletBinding()]
    [OutputType([string])]
    param (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline = $true)]
        [AllowEmptyString()]
        [string] $Kana
    )

    if ([string]::IsNullOrEmpty($Kana)) {
        return $Kana
    }

    # ひらがな=>カタカナ変換
    $Romaji = Convert-HiraganaToKatakana -Hiragana $Kana

    # 拗音=>ローマ字変換
    $Romaji = $Romaji.Replace('キャ', 'kya')
    $Romaji = $Romaji.Replace('キュ', 'kyu')
    $Romaji = $Romaji.Replace('キョ', 'kyo')
    $Romaji = $Romaji.Replace('シャ', 'sha')
    $Romaji = $Romaji.Replace('シュ', 'shu')
    $Romaji = $Romaji.Replace('ショ', 'sho')
    $Romaji = $Romaji.Replace('チャ', 'cha')
    $Romaji = $Romaji.Replace('チュ', 'chu')
    $Romaji = $Romaji.Replace('チョ', 'cho')
    $Romaji = $Romaji.Replace('ニャ', 'nya')
    $Romaji = $Romaji.Replace('ニュ', 'nyu')
    $Romaji = $Romaji.Replace('ニョ', 'nyo')
    $Romaji = $Romaji.Replace('ヒャ', 'hya')
    $Romaji = $Romaji.Replace('ヒュ', 'hyu')
    $Romaji = $Romaji.Replace('ヒョ', 'hyo')
    $Romaji = $Romaji.Replace('ミャ', 'mya')
    $Romaji = $Romaji.Replace('ミュ', 'myu')
    $Romaji = $Romaji.Replace('ミョ', 'myo')
    $Romaji = $Romaji.Replace('リャ', 'rya')
    $Romaji = $Romaji.Replace('リュ', 'ryu')
    $Romaji = $Romaji.Replace('リョ', 'ryo')
    $Romaji = $Romaji.Replace('ギャ', 'gya')
    $Romaji = $Romaji.Replace('ギュ', 'gyu')
    $Romaji = $Romaji.Replace('ギョ', 'gyo')
    $Romaji = $Romaji.Replace('ジャ', 'ja')
    $Romaji = $Romaji.Replace('ジュ', 'ju')
    $Romaji = $Romaji.Replace('ジョ', 'jo')
    $Romaji = $Romaji.Replace('デャ', 'ja')
    $Romaji = $Romaji.Replace('デュ', 'ju')
    $Romaji = $Romaji.Replace('デョ', 'jo')
    $Romaji = $Romaji.Replace('ビャ', 'bya')
    $Romaji = $Romaji.Replace('ビュ', 'byu')
    $Romaji = $Romaji.Replace('ビョ', 'byo')
    $Romaji = $Romaji.Replace('ピャ', 'pya')
    $Romaji = $Romaji.Replace('ピュ', 'pyu')
    $Romaji = $Romaji.Replace('ピョ', 'pyo')

    # 外国式氏名=>ローマ字変換
    $Romaji = $Romaji.Replace('シェ', 'shie')
    $Romaji = $Romaji.Replace('ジェ', 'jie')
    $Romaji = $Romaji.Replace('チェ', 'chie')
    $Romaji = $Romaji.Replace('ティ', 'tei')
    $Romaji = $Romaji.Replace('ディ', 'dei')
    $Romaji = $Romaji.Replace('デュ', 'deyu')
    $Romaji = $Romaji.Replace('ファ', 'fua')
    $Romaji = $Romaji.Replace('フィ', 'fui')
    $Romaji = $Romaji.Replace('フェ', 'fue')
    $Romaji = $Romaji.Replace('フォ', 'fuo')
    $Romaji = $Romaji.Replace('ヴァ', 'bua')
    $Romaji = $Romaji.Replace('ヴィ', 'bui')
    $Romaji = $Romaji.Replace('ヴェ', 'bue')
    $Romaji = $Romaji.Replace('ヴォ', 'buo')
    $Romaji = $Romaji.Replace('ヴ', 'bu')

    # 50音=>ローマ字変換
    $Romaji = $Romaji.Replace('ア', 'a')
    $Romaji = $Romaji.Replace('イ', 'i')
    $Romaji = $Romaji.Replace('ウ', 'u')
    $Romaji = $Romaji.Replace('エ', 'e')
    $Romaji = $Romaji.Replace('オ', 'o')
    $Romaji = $Romaji.Replace('カ', 'ka')
    $Romaji = $Romaji.Replace('キ', 'ki')
    $Romaji = $Romaji.Replace('ク', 'ku')
    $Romaji = $Romaji.Replace('ケ', 'ke')
    $Romaji = $Romaji.Replace('コ', 'ko')
    $Romaji = $Romaji.Replace('サ', 'sa')
    $Romaji = $Romaji.Replace('シ', 'shi')
    $Romaji = $Romaji.Replace('ス', 'su')
    $Romaji = $Romaji.Replace('セ', 'se')
    $Romaji = $Romaji.Replace('ソ', 'so')
    $Romaji = $Romaji.Replace('タ', 'ta')
    $Romaji = $Romaji.Replace('チ', 'chi')
    $Romaji = $Romaji.Replace('ツ', 'tsu')
    $Romaji = $Romaji.Replace('テ', 'te')
    $Romaji = $Romaji.Replace('ト', 'to')
    $Romaji = $Romaji.Replace('ナ', 'na')
    $Romaji = $Romaji.Replace('ニ', 'ni')
    $Romaji = $Romaji.Replace('ヌ', 'nu')
    $Romaji = $Romaji.Replace('ネ', 'ne')
    $Romaji = $Romaji.Replace('ノ', 'no')
    $Romaji = $Romaji.Replace('ハ', 'ha')
    $Romaji = $Romaji.Replace('ヒ', 'hi')
    $Romaji = $Romaji.Replace('フ', 'fu')
    $Romaji = $Romaji.Replace('ヘ', 'he')
    $Romaji = $Romaji.Replace('ホ', 'ho')
    $Romaji = $Romaji.Replace('マ', 'ma')
    $Romaji = $Romaji.Replace('ミ', 'mi')
    $Romaji = $Romaji.Replace('ム', 'mu')
    $Romaji = $Romaji.Replace('メ', 'me')
    $Romaji = $Romaji.Replace('モ', 'mo')
    $Romaji = $Romaji.Replace('ヤ', 'ya')
    $Romaji = $Romaji.Replace('ユ', 'yu')
    $Romaji = $Romaji.Replace('ヨ', 'yo')
    $Romaji = $Romaji.Replace('ラ', 'ra')
    $Romaji = $Romaji.Replace('リ', 'ri')
    $Romaji = $Romaji.Replace('ル', 'ru')
    $Romaji = $Romaji.Replace('レ', 're')
    $Romaji = $Romaji.Replace('ロ', 'ro')
    $Romaji = $Romaji.Replace('ワ', 'wa')
    $Romaji = $Romaji.Replace('ヲ', 'o')
    $Romaji = $Romaji.Replace('ン', 'n')

    # 濁音・半濁音=>ローマ字変換
    $Romaji = $Romaji.Replace('ガ', 'ga')
    $Romaji = $Romaji.Replace('ギ', 'gi')
    $Romaji = $Romaji.Replace('グ', 'gu')
    $Romaji = $Romaji.Replace('ゲ', 'ge')
    $Romaji = $Romaji.Replace('ゴ', 'go')
    $Romaji = $Romaji.Replace('ザ', 'za')
    $Romaji = $Romaji.Replace('ジ', 'ji')
    $Romaji = $Romaji.Replace('ズ', 'zu')
    $Romaji = $Romaji.Replace('ゼ', 'ze')
    $Romaji = $Romaji.Replace('ゾ', 'zo')
    $Romaji = $Romaji.Replace('ダ', 'da')
    $Romaji = $Romaji.Replace('ヂ', 'ji')
    $Romaji = $Romaji.Replace('ヅ', 'zu')
    $Romaji = $Romaji.Replace('デ', 'de')
    $Romaji = $Romaji.Replace('ド', 'do')
    $Romaji = $Romaji.Replace('バ', 'ba')
    $Romaji = $Romaji.Replace('ビ', 'bi')
    $Romaji = $Romaji.Replace('ブ', 'bu')
    $Romaji = $Romaji.Replace('ベ', 'be')
    $Romaji = $Romaji.Replace('ボ', 'bo')
    $Romaji = $Romaji.Replace('パ', 'pa')
    $Romaji = $Romaji.Replace('ピ', 'pi')
    $Romaji = $Romaji.Replace('プ', 'pu')
    $Romaji = $Romaji.Replace('ペ', 'pe')
    $Romaji = $Romaji.Replace('ポ', 'po')

    # 小文字=>ローマ字変換
    $Romaji = $Romaji.Replace('ァ', 'a')
    $Romaji = $Romaji.Replace('ィ', 'i')
    $Romaji = $Romaji.Replace('ゥ', 'u')
    $Romaji = $Romaji.Replace('ェ', 'e')
    $Romaji = $Romaji.Replace('ォ', 'o')
    $Romaji = $Romaji.Replace('ャ', 'ya')
    $Romaji = $Romaji.Replace('ュ', 'yu')
    $Romaji = $Romaji.Replace('ョ', 'yo')

    # 全角スペース => 半角スペース変換
    $Romaji = $Romaji.Replace('　', ' ')

    # 撥音例外：B、M、Pの前の「ン」は、NではなくMで表記
    $Romaji = $Romaji.Replace('nb', 'mb')
    $Romaji = $Romaji.Replace('nm', 'mm')
    $Romaji = $Romaji.Replace('np', 'mp')

    # 長音：「ー」省略
    $Romaji = $Romaji.Replace('ー', '')
    # 長音：「オ」を含む長音「オウ」の場合「OU」は表記しない
    $Romaji = $Romaji.Replace('ou', 'o')
    # 長音：「ウ」を含む長音「ウウ」の場合「UU」は表記しない
    $Romaji = $Romaji.Replace('uu', 'u')

    $startIdx = 0
    while (($idx = $Romaji.IndexOf('oo', $startIdx)) -ge 0) {
        $startIdx = $idx + 1
        if (($idx -eq $Romaji.Length - 2) -or ($Romaji[$idx + 2] -match '\s')) {
            # 長音例外：末尾が「オオ」音の場合「OO」と表記
            continue
        }
        else {
            # 長音：「オ」を含む長音「オオ」の場合「OO」は表記しない
            $Romaji = $Romaji.Remove($Idx, 2)
            $Romaji = $Romaji.Insert($Idx, 'o')
        }
    }

    $startIdx = 0
    while (($idx = $Romaji.IndexOf('ッ', $startIdx)) -ge 0) {
        $startIdx = $idx + 1
        if (($idx -eq $Romaji.Length - 1) -or ($Romaji[$idx + 1] -match '\s')) {
            #促音例外：末尾が「ッ」の場合「tsu」と表記
            $Romaji = $Romaji.Remove($Idx, 1)
            $Romaji = $Romaji.Insert($Idx, 'tsu')
        }
        elseif ($Romaji[$Idx + 1] -eq 'ッ') {
            #促音例外：「ッ」の後に「ッ」が続く場合は、「tsu」と表記
            $Romaji = $Romaji.Remove($Idx, 1)
            $Romaji = $Romaji.Insert($Idx, 'tsu')
        }
        elseif ((-join $Romaji[(($Idx + 1)..($Idx + 3))]) -match '^ch[iauo]$') {
            #促音例外：チ（CHI）、チャ（CHA）、チュ（CHU）、チョ（CHO）音の前には「T」を表記
            $Romaji = $Romaji.Remove($Idx, 1)
            $Romaji = $Romaji.Insert($Idx, 't')
        }
        else {
            #促音：子音を重ねて表記
            $after = [char]$Romaji[$Idx + 1]
            $Romaji = $Romaji.Remove($Idx, 1)
            $Romaji = $Romaji.Insert($Idx, $after)
        }
    }

    if ($Romaji -notmatch '^[a-z0-9\s]*$') {
        Write-Error 'ローマ字に変換できない文字が含まれています'
    }

    return $Romaji
}

function Convert-HiraganaToKatakana {
    [CmdletBinding()]
    [OutputType([string])]
    param (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline = $true)]
        [AllowEmptyString()]
        [string] $Hiragana
    )

    Process {
        if ([string]::IsNullOrEmpty($Hiragana)) {
            return $Hiragana
        }
        $CharArray = $Hiragana.ToCharArray()
        for ($i = 0; $i -lt $CharArray.Count; $i++) {
            # U+3041 - U+3096
            if ($CharArray[$i] -ge 'ぁ' -and $CharArray[$i] -le 'ゖ') {
                $CharArray[$i] = [char](0x0060 + $CharArray[$i])
            }
        }
        [string]::new($CharArray)
    }
}

function Convert-KatakanaToHiragana {
    [CmdletBinding()]
    [OutputType([string])]
    param (
        [Parameter(Mandatory, Position = 0, ValueFromPipeline = $true)]
        [AllowEmptyString()]
        [string] $Katakana
    )

    Process {
        if ([string]::IsNullOrEmpty($Katakana)) {
            return $Katakana
        }
        $CharArray = $Katakana.ToCharArray()
        for ($i = 0; $i -lt $CharArray.Count; $i++) {
            # U+30A1 - U+30F6
            if ($CharArray[$i] -ge 'ァ' -and $CharArray[$i] -le 'ヶ') {
                $CharArray[$i] = [char](-0x0060 + $CharArray[$i])
            }
        }
        [string]::new($CharArray)
    }
}

Export-ModuleMember -Function (
    'Convert-KanaToRomaji',
    'Convert-HiraganaToKatakana',
    'Convert-KatakanaToHiragana'
)
