#!/bin/sh

#=================================================
#	System Required: CentOS/Debian/Ubuntu
#	Description: Proxychains-ng
#	Version: 1.0.0
#	Author: Jireh
#	Blog: https://www.lyile.cn/
#=================================================

version=4.14

echo -e "开始安装proxychains-ng,版本为："${version}
wget https://github.com/rofl0r/proxychains-ng/archive/v$version.tar.gz
tar xf v$version.tar.gz

(cd proxychains-ng-$version
 ./configure --prefix=/usr --sysconfdir=/etc
 make && make install
 make install-config
 echo -e "proxychains-ng安装完成，配置文件为 /etc/proxychains.conf"
)

rm -rf v$version.tar.gz proxychains-ng-$version