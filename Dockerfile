FROM hugomods/hugo:exts-0.147.9 AS builder
WORKDIR /src
COPY . .
RUN hugo --minify --gc

FROM nginx:alpine
COPY --from=builder /src/public /usr/share/nginx/html
EXPOSE 80
