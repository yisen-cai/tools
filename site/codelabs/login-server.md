summary: qmq
id: login-server
categories: Envrioment
tags: dev
status: Published 
authors: yishen.cai
Feedback Link: https://glancebar.com

# 跳板机登陆

<!-- ------------------------ -->



## 预览

Duration: 1

qmq是一个...

### 你将学会:

- 
- 创建简单消息并消费
- 如何在管理后台管理和查看消息
- 其他高级内容

<!-- ------------------------ -->





## 基础配置

Duration: 2

在此之前, 请先配置下qunar认证中心的相关内容, 参考...

### 添加依赖包

TC公共组件可在 [Qunar Release Repository](http://nexus.corp.qunar.com/nexus/#view-repositories;releases~browsestorage~qunar/tc/tcdev) 查找

~~~xml
<!-- TC公共组件pom -->
<dependencyManagement>
   <dependencies>
        <dependency>
        <groupId>qunar.tc</groupId>
        <artifactId>tcdev</artifactId>
        <version>最新版本</version>
        <type>pom</type>
        <scope>import</scope>
    </dependency>
</dependencyManagement>

<!-- qmq相关依赖 -->
<dependencies>
    <dependency>
        <groupId>qunar.tc</groupId>
        <artifactId>qmq-client</artifactId>
    </dependency>
</dependencies>
~~~

### 验证下有效性

之后可以点击IDEA中Maven刷新按钮, 或者使用命令行去下载安装依赖, 验证配置的正确性.

~~~bash
# 跳过测试, 下载依赖并构建项目
$ mvn clean install -DskipTests=true
~~~

没问题之后进行下一步.

<!-- ------------------------ -->





## 创建&消费消息

Duration: 3



### 创建基础组件

~~~java
/**
  * 使用配置类来创建基础组件Bean
  */
@Configuration
public class QmqConfig {
    /**
      * 也可以在xml文件中创建
      */
    @Bean
    public MessageProducerProvider messageProducerProvider() {
        return new MessageProducerProvider();
    }
}
~~~



### 创建生产者

~~~java
@Component
public class DemoProducer {
    private final MessageProducerProvider producer;
  
    /**
      * 使用构造器注入依赖
      */
    public DemoProducer(MessageProducerProvider provider) {
        this.producer = provider;
    }
  
    /**
     * 生产简单的消息
     */
    public void generateDemo(String demoName) {
       // 创建一个主题消息, 主题为qunar.train.demo
        Message message = producer.generateMessage("qunar.train.demo"); 
        // 设置一个demoName的属性, value是传入的
        message.setProperty("demoName", demoName);
        producer.sendMessage(message);
    }
}
~~~

### 消费者

~~~java
@Component
public class DemoConsumer {
    private Logger logger = LoggerFactory.getLogger(DemoConsumer.class);

    /**
      * 使用注解注册消费者,onMessage作为一个回调进行消费数据
      */
    @QmqConsumer(prefix = "qunar.train.demo", consumerGroup = "demo")
    public void onMessage(Message message) {
        String demoName = message.getStringProperty("demoName");
        logger.info("--------------------{}---------------------", demoName);
    }
}
~~~

## 验证效果

...

<!-- ------------------------ -->





## 管理后台使用

Duration: 1

### Hyperlinking

[Youtube - Halsey Playlists](https://www.youtube.com/user/iamhalsey/playlists)

### Images

![alt-text-here](assets/puppy.jpg)

<!-- ------------------------ -->





## 其他内容

Duration: 1

高级点的使用教程