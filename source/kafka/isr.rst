高可用机制
===========

Kafka如何实现高可用
-------------------

Kafka通过为Topic每个Partition设置副本实现高可用，当一个节点宕机以后其它副本继续提供服务。
并且Partition的副本的数量可以调整，一般在创建topic的时候指定副本数量。

Kafka如何保证Partition副本的一致性
------------------------------------

Kafka使用一种叫做ISR（in-sync Replica）的技术来保证分区副本的一致性。

.. image:: isr.png
    :alt: ISR示意图

它是一种分区副本的同步机制，分区副本应该拥有和leader相同的数据。
参与同步复制的分区数量不一定等于等于分区副本数。

Kafka判断follow是否同步是通过``replica.lag.time.max.ms``的值，它默认为10秒。
如果参与同步复制的副本落后leader的数据大于10秒将被踢出同步复制，直到它的数据追上leader方可重新加入同步复制。

follow周期性的向leader发起数据拉取请求，默认周期是500毫秒。如果一个follow故障超过10同样会被禁止参与同步复制。

follow都挂了只有leader数据会有丢失的风险吗
-------------------------------------------

不会，极端情况下可能出现所有参与同步复制的follow都宕机。
可以设定``min.insync.replicas``指定至少同步成功的follow数量。
如果运行中的follow数量不能满足要求，生产者将会收到一个异常。
如果参与同步复制的follow大于1就可以避免这种数据丢失的风险。
所以，我们可以创建replication factor为3的``min.insync.replicas``设置为2，生产者acks设置为3
这样当follow数量小于2，Kafka将拒绝工作produce将收到一个异常。



