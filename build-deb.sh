#!/usr/bin/env python3
version=10.2
codename=$GXDE_CODENAME
sudo apt install aria2 -y
# 判断是不是 arm64
if [[ $(dpkg --print-architecture) != "arm64" ]]; then
    echo 暂不支持该架构
    exit 1
fi
case $codename in
    "bixie")
        url=https://github.com/AndreRH/hangover/releases/download/hangover-$version/hangover_${version}_debian12_bookworm_arm64.tar
    ;;
    "tianlu")
        url=https://github.com/AndreRH/hangover/releases/download/hangover-$version/hangover_${version}_debian12_bookworm_arm64.tar
    ;;
    "lizhi")
        url=https://github.com/AndreRH/hangover/releases/download/hangover-$version/hangover_${version}_debian13_trixie_arm64.tar
    ;;
    "zhuangzhuang")
        url=https://github.com/AndreRH/hangover/releases/download/hangover-$version/hangover_${version}_debian13_trixie_arm64.tar
    ;;
    *)
        url=https://github.com/AndreRH/hangover/releases/download/hangover-$version/hangover_${version}_debian12_bookworm_arm64.tar
    ;;
esac
mkdir download
cd download 
aria2c -x 16 -s 16 $url
tar -xvf *.tar
mv *.deb ../../.. -v
