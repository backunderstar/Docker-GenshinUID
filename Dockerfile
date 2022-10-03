FROM archlinux:latest
MAINTAINER Treasure_highly<2229064638@qq.com>

COPY ./mirrorlist /etc/pacman.d/mirrorlist
COPY ./Nonebot2 /app/Nonebot2
COPY ./docker-entrypoint.sh /app/Nonebot2/entrypoint.sh
COPY ./map /app/map_data

WORKDIR /app/Nonebot2

RUN pacman -Syu --noconfirm \
    && pacman -S git python python-pip wqy-microhei ffmpeg --noconfirm \
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
#    && pip install poetry \
    && pip install nb-cli \
    && pip install setuptools \
    && pip install wheel \
    && nb plugin install nonebot-plugin-gocqhttp \
    && nb plugin install nonebot_plugin_apscheduler \
    && git config --global pull.rebase false \
    && git config --global user.email "docker@genshinuid.bot" \
    && git config --global user.name "GenshinUID" \
    && git clone -b nonebot2-beta1 https://ghproxy.com/https://github.com/KimigaiiWuyi/GenshinUID.git --depth=1 --single-branch GenshinUID-nonebot2 \
    && mv /app/map_data/*.png /app/Nonebot2/GenshinUID-nonebot2/GenshinUID/genshinuid_map/map_data/ \
    && chmod +x ./entrypoint.sh \
    && yes | pacman -Scc \
    && rm -rf /var/cache/* \
    rm -rf /tmp/* 

ENTRYPOINT ["./entrypoint.sh"]

