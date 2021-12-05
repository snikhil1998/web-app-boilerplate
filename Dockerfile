FROM archlinux:base-devel

WORKDIR /server

COPY . .
RUN pacman -Sy --needed --noconfirm python reflector
RUN reflector --verbose --protocol https --latest 20 --sort rate --save /etc/pacman.d/mirrorlist
RUN pacman -Syu --needed --noconfirm nodejs npm vim less curl wget man jq ca-certificates net-tools iproute2 dnsutils openbsd-netcat strace gdb file
RUN npm install

EXPOSE 5000
CMD npm run server
