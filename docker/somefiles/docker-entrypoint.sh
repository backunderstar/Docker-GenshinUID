#!/bin/bash

set +e

RED="\e[1;31m"
GREEN="\e[1;32m"
BULE="\e[1;34m"
RESET="\e[0m"

WORK_DIR="/app/Nonebot2"
GS_DIR="/app/Nonebot2/GenshinUID-nonebot2"

if [[ ! -d "${HOME}/._ok" ]]; then
	mkdir ~/._ok
fi


if [ -d "${GS_DIR}/.git" ]; then
	echo -e "\n ${BULE}----------------拉取GenshinUID更新----------------${RESET} \n"
	cd $GS_DIR

	if [[ -n $(git status -s) ]]; then
		echo -e "\n ${BULE}----------------当前工作区有修改，尝试暂存后更新----------------${RESET} \n"
		git add .
		git stash
		git pull origin nonebot2-beta1 --allow-unrelated-histories --rebase
		git stash pop
	else
		git pull origin nonebot2-beta1 --allow-unrelated-histories
	fi

	if [[ ! -f "${HOME}/._ok/gs.ok" ]]; then
		set -e
		echo -e "\n ${BULE}----------------安装GenshinUID依赖----------------${RESET} \n"
		pip install --editable .
		touch ~/._ok/gs.ok
		set +e
	fi

	echo -e "\n ${GREEN}----------------更新GenshinUID完成----------------${RESET} \n"
	git log -1 --pretty=format:"%h - %an, %ar (%cd) : %s"
fi

cd $WORK_DIR

nb run
