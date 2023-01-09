================================
Maven 命令备忘
================================

1. 批量修改多模块项目版本号
--------------------------------

    .. code-block:: shell

        mvn versions:set "-DnewVersion=1.1.2"

2. 禁止将某个项目模块发布到仓库
--------------------------------

    .. code-block:: xml

        <properties>
            <maven.deploy.skip>true</maven.deploy.skip>
        </properties>

3. 指定JDK版本和UTF-8编码
--------------------------------

    .. code-block:: xml

        <properties>
            <maven.compiler.target>1.8</maven.compiler.target>
            <maven.compiler.source>1.8</maven.compiler.source>
            <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
            <project.reporting.outputEncoding>UTF-8</project.reporting.outputEncoding>
        </properties>

4. 打包不编译单元测试类
--------------------------------

    .. code-block:: shell

        mvn clean package -Dmaven.test.skip=true -U

5. 使用maven-dependency-plugin排除依赖的部分class文件
------------------------------------------------------

    .. code-block:: xml

        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-dependency-plugin</artifactId>
            <version>3.4.0</version>
            <executions>
                <execution>
                    <id>unpack</id>
                    <phase>process-classes</phase>
                    <goals>
                        <goal>unpack</goal>
                    </goals>
                    <configuration>
                        <artifactItems>
                            <artifactItem>
                                <groupId>com.demo.rpc</groupId>
                                <artifactId>demo-core</artifactId>
                                <version>1.5.1</version>
                                <type>jar</type>
                                <includes>com/demo/core/base/*.class,com/demo/core/rpc/*.class,com/demo/core/utils/*.class,com/demo/core/*.class</includes>
                                <excludes>META-INF/</excludes>
                                <overWrite>true</overWrite>
                                <outputDirectory>${build.directory}/classes/</outputDirectory>
                            </artifactItem>
                        </artifactItems>
                    </configuration>
                </execution>
            </executions>
        </plugin>