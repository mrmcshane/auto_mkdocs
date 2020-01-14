FROM python AS mkdocs-builder
RUN pip install mkdocs mkdocs-material
ADD docs /raw
WORKDIR /raw
RUN mkdir /build
RUN mkdocs build --site-dir /build

FROM nginx:alpine
COPY --from=mkdocs-builder /build /usr/share/nginx/html/
