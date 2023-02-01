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

3. 使用includeIf指令根据remote.origin.url自动切换username和email

.. code-block:: ini

    ; include if $GIT_DIR is /path/to/foo/.git
    [includeIf "gitdir:/path/to/foo/.git"]
            path = /path/to/foo.inc

    ; include for all repositories inside /path/to/group
    [includeIf "gitdir:/path/to/group/"]
            path = /path/to/foo.inc

    ; include for all repositories inside $HOME/to/group
    [includeIf "gitdir:~/to/group/"]
            path = /path/to/foo.inc

    ; relative paths are always relative to the including
    ; file (if the condition is true); their location is not
    ; affected by the condition
    [includeIf "gitdir:/path/to/group/"]
            path = foo.inc

    ; include only if we are in a worktree where foo-branch is
    ; currently checked out
    [includeIf "onbranch:foo-branch"]
            path = foo.inc

    ; include only if a remote with the given URL exists (note
    ; that such a URL may be provided later in a file or in a
    ; file read after this file is read, as seen in this example)
    [includeIf "hasconfig:remote.*.url:https://example.com/**"]
            path = foo.inc
    [remote "origin"]
            url = https://example.com/git

Git配置socks代理
-----------------------

Git 支持 socks5:// 和 socks4:// 协议.

执行命令为Git配置SOCKS代理.

.. code-block:: shell

        $ git config --global http.proxy socks5://proxy_server.com:port

为指定的域名配置代理执行下面的命令

.. code-block:: shell

        $ git config --global http.https://domain.com.proxy socks5://proxy_server.com:port