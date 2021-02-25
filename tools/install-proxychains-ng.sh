#!/bin/sh

#=================================================
#	System Required: CentOS/Debian/Ubuntu
#	Description: Proxychains-ng
#	Version: 1.0.0
#	Author: Jireh
#	Blog: https://www.lyile.cn/
#=================================================

version=4.14

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[信息]${Font_color_suffix}"
Error="${Red_font_prefix}[错误]${Font_color_suffix}"
Tip="${Green_font_prefix}[注意]${Font_color_suffix}"

check_root(){
	[[ $EUID != 0 ]] && echo -e "${Error} 当前非ROOT账号(或没有ROOT权限)，无法继续操作，请更换ROOT账号或使用 ${Green_background_prefix}sudo su${Font_color_suffix} 命令获取临时ROOT权限（执行后可能会提示输入当前账号的密码）。" && exit 1
}
#检查系统
check_sys(){
	if [[ -f /etc/redhat-release ]]; then
		release="centos"
	elif cat /etc/issue | grep -q -E -i "debian"; then
		release="debian"
	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
	elif cat /proc/version | grep -q -E -i "debian"; then
		release="debian"
	elif cat /proc/version | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
    fi
	#bit=`uname -m`
}

install(){
  echo -e "开始安装proxychains-ng,版本为："${version}
wget https://github.com/rofl0r/proxychains-ng/archive/v$version.tar.gz
tar xf v$version.tar.gz

if [ $release == "centos"]; then
    yum install -y gcc
elif $release == "ubuntu"; then
    apt install -y gcc
elif $release == "debian"; then
    apt-get install -y gcc
fi

(cd proxychains-ng-$version
 ./configure --prefix=/usr --sysconfdir=/etc
 make && make install
 make install-config
 echo -e "proxychains-ng安装完成，配置文件为 /etc/proxychains.conf"
)

rm -rf v$version.tar.gz proxychains-ng-$version
}
check_sys
install
