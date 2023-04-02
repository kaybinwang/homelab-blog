FROM klakegg/hugo:ext-alpine

WORKDIR /blog/
COPY . .

ENTRYPOINT ["hugo", "server", "--minify", "--disableLiveReload", "--watch=false"]
