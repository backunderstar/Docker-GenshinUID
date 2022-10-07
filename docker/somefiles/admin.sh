#!/bin/bash
cat /app/Nonebot2/.env.prod
read -p "请输入需要更改的地方（原样照抄需要修改的地方，最好是完整唯一的字符串，防止错误修改）:" str
read -p "请输入你希望改成的样子：" replace
sed -ri "s/${str}/${replace}/g" ./.env.prod
echo -e "修改后："
cat /app/Nonebot2/.env.prod
echo -e "一次只能更改一段，更改完自动退出容器。\n如果改错请重新进入更改，后续会更新循环，方便修改。"
