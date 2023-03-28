# 多线程

### 汇总结果

1. Callable和Future接口：Callable是一个有返回值的任务，而Future是对计算结果的句柄。您可以使用ExecutorService.submit(Callable)来提交任务并获取Future对象，然后使用Future.get()来获取结果
2. 使用CountDownLatch：CountDownLatch是一种同步工具，您可以使用它来等待所有线程完成，然后再汇总结果。
3. 使用CompletableFuture：CompletableFuture是Java 8引入的一种异步处理工具，它支持多种方法，例如thenApply，thenAccept和thenCompose，可以方便地处理多线程的结果。