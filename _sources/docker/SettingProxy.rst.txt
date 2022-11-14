====================================================
为Docker设置socks5代理
====================================================

1. 创建文件

``touch /etc/systemd/system/docker.service.d/http-proxy.conf``

2. 文件内容

``[Service]``

``Environment="HTTPS_PROXY=socks5://192.168.1.2:7891/"``

3. 重启docker服务

``systemctl daemon-reload``

``systemctl restart docker``

   