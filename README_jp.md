Ariete $stdout & $stderr Capture Module
=======================================

## イントロダクション

Ariete $stdout & $stderr Capture Moduleは、標準出力または標準エラー出力をキャプチャし、文字列として取得するためのモジュールである。主にユニットテストで使用することを想定している。

**usage**

    require "test/unit"
    require_relative "klass"

    class KlassTest < Test::Unit::TestCase
      include Ariete

      def test_stdout
        result = capture_stdout {Klass.output_out("Ariete")}
        assert_equal("Ariete is a kind of rabbit.", result)
      end

      def test_stderr
        result = capture_stderr {Klass.output_err("Ariete")}
        assert_equal("Ariete means 'Lop' in Italian.", result)
      end
    end  

## 動作環境

以下の環境で開発およびテストをしている。

- Linux（openSUSE 12.2）・Mac OS X 10.8.2
- Ruby 1.9.3

## 構成

- **bin**
- **doc** :: rdocによるドキュメント
- **lib**
  - **ariete.rb** :: モジュール本体
- **LICENSE**
- **Rakefile** :: gemパッケージ生成用のRakefile
- **README.md**
- **README_jp.md**
- **test** :: ユニットテスト
  - **tb_capture_std.rb** :: ariete.rbのためのユニットテスト

## インストール

ariete-x.y.z.gemファイル（x、y、zはバージョン番号）をダウンロードし、以下のコマンドを入力してインストールする。

`$ sudo gem install ariete-x.y.z.gem`

または、RubyGems.orgからgemコマンドを使ってインストールすることもできる。

`$ sudo gem install ariete`

## サンプルコード

tb_capture_std.rbがサンプルコードを兼ねている。

## APIドキュメント

[http://quellencode.org/ariete-doc/](http://quellencode.org/ariete-doc/ "")を参照

## ライセンス

本ソフトウェアは、MIT Licenseのもとで配布されている。詳細はLICENSEファイルに記している。

## 作者について

Moza USANE  
[http://blog.quellencode.org/](http://blog.quellencode.org/ "")  
mozamimy@quellencode.org