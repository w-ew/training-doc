# training-doc

**To PREVIEW the training documentation with the GitHub Markdown engine, click TRAINING.md**

**To download the training instructions to your computer, click `Clone or download`, then `Download ZIP`. Then, open TRAINING.html in your favourite web browser.**

The training instructions were created in pandoc-flavoured Markdown. TRAINING.md may not render correctly in GFM (Github-flavoured Markdown). For this reason, you may choose to install Pandoc on your system:

```
apt-get install pandoc
```

Then use `make` to render both the HTML version (looks best) or PDF version for printing:

```
make TRAINING.html
make TRAINING.pdf
```
or simply
```
make all
```
