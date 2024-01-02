# qBittorrent-Enhanced-Edition docker image

## 😊 use
`docker-compose.yml`
```yml
version: '3.5'
services:
    qbittorrrent:
        container_name: qBittorrrent
        image: captain686/qbittorrent
        volumes:
            - $PWD/root:/root
            - $PWD/downloads:/opt/download
        tty: true
        restart: always
```
```bash
docker-compose up -d
```
