================================
Maven 命令备忘
================================

1. 批量修改多模块项目版本号

    .. code-block:: shell

        mvn versions:set "-DnewVersion=1.1.2"

2. 禁止将某个项目模块发布到仓库

    .. code-block:: xml

        <properties>
            <maven.deploy.skip>true</maven.deploy.skip>
        </properties>