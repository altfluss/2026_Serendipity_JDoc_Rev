# ==== ターゲットファイル ====
# 'latexmk' コマンドで両方ビルドする
@default_files = ('main.tex', 'supplements.tex', "supplements2.tex");

# ==== pdflatex モード用 ====
$latex     = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error -output-directory=build';
$bibtex    = 'bibtex %O %B';
$makeindex = 'makeindex %O -o %D %S';

$pdf_mode  = 1;  # ← pdflatex を使うモード

$out_dir = 'build';
$aux_dir = 'build';

# ==== パス設定 (xr のために TEXINPUTS を追加) ====
$ENV{'BIBINPUTS'} = join(':', '.', 'build', $ENV{'BIBINPUTS'} // '');
$ENV{'BSTINPUTS'} = join(':', '.', 'build', $ENV{'BSTINPUTS'} // '');
# ★★★ これが重要 ★★★
$ENV{'TEXINPUTS'} = join(':', '.', 'build', $ENV{'TEXINPUTS'} // '');

# コンパイルエラーでメッセージを出す
$failure_cmd = 'echo "Compilation failed"';

# エラーが起きたら即座に停止
$failure_always = 1;