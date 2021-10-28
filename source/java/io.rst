Java的I/O
==========

I/O（英语：Input/Output），即输入/输出，通常指数据在存储器（内部和外部）或其他周边设备之间的输入和输出，是信息处理系统（例如计算机）与外部世界（可能是人类或另一信息处理系统）之间的通信。输入是系统接收的信号或数据，输出则是从其发送的信号或数据。

Java 使用流的概念来处理I/O 操作。java.io包包含输入和输出操作所需的所有类。

| Stream：数据序列。
| 输入流：从源读取数据。
| 输出流：将数据写入目的地。

输出流和输入流
--------------

Java 应用程序使用输出流将数据写入目的地，它可以是文件、数组、外围设备或套接字。
Java 应用程序使用输入流从源读取数据，它可以是文件、数组、外围设备或套接字。

让我们通过下图了解 Java OutputStream 和 InputStream 的工作原理。

.. image :: java-io-flow.png

输出流类
---------------

OutputStream 类是一个抽象类。它是表示字节输出流的所有类的超类。输出流接受输出字节并将它们发送到某个接收器。

OutputStream 的有用方法

==============================================      ================================
方法                                                   描述
==============================================      ================================
public void write(int) 抛出 IOException	             用于将一个字节写入当前输出流。
public void write(byte[]) 抛出 IOException	         用于将字节数组写入当前输出流。
public void flush() 抛出 IOException	             刷新当前输出流。
public void close() 抛出 IOException	             用于关闭当前输出流。
==============================================      ================================

输出流层次结构

.. image :: java-outputstream.png

输入流类
---------

InputStream 的有用方法

=================================================  =================================================
方法	                                            描述
=================================================  =================================================
public abstract int read() 抛出 IOException	        从输入流中读取下一个字节的数据。它在文件末尾返回 -1。
public int available() 抛出 IOException	            返回可以从当前输入流中读取的字节数的估计值。
public void close() 抛出 IOException	            用于关闭当前输入流。
=================================================  =================================================

输入流层次结构

.. image :: java-inputstream.png


字符流
----------

Java 平台使用 Unicode 约定存储字符值。字符流 I/O 自动将此内部格式转换为本地字符集或从本地字符集转换。
对于大多数应用程序，字符流的 I/O 并不比字节流的 I/O 复杂。使用流类完成的输入和输出会自动与本地字符集相互转换。

.. image :: Input-Output-Stream.png

所有字符流类都来自 Reader和 Writer。与字节流一样，有专门用于文件 I/O 的字符流类： FileReader和 FileWriter.

字节流还是字符流
-----------------

面向字节逐字节读取。字节流适用于处理二进制文件等原始数据。

在 Java 中，字符使用 Unicode 约定进行存储。当我们要处理文本文件时，字符流很有用。这些文本文件可以逐个字符地处理。字符大小通常为 16 位。

.. rubric:: 参考与引用
.. [#f1] 维基百科(输入/输出) https://zh.wikipedia.org/wiki/I/O
.. [#f2] javatpoint(Java I/O 教程) https://www.javatpoint.com/java-io
.. [#f3] Character Stream Vs Byte Stream in Java https://www.geeksforgeeks.org/character-stream-vs-byte-stream-java/
.. [#f4] Character Streams https://docs.oracle.com/javase/tutorial/essential/io/charstreams.html