Go语言
===============

GoProxy配置
--------------

使用前请确认本地golang为1.11及以上版本，且工程为go module工程

powershell当中使用下面的命令

.. code-block:: powershell

    [System.Environment]::SetEnvironmentVariable('GO111MODULE','on','User')
    [System.Environment]::SetEnvironmentVariable('GOPROXY','https://repo.huaweicloud.com/repository/goproxy/','User')
    [System.Environment]::SetEnvironmentVariable('GONOSUMDB','*','User')
