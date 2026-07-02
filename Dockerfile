FROM hugomods/hugo:exts-0.154.5
WORKDIR /src
COPY . .
RUN rm -rf themes/congo && git clone --depth 1 --branch v2.13.0 https://github.com/jpanther/congo.git themes/congo
RUN hugo --minify --gc
