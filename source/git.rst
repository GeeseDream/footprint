================================
Git 使用
================================

1. 只获取仓库指定分支的方法
--------------------------------

.. code-block:: shell
        
    git clone --branch 分支名称 仓库_url
    git clone -b tags 仓库_url
    git clone --single--branch 分支名称 仓库_url

2. 制作Git仓库镜像
-------------------------------

.. code-block:: shell

    git clone --bare git@git.demo.com:xxxx/my.git
    git push --mirror git@git.demo.com:xxxx/new-my.git