FROM python:3.10.7-slim-buster

MAINTAINER Treasure_highly<2229064638@qq.com>

COPY ./somefiles /app/somefiles
COPY ./ffmpeg /root/ffmpeg

SHELL ["/bin/bash", "-c"]

WORKDIR /app

RUN echo -e "deb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster main contrib non-free\ndeb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-updates main contrib non-free\ndeb https://mirrors.tuna.tsinghua.edu.cn/debian/ buster-backports main contrib non-free\ndeb https://mirrors.tuna.tsinghua.edu.cn/debian-security buster/updates main contrib non-free" > /etc/apt/sources.list \
    && mv /app/somefiles/Nonebot2 ./ \
    && mv /app/somefiles/docker-entrypoint.sh /app/Nonebot2/entrypoint.sh \
    && mv /app/somefiles/admin.sh /app/Nonebot2/admin.sh \
    && apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y gnupg git ttf-wqy-zenhei ffmpeg \
    && apt-get autoremove \
    && git config --global --add safe.directory '*' \
    && git config --global pull.rebase false \
    && git config --global user.email "Docker@genshinuid.bot" \
    && git config --global user.name "GenshinUID" \
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install --no-cache-dir nb-cli \
    && cd /app/Nonebot2 \
    && nb plugin install nonebot-plugin-gocqhttp \
    && git clone -b nonebot2-beta1 https://ghproxy.com/https://github.com/KimigaiiWuyi/GenshinUID.git --depth=1 --single-branch /app/Nonebot2/GenshinUID-nonebot2 \
    && mkdir /app/Nonebot2/GenshinUID-nonebot2/GenshinUID/genshinuid_map/map_data \
    && mv /app/somefiles/map/*.png /app/Nonebot2/GenshinUID-nonebot2/GenshinUID/genshinuid_map/map_data/ \
    && chmod +x /app/Nonebot2/entrypoint.sh \
    && chmod +x /app/Nonebot2/admin.sh \
    && echo "export PATH=$PATH:/root/ffmpeg">>~/.bashrc \
    && source ~/.bashrc \
    && apt-get remove ffmpeg -y \
    && apt-get clean \
    && rm -rf /app/somefiles \
    && rm -rf /var/lib/apt/list/* \
    && rm -rf /tmp/*

WORKDIR /app/Nonebot2

ENTRYPOINT ["./entrypoint.sh"]
    
