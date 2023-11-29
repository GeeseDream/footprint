Docker
=======

1. 创建文件
---------------

.. code-block:: shell

    touch /etc/systemd/system/docker.service.d/http-proxy.conf

2. 文件内容
---------------

.. code-block:: shell

    [Service]
    Environment="HTTPS_PROXY=socks5://192.168.1.2:7891/"

3. 重启docker服务
-----------------------

.. code-block:: shell

    systemctl daemon-reload
    systemctl restart docker

   