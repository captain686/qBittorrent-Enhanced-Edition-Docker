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
      - root:/root
      - $PWD/downloads:/opt/download
    tty: true
    restart: always
    network_mode: host

volumes:
  root:
    driver: local
    driver_opts:
      o: bind
      type: none
      device: $PWD/root
```
> 启动后获取`admin`默认密码
```bash
docker-compose up
```
> `WebUI`访问`http://ip:8080`
