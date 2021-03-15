version: '2'
services:
  web:
    build:
      context: .
      dockerfile: Dockerfile-nginx
    ports:
      - "127.0.0.1:51102:80"
    networks:
      default:
        ipv4_address: 172.16.1.102
    environment:
      - MYSQL_ROOT_PASSWORD=fixmename
      - MYSQL_DATABASE=fixmename
    depends_on:
      - db
    links:
      - db
      - fpm
    volumes_from:
      - fpm
  fpm:
    build:
      context: .
      dockerfile: Dockerfile-fpm
    networks:
      default:
        ipv4_address: 172.16.1.103
    depends_on:
      - db
    links:
      - db
    volumes:
      - DEV_REPO:/fixmename
      - ./docker:/docker
      - /home/name/workspace/grzechowski/merito-lvssb:/merito-lvssb
  db:
    image: "mysql:8"
    command: ['--character-set-server=utf8mb4', '--collation-server=utf8mb4_unicode_ci' ]
    ports:
      - "127.0.0.1:51104:3306"
    networks:
      default:
        ipv4_address: 172.16.1.104
    environment:
      - MYSQL_ROOT_PASSWORD=fixmename
      - MYSQL_DATABASE=fixmename
      - MYSQL_PASSWORD=
    volumes:
      - ./var/mysql:/var/lib/mysql
      - ./docker:/docker
#  redis:
#    image: redis:5
#    ports:
#      - "127.0.0.1:8505:6379"
#    networks:
#      default:
#        ipv4_address: 172.16.26.105

networks:
  default:
    external:
      name: fixmename_net
