# 修士論文 LaTeX テンプレート

## 概要

慶應義塾大学大学院理工学研究科基礎理工学専攻物理情報専修の修士論文のための**非公式**テンプレートです。提出にあたっては実際の指示に従ってください。

## 内容

- `thesis.tex` 修士論文本体の LaTeX ファイル。
- `abstract.docx` 審査用要旨の Word テンプレートファイル。
- `cover.pptx` 製本を依頼する際の表紙データ。
  - 印刷して「上製本で」と指定して生協に出すときれいに製本をしてくれる。製本しない場合は不要。

## 使い方

Fork や clone をせず、「ダウンロード」して使うこと。リポジトリの「Code」ボタンの「Download ZIP」をクリックすることで Zip ファイルがダウンロードできる。その上でローカルで Git 管理し、さらに GitHub 等でプライベートリポジトリとして管理することを強く推奨する。

## コンパイル方法

TeXLive をインストールし、LaTeX でコンパイルすればよいが、latexmk によるコンパイルを推奨する。`.latexmkrc`は、例えば以下のようにすれば良い。

```sh
#!/usr/bin/env perl

$latex = 'platex -synctex=1 -interaction=nonstopmode %O %S';
$bibtex = 'pbibtex %O %B';
$makeindex = 'memindex %O -o %D %S';
$pdf_mode = 3;
$dvipdf = 'dvipdfmx %O -o %D %S'
```

正しくインストールされていれば、

```sh
latexmk
```

を実行することで`thesis.pdf`が作成される。

## 提出要旨の作成

pdftk がインストールされていれば、`thesis.pdf`から提出用の要旨(表紙＋和文要旨＋英文要旨を一つの PDF にしたもの)を作成できる。

```sh
pdftk thesis.pdf cat 1-3 output submit_abstract.pdf
```

単に

```sh
make abst
```

とすれば、`thesis.pdf`が無ければ作成され、そこから`submit_abstract.pdf`が作成される。

## ライセンス

CC-BY
