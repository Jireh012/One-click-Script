#!/bin/sh

#=================================================
#	System Required: CentOS/Debian/Ubuntu
#	Description: Proxychains-ng
#	Version: 1.0.0
#	Author: Jireh
#	Blog: https://www.lyile.cn/
#=================================================

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[信息]${Font_color_suffix}"
Error="${Red_font_prefix}[错误]${Font_color_suffix}"
Tip="${Green_font_prefix}[注意]${Font_color_suffix}"

version=4.14

install{
echo -e "开始proxychains-ng,版本为："${version}
wget https://github.com/rofl0r/proxychains-ng/archive/v$version.tar.gz
tar xf v$version.tar.gz

(cd proxychains-ng-$version
 ./configure --prefix=/usr --sysconfdir=/etc
 make
 make install
 make install-config
 echo -e "proxychains-ng安装完成，配置文件为 /etc/proxychains.conf"
)

install