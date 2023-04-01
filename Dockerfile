FROM klakegg/hugo:ext-alpine

WORKDIR /blog/
COPY . .

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["hugo", "server", "--minify", "--disableLiveReload", "--watch=false"]
