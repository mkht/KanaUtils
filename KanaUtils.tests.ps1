#Requires -Module @{ ModuleName = 'Pester'; ModuleVersion = '5.1.0' }

Import-Module .\KanaUtils.psm1 -Force

InModuleScope KanaUtils {
    Describe 'Convert-KanaToRomaji' {
        It '(empty string) => (empty string)' {
            $Kana = ''
            $Expect = ''
            Convert-KanaToRomaji -Kana $Kana | Should -BeExactly $Expect
        }

        It 'あいうえお => aiueo' {
            $Kana = 'あいうえお'
            $Expect = 'aiueo'
            Convert-KanaToRomaji -Kana $Kana | Should -BeExactly $Expect
        }

        It 'あ　お => a o' {
            $Kana = 'あ　お'
            $Expect = 'a o'
            Convert-KanaToRomaji -Kana $Kana | Should -BeExactly $Expect
        }

        It 'カキクケコワヲン => kakikukekowaon' {
            $Kana = 'カキクケコワヲン'
            $Expect = 'kakikukekowaon'
            Convert-KanaToRomaji -Kana $Kana | Should -BeExactly $Expect
        }

        It 'カンダ ジュン => kanda jun' {
            $Kana = 'カンダ ジュン'
            $Expect = 'kanda jun'
            Convert-KanaToRomaji -Kana $Kana | Should -BeExactly $Expect
        }

        It 'ナンバ サンペイ => namba sampei' {
            $Kana = 'ナンバ サンペイ'
            $Expect = 'namba sampei'
            Convert-KanaToRomaji -Kana $Kana | Should -BeExactly $Expect
        }

        It 'ハットリ ハッチョウ => hattori hatcho' {
            $Kana = 'ハットリ ハッチョウ'
            $Expect = 'hattori hatcho'
            Convert-KanaToRomaji -Kana $Kana | Should -BeExactly $Expect
        }

        It 'ニーナ => nina' {
            $Kana = 'ニーナ'
            $Expect = 'nina'
            Convert-KanaToRomaji -Kana $Kana | Should -BeExactly $Expect
        }

        It 'ニイナ => niina' {
            $Kana = 'ニイナ'
            $Expect = 'niina'
            Convert-KanaToRomaji -Kana $Kana | Should -BeExactly $Expect
        }

        It 'ヒュウガ ユウキ => hyuga yuki' {
            $Kana = 'ヒュウガ ユウキ'
            $Expect = 'hyuga yuki'
            Convert-KanaToRomaji -Kana $Kana | Should -BeExactly $Expect
        }

        It 'コウタ リョウコ => kota ryoko' {
            $Kana = 'コウタ リョウコ'
            $Expect = 'kota ryoko'
            Convert-KanaToRomaji -Kana $Kana | Should -BeExactly $Expect
        }

        It 'オノ オオノ オオコウチ => ono ono okochi' {
            $Kana = 'オノ オオノ オオコウチ'
            $Expect = 'ono ono okochi'
            Convert-KanaToRomaji -Kana $Kana | Should -BeExactly $Expect
        }

        It 'セノオ タカトオ => senoo takatoo' {
            $Kana = 'セノオ タカトオ'
            $Expect = 'senoo takatoo'
            Convert-KanaToRomaji -Kana $Kana | Should -BeExactly $Expect
        }

        It 'ミソノウ タカトウ => misono takato' {
            $Kana = 'ミソノウ タカトウ'
            $Expect = 'misono takato'
            Convert-KanaToRomaji -Kana $Kana | Should -BeExactly $Expect
        }

        It 'ヴィヴィアン チャギュン => buibuian chagyun' {
            $Kana = 'ヴィヴィアン チャギュン'
            $Expect = 'buibuian chagyun'
            Convert-KanaToRomaji -Kana $Kana | Should -BeExactly $Expect
        }

        It '吉田 タケシ => ERROR' {
            $Kana = '吉田 タケシ'
            $Expect = '吉田 takeshi'
            { Convert-KanaToRomaji -Kana $Kana -ErrorAction Stop } | Should -Throw
            Convert-KanaToRomaji -Kana $Kana -ErrorAction SilentlyContinue | Should -BeExactly $Expect
        }
    }

    Describe 'Convert-HiraganaToKatakana' {
        It '(empty string) => (empty string)' {
            $Kana = ''
            $Expect = ''
            Convert-HiraganaToKatakana -Hiragana $Kana | Should -BeExactly $Expect
        }

        It 'あいうえお => アイウエオ' {
            $Kana = 'あいうえお'
            $Expect = 'アイウエオ'
            Convert-HiraganaToKatakana -Hiragana $Kana | Should -BeExactly $Expect
        }

        It 'ちゃん・ぐんそく => チャン・グンソク' {
            $Kana = 'ちゃん・ぐんそく'
            $Expect = 'チャン・グンソク'
            Convert-HiraganaToKatakana -Hiragana $Kana | Should -BeExactly $Expect
        }

        It '吉田　alphaX09 ワをン　ナにヌねノ => 吉田　alphaX09 ワヲン　ナニヌネノ' {
            $Kana = '吉田　alphaX09 ワをン　ナにヌねノ'
            $Expect = '吉田　alphaX09 ワヲン　ナニヌネノ'
            Convert-HiraganaToKatakana -Hiragana $Kana | Should -BeExactly $Expect
        }
    }

    Describe 'Convert-KatakanaToHiragana' {
        It '(empty string) => (empty string)' {
            $Kana = ''
            $Expect = ''
            Convert-KatakanaToHiragana -Katakana $Kana | Should -BeExactly $Expect
        }

        It 'アイウエオ => あいうえお' {
            $Kana = 'アイウエオ'
            $Expect = 'あいうえお'
            Convert-KatakanaToHiragana -Katakana $Kana | Should -BeExactly $Expect
        }

        It 'チャン・グンソク => ちゃん・ぐんそく' {
            $Kana = 'チャン・グンソク'
            $Expect = 'ちゃん・ぐんそく'
            Convert-KatakanaToHiragana -Katakana $Kana | Should -BeExactly $Expect
        }

        It '吉田　alphaX09 ワをン　ナにヌねノ => 吉田　alphaX09 わをん　なにぬねの' {
            $Kana = '吉田　alphaX09 ワをン　ナにヌねノ'
            $Expect = '吉田　alphaX09 わをん　なにぬねの'
            Convert-KatakanaToHiragana -Katakana $Kana | Should -BeExactly $Expect
        }
    }
}
