Java 异常处理
=============

什么是异常
------------

异常是在程序执行期间（即在运行时）发生的意外或意外事件，它会中断程序指令的正常流程。

Java 异常类的层次结构
---------------------

所有异常和错误类型都是Throwable类的子类，它是层次结构的基类。
它有两个重要的子类Exception和Error，Exception此类用于用户程序应捕获的异常情况。
JVM运行时使用Error来指示与运行时环境本身 (JRE) 相关的错误。

.. image :: throwable.png
    :alt: Throwable类的层次结构

异常的类型
------------

主要有两种类型的异常：已检查和未检查。

在这里，错误被视为未经检查的异常。根据 Oracle 的说法，存在三种类型的异常：

* 检查异常
* 未经检查的异常
* 错误

检查和未检查异常之间的区别
    #. 检查异常
       除了 RuntimeException 和 Error 之外，直接继承 Throwable 类的类称为受检异常，例如 IOException、SQLException 等。受检异常是在编译时检查的。
    #. 未经检查的异常
       继承 RuntimeException 的类被称为未检查异常，例如 ArithmeticException、NullPointerException、ArrayIndexOutOfBoundsException 等。未检查异常在编译时不检查，但在运行时检查。    
    #. 错误
       错误是不可恢复的，例如 OutOfMemoryError、VirtualMachineError、AssertionError 等。

Java异常处理
---------------

Java异常处理是通过5个关键字来管理的，它们是try、catch、throw、throws和finally。

如果try代码块中有异常发生可以使用catch捕获并进行处理。

.. code-block:: java

    public class TryCatchExample2 {  
    
        public static void main(String[] args) {  
            try {  
                int data=50/0; //may throw exception   
            }  //handling the exception  
            catch(ArithmeticException e)  
            {  
                System.out.println(e);  
            }  
            System.out.println("rest of the code");  
        }  
    
    }  

异常处理的核心是try和catch。这两个关键字要一起使用，只有try而没有catch，或者只有catch而没有try都不对。
一个try相关的catch语句可以有多个，catch表达式按照代码顺序被检查。只执行匹配的catch代码块。

.. code-block:: java

    public class MultipleCatchBlock1 {

        public static void main(String[] args) {

            try {
                int a[] = new int[5];
                a[5] = 30 / 0;
            } catch (ArithmeticException e) {
                System.out.println("Arithmetic Exception occurs");
            } catch (ArrayIndexOutOfBoundsException e) {
                System.out.println("ArrayIndexOutOfBounds Exception occurs");
            } catch (Exception e) {
                System.out.println("Parent Exception occurs");
            }
            System.out.println("rest of the code");
        }
    }


如果try代码块没有抛出异常正常结束，会跳过它的所有catch语句。所以只有在有异常被抛出时，才会执行catch语句。
异常的类型必须与catch语句中指定的类型相符，否则异常就不能被捕获。

Java throw 关键字用于显式抛出异常。
我们可以通过 throw 关键字在 java 中抛出已检查或未检查的异常。throw 关键字主要用于抛出自定义异常。

.. code-block:: java

    public class TestThrow1 {
        static void validate(int age) {
            if (age < 18)
                throw new ArithmeticException("not valid");
            else
                System.out.println("welcome to vote");
        }

        public static void main(String args[]) {
            validate(13);
            System.out.println("rest of the code...");
        }
    }


无论异常是否被处理，Java finally 块都会被执行。Java finally 块跟在 try 或 catch 块之后。

.. code-block:: java

    class TestFinallyBlock {
        public static void main(String args[]) {
            try {
                int data = 25 / 5;
                System.out.println(data);
            } catch (NullPointerException e) {
                System.out.println(e);
            } finally {
                System.out.println("finally block is always executed");
            }
            System.out.println("rest of the code...");
        }
    }

如果程序不捕获异常那它就要被JVM捕获，程序会终止执行并显示堆栈跟踪和出错消息。

要点：
    #. 在一个方法中，可能有多个可能抛出异常的语句，因此将所有这些语句放在自己的try块中，并在自己的catch块中为每个语句提供单独的异常处理程序。
    #. 如果try块内发生异常，则该异常由与其关联的异常处理程序处理。要关联异常处理程序，我们必须在它之后放置catch块。可以有多个异常处理程序。每个catch块都是一个异常处理程序，用于处理由其参数指示的类型的异常。参数 ExceptionType 声明了它可以处理的异常类型，并且必须是继承自Throwable类的类的名称。
    #. 对于每个 try 块，可以有零个或多个 catch 块，但只有一个finally 块。
    #. finally 块是可选的。无论 try 块中是否发生异常，它都会被执行。如果发生异常，则在try 和 catch 块之后执行。 如果异常没有发生，那么它将在try块之后执行。java中的finally块用于放置重要的代码，例如清理代码，例如关闭文件或关闭连接。

.. rubric:: 参考与引用
.. [#f1] Exceptions in Java https://www.geeksforgeeks.org/exceptions-in-java/
.. [#f2] Exception Handling in Java https://www.javatpoint.com/exception-handling-in-java
.. [#f3] Exceptions https://docs.oracle.com/javase/tutorial/essential/exceptions/index.html