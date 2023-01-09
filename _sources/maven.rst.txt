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

3. 指定JDK版本和UTF-8编码

    .. code-block:: xml

        <properties>
            <maven.compiler.target>1.8</maven.compiler.target>
            <maven.compiler.source>1.8</maven.compiler.source>
            <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
            <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
        </properties>

4. 打包不编译单元测试类

    .. code-block:: shell

        mvn clean package -Dmaven.test.skip=true -U