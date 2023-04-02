FROM klakegg/hugo:0.107.0-ext

WORKDIR /blog/
COPY . .

ENTRYPOINT ["hugo", "server", "--minify", "--disableLiveReload", "--watch=false"]
