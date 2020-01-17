echo '修改机器名称'
sed -i 's/OpenWrt/Newifi/g' package/base-files/files/bin/config_generate

#echo '修改网关地址'
#sed -i 's/192.168.1.1/192.168.1.1/g' package/base-files/files/bin/config_generate

echo '修改时区'
sed -i "s/'UTC'/'CST-8'\n        set system.@system[-1].zonename='Asia\/Shanghai'/g" package/base-files/files/bin/config_generate

echo '修改默认主题'
sed -i 's/bootstrap/argon/g' feeds/luci/modules/luci-base/root/etc/config/luci

echo '去除默认bootstrap主题'
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

echo '删除旧版argon,链接新版'
rm -rf ./package/lean/luci-theme-argon
ln -s ../../../Openwrt/luci-theme-argon ./package/lean/

echo '修改wifi名称'
sed -i 's/OpenWrt/Newifi/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

echo '修改连接数'
sed -i '2c net.netfilter.nf_conntrack_max=131072' package/base-files/files/etc/sysctl.conf


#echo '修改多拨'
#sed -i '8a\lcp-echo-failure 10' package/network/services/ppp/files/etc/ppp/options
#sed -i '9a\lcp-echo-interval 1' package/network/services/ppp/files/etc/ppp/options
#rm -rf ./package/lean/luci-app-syncdial
#ln -s ../../../Openwrt/luci-app-syncdial ./package/lean/
#chmod -R 755 ./package/lean/luci-app-syncdial
#sed -i 's/SYNCPPP_TIMEOUT 5/SYNCPPP_TIMEOUT 1/g' package/network/services/ppp/patches/511-syncppp.patch

echo '下载ServerChan'
git clone https://github.com/tty228/luci-app-serverchan ../diy/luci-app-serverchan

echo '集成diy目录'
ln -s ../../diy ./package/openwrt-packages


