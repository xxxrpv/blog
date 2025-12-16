/*
 Navicat Premium Data Transfer

 Source Server         : x
 Source Server Type    : MySQL
 Source Server Version : 50650 (5.6.50-log)
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50650 (5.6.50-log)
 File Encoding         : 65001

 Date: 05/05/2023 17:34:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appreciation` bit(1) NOT NULL,
  `commentabled` bit(1) NOT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `first_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `published` bit(1) NOT NULL,
  `recommend` bit(1) NOT NULL,
  `share_statement` bit(1) NOT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `views` int(11) NULL DEFAULT NULL,
  `type_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `tag_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKpk1w92t3gjjrk7wich8n3urp9`(`type_id`) USING BTREE,
  INDEX `FKpxk2jtysqn41oop7lvxcp6dqq`(`user_id`) USING BTREE,
  CONSTRAINT `FKpk1w92t3gjjrk7wich8n3urp9` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKpxk2jtysqn41oop7lvxcp6dqq` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (3, b'1', b'1', '2023-03-01 23:08:57.000000', '/images/img/1.jpg', '', b'1', b'1', b'1', '2023-04-08 10:50:17.000000', 17, 3, 1, 'Spring学习笔记之 IOC', '[![qWfJuF.jpg](https://s1.ax1x.com/2022/03/31/qWfJuF.md.jpg)](https://imgse.com/i/qWfJuF)\r\n[![qWf09x.md.jpg](https://s1.ax1x.com/2022/03/31/qWf09x.md.jpg)](https://imgse.com/i/qWf09x)\r\n[![qWfaNR.jpg](https://s1.ax1x.com/2022/03/31/qWfaNR.md.jpg)](https://imgse.com/i/qWfaNR)\r\n[![qWfd41.md.jpg](https://s1.ax1x.com/2022/03/31/qWfd41.md.jpg)](https://imgse.com/i/qWfd41)\r\n[![qWfDgK.md.jpg](https://s1.ax1x.com/2022/03/31/qWfDgK.md.jpg)](https://imgse.com/i/qWfDgK)\r\n[![qWfB36.md.jpg](https://s1.ax1x.com/2022/03/31/qWfB36.md.jpg)](https://imgse.com/i/qWfB36)\r\n[![qWfYB4.md.jpg](https://s1.ax1x.com/2022/03/31/qWfYB4.md.jpg)](https://imgse.com/i/qWfYB4)', '控制反转(IOC)是面向对象编程中的一种设计原则,可以用来减少计算机代码之间的耦合度。本质上是把对象创建和对象之间的调用关系交给Spring来进行管理。', '1');
INSERT INTO `blog` VALUES (4, b'1', b'1', '2023-03-01 23:23:43.000000', 'https://picsum.photos/800/450', '', b'1', b'1', b'1', '2023-04-25 10:59:02.000000', 19, 3, 1, '数据库 —— 事务', '[![qW2yuQ.md.jpg](https://s1.ax1x.com/2022/03/31/qW2yuQ.md.jpg)](https://imgse.com/i/qW2yuQ)\r\n[![qW2rjg.md.jpg](https://s1.ax1x.com/2022/03/31/qW2rjg.md.jpg)](https://imgse.com/i/qW2rjg)\r\n[![qW26Bj.md.jpg](https://s1.ax1x.com/2022/03/31/qW26Bj.md.jpg)](https://imgse.com/i/qW26Bj)\r\n[![qW2cHs.md.jpg](https://s1.ax1x.com/2022/03/31/qW2cHs.md.jpg)](https://imgse.com/i/qW2cHs)', '事务（Transaction）是访问并可能更新数据库中各项数据项的一个程序执行单元（unit）', '3');
INSERT INTO `blog` VALUES (5, b'1', b'1', '2023-03-02 23:52:55.000000', '/images/img/leetcode.png', '', b'1', b'1', b'1', '2023-03-29 18:56:59.000000', 21, 4, 1, 'LeetCode 53 最大子序和', '### 题目描述： 最大子序和      \r\n###### 给定一个序列（至少含有 1 个数），从该序列中寻找一个连续的子序列，使得子序列的和最大。\r\n\r\n        例如，给定序列 [-2,1,-3,4,-1,2,1,-5,4]，\r\n        连续子序列 [4,-1,2,1] 的和最大，为 6。\r\n\r\n\r\n### 贪心算法\r\n\r\n\r\n````java\r\n\r\n    public static int maxSubArray(int[] nums) {\r\n        if (nums.length ==1 ) return nums[0];\r\n        int temp=nums[0];\r\n        int count=temp;//记录最大连续和\r\n        for(int i=1;i<nums.length;i++){\r\n            if(temp<0) temp=nums[i];\r\n            else{\r\n                if(temp+nums[i]>=0)temp+=nums[i];\r\n                else temp=nums[i];\r\n            }\r\n\r\n            if(temp>count)count=temp;\r\n            System.out.println(temp);\r\n        }\r\n        return count;\r\n    }\r\n\r\n````\r\n### 动态规划\r\n1. dp[i]代表当前下标对应的最大值\r\n1. 递推公式 dp[i] = max (dp[i-1]+nums[i],nums[i]) res = max(res,dp[i])\r\n1. 初始化 都为 0\r\n1. 遍历方向，从前往后\r\n```java\r\npublic int maxSubArray1(int[] nums) {\r\n        if (nums.length == 1) {\r\n            return nums[0];\r\n        }\r\n        int result=nums[0];\r\n\r\n        int[] dp=new int[nums.length];//// dp[i]表示包括i之前的最大连续子序列和\r\n        dp[0] = nums[0];\r\n        for (int i = 1; i < nums.length; i++) {\r\n//            if(dp[i-1]>0){\r\n//                dp[i]=dp[i-1]+nums[i];\r\n//            }\r\n//            else dp[i]=nums[i];\r\n            dp[i]=Math.max(nums[i],nums[i]+dp[i-1]);\r\n            result=Math.max(dp[i],result);\r\n        }\r\n\r\n        return result;\r\n\r\n    }\r\n\r\n```', ' 给定一个序列（至少含有 1 个数），从该序列中寻找一个连续的子序列，使得子序列的和最大。', '4,2');
INSERT INTO `blog` VALUES (6, b'1', b'1', '2023-03-01 00:16:04.000000', '/images/img/3.jpg', '', b'1', b'0', b'1', '2023-03-05 15:23:22.000000', 16, 1, 1, 'SSM框架', '### SSM - 框架核心思想\r\n\r\n#### 什么是SSM\r\n\r\n- 在单体结构中，SSM指的是：SpringMVC+Spring+Mybatis\r\n- 在微服务架构中，SSM指的是：SpringMVC+SpringBoot+Mybatis\r\n- 此定义可能会有歧义，小伙伴不要开撕哈\r\n- **SpringMVC**\r\n  -  Spring MVC属于SpringFrameWork的后续产品，已经融合在Spring Web Flow里面。Spring MVC 分离了[控制器](https://link.zhihu.com/?target=http%3A//baike.baidu.com/view/122229.htm)、模型[对象](https://link.zhihu.com/?target=http%3A//baike.baidu.com/view/2387.htm)、分派器以及处理程序对象的角色，这种分离让它们更容易进行定制。 \r\n- **Spring**\r\n  - Spring是一个开源框架，Spring是于2003 年兴起的一个轻量级的Java 开发框架，由Rod Johnson 在其著作Expert One-On-One J2EE Development and Design中阐述的部分理念和原型衍生而来。它是为了解决企业应用开发的复杂性而创建的。Spring使用基本的JavaBean来完成以前只可能由EJB完成的事情。然而，Spring的用途不仅限于服务器端的开发。从简单性、可测试性和松耦合的角度而言，任何Java应用都可以从Spring中受益。 简单来说，Spring是一个轻量级的控制反转（IoC）和面向切面（AOP）的容器框架。\r\n- **Mybatis**\r\n  - MyBatis 本是[apache](https://link.zhihu.com/?target=http%3A//baike.baidu.com/view/28283.htm)的一个开源项目[iBatis](https://link.zhihu.com/?target=http%3A//baike.baidu.com/view/628102.htm), 2010年这个项目由apache software foundation 迁移到了google code，并且改名为MyBatis 。MyBatis是一个基于Java的[持久层](https://link.zhihu.com/?target=http%3A//baike.baidu.com/view/198047.htm)框架。iBATIS提供的[持久层](https://link.zhihu.com/?target=http%3A//baike.baidu.com/view/198047.htm)框架包括SQL Maps和Data Access Objects（DAO）MyBatis 消除了几乎所有的JDBC代码和参数的手工设置以及结果集的检索。MyBatis 使用简单的 XML或注解用于配置和原始映射，将接口和 Java 的POJOs（Plain Old Java Objects，普通的 Java对象）映射成数据库中的记录。\r\n\r\n#### 如何演变到SSM\r\n\r\n- 在EJB时代，大量的配置使得系统的开发慢的很，然后呢？出现了问题就解决问题。\r\n- 刚刚开始，原本是使用JDBC操作数据库，然后JDBC操作数据库太繁琐了，然后就又出现了JDBCTemple，用来简化操作，然后在开发中，又发现JDBCTemplate操作还是麻烦，然后又演变出了Hibernate这样的一款全自动框架，然后又发现Hibernate入门简单，但是想要SQL调优是很不方便的，所以，一款半自动框架ibatis出世，后来ibatis被捐献给Apache，改名为Mybatis，并成为Apache的顶级项目，现在已经开源到Github\r\n- Spring框架是一个轻量级框架，其核心就是为了解决繁琐的配置（**虽然SSM的整合配置也挺多，但是随着SpringBoot时代开启，约定大于配置，几乎见不到繁琐的XML配置了**）和实现快速开发\r\n- 核心思想就是为了更快更有效的开发。\r\n\r\n#### Spring\r\n\r\n- 看到这个，很多人会和你说什么控制反转（IoC），依赖注入（DI）、AOP、事务什么……对新手来说，这些是什么鬼呢？\r\n\r\n##### 控制反转\r\n\r\n- 我不写定义，就说一下你的电脑。你的电脑上有usb口吧，有hdmi口吧。电脑上用什么键盘，不取决于电脑本身，而是插在usb上的键盘是什么？这个能理解吧。你看控制电脑用什么输入的设备并不是由电脑控制的，而是你插入的键盘是什么来控制的。这个控制不就反了吗？\r\n\r\n##### 依赖注入\r\n\r\n- 就是控制反转。电脑的输入设备依赖它被插入的是什么键盘。插入机械键盘，输入设备就是机械键盘，插入数字键盘就只能输入数字。从插键盘这个事来说：无非是从电脑角度看，是依赖注入，输入设备是什么依赖注入的键盘是什么；从键盘角度看是控制反转，插入的键盘来控制电脑是什么输入设备。\r\n\r\n- 为什么要用依赖注入？目的就是可以灵活搭配。如果你的电脑上的键盘是焊死在电脑上的，键盘坏了，你的电脑也废了。你肯定不想这样吧。\r\n\r\n- Java开发中，我们需要创建大量的对象，有些重要的对象牵一发而动全身，这样的对象我们可以交给Spring帮我们来创建，我们只需要提供配置文件，这个配置文件可以是xml，也可以是java本身。好比Spring是个工厂，按图纸就可以做出产品。\r\n\r\n##### AOP\r\n\r\n- 什么是切面？你可以这样想：一个公司有多个销售部，都需要行政帮忙搞定日常的订文具、机票、办公室、出差酒店什么的，都需要财务搞定报销、收付款什么的事务吧，要仓库帮忙发货什么的。不可能每个销售部都去招几个行政、财务和仓管什么吧，销售部门只要做好业务就行了，订文具什么的事情交个专门的部门去办就行。\r\n\r\n- 在Spring AOP 中，把这些公共的事务，也就是这个例子中的行政啊、财务啊、仓管啊，看成一个个切面，让你的开发的时候，专注于核心业务。\r\n\r\n##### 事务\r\n\r\n- 说个例子：比如我支付宝转给你100块钱，正常操作应该是我的账号里少了100，你的多了100。如果由于各种原因，我少100后，系统出问题了。没有事务的话，你的账号不会多100，而我的账号少了100。这个就是有问题了。有事务的话：要不我少100你多100都成功，要不就都不成功，这样钱才不会少。而手写一个事务还是有点小难度的，Spring的事务(spring-tx)可以帮我们轻松实现。\r\n\r\n#### SpringMVC\r\n\r\n- 这个的话，你要先理解一下MVC是什么？\r\n\r\n- C - Controller：控制器。接受用户请求，调用 Model 处理，然后选择合适的View给客户。\r\n\r\n- M - Model：模型。业务处理模型，接受Controller的调遣，处理业务，处理数据。\r\n\r\n- V - View：视图。返回给客户看的结果。注意这里的客户未必是人，可能是浏览器，可能是APP。\r\n\r\n- 这样想必你不明白，举例：你去饭店吃饭，坐下来后，服务员小妹来找你点菜。你点了个宫保鸡丁，小妹就拿着你的点菜单都后厨。后厨的师傅打开食物储藏柜，找到鸡丁，开炉子，放油，一顿爆炒，装盘。小妹端起盘子回到你的桌子。当然，如果小妹觉得你帅，说不定还会偷偷加个鸡腿给你；如果你碰巧是当年甩了小妹的前男友，说不定小妹会吐口口水在里面。\r\n\r\n- 这里，你就是客户，你点菜就是发出请求（Request），小妹就是Controller，后厨就是 Model，小妹最后给的盘子及里面的内容就是View，小妹给你盘子就是响应（Respond）。Controller处理客户请求，反馈给Model。Model处理，返回数据（宫保鸡丁）给Controller（小妹）。小妹可以直接给你，也可以给你加鸡腿或吐口水后给你。最终，你得到了一盘吃的（View）。\r\n\r\n- Spring MVC就是个MVC框架，和Spring天生就集成。\r\n\r\n#### Mybatis\r\n\r\n- 一个帮你和数据库打交道的框架。帮你把数据库的表翻译成类，字段翻译成类的字段，记录翻译成对象。（当然这些全要靠你自己定义。）\r\n\r\n- 这样做的后果就是，你可以像写java一样操作数据库了。什么打开JDBC，防止sql注入，不用考虑，MyBatis帮你搞定。\r\n\r\n- Spring中，通过简单的设置就可以集成MyBatis这个框架，所以会有SSM框架的说法。\r\n\r\n#### ORM思想\r\n\r\n- 从配置文件(通常是XML配置文件中)得到 sessionfactory.\r\n\r\n- 由sessionfactory 产生 session\r\n\r\n- 在session 中完成对数据的增删改查和事务提交等.\r\n\r\n- 在用完之后关闭session 。\r\n\r\n- 在java 对象和 数据库之间有做mapping 的配置文件，也通常是xml 文件。\r\n\r\n', 'SSM框架是Spring、Spring MVC  和Mybatis框架的整合，是继SSH之后，主流的Java EE企业级框架', '1,2');
INSERT INTO `blog` VALUES (7, b'1', b'1', '2023-03-01 16:37:28.000000', 'https://picsum.photos/800/450', '转载', b'1', b'0', b'1', '2023-04-03 10:05:02.000000', 25, 5, 1, '数据库 —— 索引', '### MySQL索引基础篇\r\n\r\n> 简介：MySQL中不同的存储引擎的索引的实现方式是不同的\r\n\r\n#### 索引是什么\r\n\r\n- 数据库索引，是数据库索引系统（DBMS）中一个排序的数据结构，以协助快速查询、更新数据库表中的数据\r\n- 数据是以文件的形式存储在磁盘文件中的，每一行的数据都有其磁盘地址。\r\n\r\n\r\n- MyISAM\r\n  - 有单独的索引文件，但是索引过多的话，索引文件会变大（将会占据很多空间）\r\n  - 叶子节点只保存的是索引+物理行地址\r\n  - 索引的本质：键值对（索引列值，物理地址）\r\n  - 先判断查询是否走了索引，先查询索引文件，找到物理地址，再由地址直接直接定位到数据表\r\n  - 索引是单独的文件\r\n- InnoDB\r\n  - **索引文件不是一个单独的文件，它和数据文件是合二为一的**\r\n  - 索引和数据>数据文件中>聚簇索引\r\n\r\n#### 索引算法\r\n\r\n- B+Tree （索引的数据结构）\r\n  - 聚簇索引 - MySQL会自动选择主键列座位聚簇索引列\r\n    - 非叶子节点：聚簇索引列的值\r\n    - 叶子节点：聚簇索引列值以及真实的数据\r\n  - 非聚簇索引 \r\n    - 非叶子节点：非聚簇索引列的值\r\n    - 叶子节点：键值对（非聚簇索引列的值，主键值）\r\n\r\n#### 优缺点\r\n\r\n- 好处：加快了查询速度\r\n- 坏处：降低了增删改的速度（insert、delete、update）增大了表的文件大小，（索引文件有时候甚至比数据文件还大）\r\n\r\n#### 索引类型\r\n\r\n- 普通索引（index）：仅仅是加快了查询速度\r\n- **唯一索引（unique）**：行上的值不可以重复\r\n- **主键索引（primary key）**：不能重复\r\n- **全文索引（fulltext）：仅可用于MyISAM表**，针对较大的数据，生成全文索引很消耗空间\r\n- 组合索引[覆盖索引]：为了更多的提高MySQL的效率可以建立组合索引，遵循 “最左前缀”原则\r\n\r\n#### 索引语法\r\n\r\n##### 创建索引总览\r\n\r\n```mysql\r\ncreate table table_name(\r\n	[col_name data type]\r\n    [unique|fulltext][index|key] [index_name](col_name[length]) [asc|desc]\r\n)\r\n```\r\n\r\n- unique|fulltext 为可选参数，分别表示唯一索引，全文索引\r\n- index和key为同义词，两者作用相同，用来指定创建索引\r\n- col_name 为需要创建索引的字段列，该列必须从数据表中该定义字段的多个列中选择\r\n- length 为可选参数，表示索引的长度，只有字符串类型的字段才能指定索引的长度\r\n- asc或desc指定升序或降序的索引值存储\r\n\r\n##### 索引的使用方式\r\n\r\n- 查看某张表上所有的索引\r\n\r\n```mysql\r\nshow index from table_name [\\G] -- 如果是在cmd窗口，可以换行\r\n```\r\n\r\n- 建立索引\r\n\r\n```mysql\r\n-- 索引名字可以不写，不写默认使用列名\r\nalter table 表名 add index/unique/fulltext 索引名(列名); \r\n\r\ncreate index 索引名 on 表名(列值)\r\n```\r\n\r\n- 删除索引\r\n\r\n```mysql\r\nalter table 表名 drop index 索引名字。\r\n```\r\n\r\n\r\n- 删除非主键索引\r\n\r\n```mysql\r\nalter table 表名 drop index 索引名;\r\n```\r\n\r\n- 删除主键索引\r\n\r\n```mysql\r\nalter table 表名 drop primary key;\r\n```\r\n\r\n\r\n```\r\n\r\n#### 索引失效的情况\r\n\r\n- 引用type从优到差：System-->**const-->eq_ref-->ref-->ref_or_null-->index_merge-->unique_subquery-->index_subquery-->**range-->index-->all(全表扫描的意思)\r\n\r\n```mysql\r\ndrop table index_test;\r\ncreate table index_test(\r\n    id int(7) primary key,\r\n    a int(7),\r\n    b int(7),\r\n    c varchar(20),\r\n    d varchar(20)\r\n);\r\ninsert into index_test values(1,100,10,\'aaa\',\'A\');\r\ninsert into index_test values(2,300,30,\'aba\',\'BB\');\r\ninsert into index_test values(3,200,20,\'caa\',\'CC\');\r\ninsert into index_test values(4,100,10,\'daa\',\'DD\');\r\ninsert into index_test values(5,500,50,\'aad\',\'FF\');\r\n\r\n-- 举例：创建复合索引\r\ncreate index index_test_abc on index_test(a,b,c);\r\n```\r\n\r\n##### 遵循最左原则\r\n\r\n- 简介：**针对的是复合索引，**最左边的列一定要和创建符合索引的第一个列保持一致\r\n- 符合索引(a,b,c) 必须要连续\r\n\r\n```mysql\r\n-- a,b,c都是走了索引的\r\nexplain select * from index_test where a = 100 and b = 10 and c=\'aaa\';\r\n\r\n-- a列走了索引,但是c列没有走索引,原因是跳过了复合索引的b列\r\nexplain select * from index_test where a=100 and c=\'aaa\';\r\n\r\n-- a列和b列都是走了索引的,并且它们是连续的.\r\nexplain select * from index_test where a=100 and b=10;\r\n\r\n-- 最左原则\r\n-- 索引完全失效,不符合最左匹配原则.where最左边的检索列不是复合索引的第一个列a\r\n\r\n-- 原因同上\r\nexplain select * from index_test where b=10;//没有走索引\r\n\r\nexplain select * from index_test where a=100;//走了索引\r\n\r\nexplain select * from index_test where c=\'aaa\';//没有走索引\r\n```\r\n\r\n##### 范围之后索引列也会失效\r\n\r\n```mysql\r\n-- a列和b列是走了索引的,但是c列没有走索引.因为c列是范围之后的判断\r\nexplain select * from index_test where a=100 and b>10 and c=\'aaa\';\r\n```\r\n\r\n##### 模糊查询\r\n\r\n```mysql\r\n-- like \'%\'出现在末尾,仍然a,b,c都是走索引\r\nexplain select * from index_test where a=100 and b=10 and c like \'a%\';\r\n\r\n-- 只有a,b是走了索引的,c是没有走索引的\r\nexplain select * from index_test where a=100 and b=10 and c like \'%a\';\r\n\r\n-- 只有a,b是走了索引的,c是没有走索引的\r\nexplain select * from index_test where a=100 and b=10 and c like \'%a%\';\r\n```\r\n\r\n\r\n\r\n##### 索引列添加了计算\r\n\r\n-  运算如+，-，*，/等 \r\n-  优化的话，要把运算放在值上，或者在应用程序中直接算好\r\n\r\n```mysql\r\n-- 索引失效\r\nexplain select * from index_test where id+5>7;\r\n\r\n-- 应用场景:\r\nexplain select * from index_test where months>5*12;\r\n```\r\n\r\n##### 索引列参加运算符\r\n\r\n```mysql\r\n-- is null(走索引)和is not null(不走索引)\r\nexplain select * from s_emp where commission_pct is not null;\r\n-- is not null是不支持索引的\r\n-- in(走了索引)  not in(不走索引)\r\n```\r\n\r\n##### 利用索引列查询出来的数据超过整张表的30%.\r\n\r\n##### where语句中包含or时，可能会导致索引失效\r\n\r\n- 使用or并不是一定会使索引失效，你需要看or左右两边的查询列是否命中相同的索引。\r\n- 假设USER表中的user_id列有索引，age列没有索引。\r\n- 下面这条语句其实是命中索引的\r\n\r\n```mysql\r\nselect * from `user` where user_id = 1 or user_id = 2;\r\n```\r\n\r\n-  但是这条语句是无法命中索引的。 \r\n\r\n```mysql\r\nselect * from `user` where user_id = 1 or age = 20;\r\n```\r\n\r\n-  假设age列也有索引的话，依然是无法命中索引的。 \r\n\r\n```mysql\r\nselect * from `user` where user_id = 1 or age = 20;\r\n```\r\n\r\n##### where语句中索引列使用了负向查询，可能会导致索引失效\r\n\r\n-  负向查询包括：NOT、!=、<>、!<、!>、NOT IN、NOT LIKE等。 \r\n\r\n-  其实负向查询并不绝对会索引失效，这要看MySQL优化器的判断，全表扫描或者走索引哪个成本低了。 \r\n\r\n##### 隐式类型转换导致的索引失效 \r\n\r\n-  比如下面语句中索引列user_id为varchar类型，不会命中索引： \r\n\r\n```mysql\r\nselect * from `user` where user_id = 12;\r\n```\r\n\r\n- 这是因为MySQL做了隐式类型转换，调用函数将user_id做了转换。 \r\n\r\n```mysql\r\nselect * from `user` where CAST(user_id AS signed int) = 12;\r\n```\r\n\r\n##### 隐式字符编码转换导致的索引失效\r\n\r\n- 当两个表之间做关联查询时，如果两个表中关联的字段字符编码不一致的话，MySQL可能会调用CONVERT函数，将不同的字符编码进行隐式转换从而达到统一。作用到关联的字段时，就会导致索引失效。\r\n- 比如下面这个语句，其中d.tradeid字符编码为utf8，而l.tradeid的字符编码为utf8mb4。因为utf8mb4是utf8的超集，所以MySQL在做转换时会用CONVERT将utf8转为utf8mb4。简单来看就是CONVERT作用到了d.tradeid上，因此索引失效。\r\n\r\n```mysql\r\nselect d.* from tradelog l , trade_detail d where d.tradeid=CONVERT(l.tradeid USING utf8) and l.id=2; \r\n```\r\n\r\n#####  如果mysql估计使用全表扫描要比使用索引快,则不使用索引 \r\n\r\n##### 在ORDER BY操作中，MYSQL只有在排序条件不是一个查询条件表达式的情况下才使用索引\r\n\r\n- 尽管如此，在涉及多个数据表的查询里，即使有索引可用，那些索引在加快ORDER BY操作方面也没什么作用 \r\n\r\n##### 在JOIN操作中（需要从多个数据表提取数据时）\r\n\r\n- MYSQL只有在主键和外键的数据类型相同时才能使用索引，否则即使建立了索引也不会使用 \r\n\r\n#### 建立索引的策略\r\n\r\n- 主键列和唯一性列						√\r\n\r\n- 不经常发生改变的[在update列数据的数据的时候,也会更新索引文件]				√\r\n\r\n- 满足以上2个条件,经常作为查询条件的列	√\r\n\r\n- 重复值太多的列						×\r\n\r\n- null值太多的列						×\r\n\r\n- 禁止在更新十分频繁、区分度不高的属性上建立索引。\r\n  - 更新会变更B+树，更新频繁的字段建立索引会大大降低数据库性能。\r\n  - “性别”这种区分度不大的属性，建立索引是没有什么意义的，不能有效过滤数据，性能与全表扫描类似。\r\n- 建立组合索引，必须把区分度高的字段放在前面。\r\n\r\n', '索引（index）是为了加速对表中数据行的检索而创建的一种分散的存储结构。', '3');
INSERT INTO `blog` VALUES (8, b'1', b'1', '2023-03-04 16:45:30.000000', 'https://picsum.photos/800/450', '', b'1', b'0', b'1', '2023-04-03 15:09:15.000000', 14, 5, 1, '数据库 —— 锁机制', '### 数据库锁\r\n\r\n\r\nMySQL有三种锁的级别：页级、表级、行级。\r\n\r\n- **表级锁：**开销小，加锁快；不会出现死锁；锁定粒度大，发生锁冲突的概率最高,并发度最低。\r\n- **行级锁：**开销大，加锁慢；会出现死锁；锁定粒度最小，发生锁冲突的概率最低,并发度也最高。\r\n- **页面锁：**开销和加锁时间界于表锁和行锁之间；会出现死锁；锁定粒度界于表锁和行锁之间，并发度一般\r\n\r\n\r\n\r\n**什么是死锁？**\r\n\r\n**死锁:** 是指两个或两个以上的进程在执行过程中。因争夺资源而造成的一种互相等待的现象,若无外力作用,它们都将无法推进下去。此时称系统处于死锁状态或系统产生了死锁,这些永远在互相等竺的进程称为死锁进程。\r\n\r\n表级锁不会产生死锁.所以解决死锁主要还是针对于最常用的InnoDB。\r\n\r\n**死锁的关键在于：**两个(或以上)的Session加锁的顺序不一致。\r\n\r\n- 那么对应的解决死锁问题的关键就是：让不同的session加锁有次序。\r\n\r\n**死锁的解决办法?**\r\n\r\n**1.查出的线程杀死 kill**\r\n\r\n```mysql\r\nSELECT trx_MySQL_thread_id FROM information_schema.INNODB_TRX;\r\n```\r\n\r\n**2.设置锁的超时时间**\r\n\r\n- Innodb 行锁的等待时间，单位秒。可在会话级别设置，RDS 实例该参数的默认值为 50（秒）。\r\n\r\n- 生产环境不推荐使用过大的 **innodb_lock_wait_timeout**参数值\r\n\r\n- 该参数支持在会话级别修改，方便应用在会话级别单独设置某些特殊操作的行锁等待超时时间，如下：\r\n  set innodb_lock_wait_timeout=1000; —设置当前会话 Innodb 行锁等待超时时间，单位秒。\r\n\r\n**3.指定获取锁的顺序**\r\n\r\n#### 有哪些锁（乐观锁悲观锁），select 时怎么加排它锁?\r\n\r\n**悲观锁（Pessimistic Lock）:**\r\n\r\n- 悲观锁特点:先获取锁，再进行业务操作。\r\n\r\n- 即“悲观”的认为获取锁是非常有可能失败的，因此要先确保获取锁成功再进行业务操作。通常所说的“一锁二查三更新”即指的是使用悲观锁。通常来讲在数据库上的悲观锁需要数据库本身提供支持，即通过常用的select … for update操作来实现悲观锁。\r\n\r\n- 当数据库执行select for update时会获取被select中的数据行的行锁，因此其他并发执行的select for update如果试图选中同一行则会发生排斥（需要等待行锁被释放），因此达到锁的效果。select for update获取的行锁会在当前事务结束时自动释放，因此必须在事务中使用。\r\n\r\n**补充**\r\n\r\n- 不同的数据库对select for update的实现和支持都是有所区别的，\r\n\r\n- oracle支持select for update no wait，表示如果拿不到锁立刻报错，而不是等待，MySQL就没有no wait这个选项。\r\n\r\n- MySQL还有个问题是select for update语句执行中所有扫描过的行都会被锁上，这一点很容易造成问题。因此如果在MySQL中用悲观锁务必要确定走了索引，而不是全表扫描。\r\n\r\n**乐观锁（Optimistic Lock）:**\r\n\r\n- 乐观锁，也叫乐观并发控制，它假设多用户并发的事务在处理时不会彼此互相影响，各事务能够在不产生锁的情况下处理各自影响的那部分数据。在提交数据更新之前，每个事务会先检查在该事务读取数据后，有没有其他事务又修改了该数据。如果其他事务有更新的话，那么当前正在提交的事务会进行回滚。\r\n\r\n- 乐观锁的特点先进行业务操作，不到万不得已不去拿锁。即“乐观”的认为拿锁多半是会成功的，因此在进行完业务操作需要实际更新数据的最后一步再去拿一下锁就好。\r\n  乐观锁在数据库上的实现完全是逻辑的，不需要数据库提供特殊的支持。\r\n\r\n- 一般的做法是在需要锁的数据上增加一个版本号，或者时间戳，\r\n\r\n**实现方式举例如下：**\r\n\r\n- 乐观锁（给表加一个版本号字段） 这个并不是乐观锁的定义，给表加版本号，是数据库实现乐观锁的一种方式。\r\n\r\n```mysql\r\nSELECT data AS old_data, version AS old_version FROM …;\r\n-- 根据获取的数据进行业务操作，得到new_data和new_version\r\nUPDATE SET data = new_data, version = new_version WHERE version = old_version\r\nif (updated row > 0) {\r\n--  乐观锁获取成功，操作完成\r\n} else {\r\n-- 乐观锁获取失败，回滚并重试\r\n}\r\n```\r\n\r\n**注意：**\r\n\r\n- 乐观锁在不发生取锁失败的情况下开销比悲观锁小，但是一旦发生失败回滚开销则比较大，因此适合用在取锁失败概率比较小的场景，可以提升系统并发性能\r\n- 乐观锁还适用于一些比较特殊的场景，例如在业务操作过程中无法和数据库保持连接等悲观锁无法适用的地方。\r\n\r\n#### 总结\r\n\r\n- 悲观锁和乐观锁是数据库用来保证数据并发安全防止更新丢失的两种方法，例子在select … for update前加个事务就可以防止更新丢失。悲观锁和乐观锁大部分场景下差异不大，一些独特场景下有一些差别，一般我们可以从如下几个方面来判断。\r\n\r\n- **响应速度：**如果需要非常高的响应速度，建议采用乐观锁方案，成功就执行，不成功就失败，不需要等待其他并发去释放锁。\'\r\n\r\n- **冲突频率：**如果冲突频率非常高，建议采用悲观锁，保证成功率，如果冲突频率大，乐观锁会需要多次重试才能成功，代价比较大。\r\n\r\n- **重试代价：**如果重试代价大，建议采用悲观锁。\r\n\r\n', '锁机制可以保护数据库中数据的安全，保证数据库中数据的一致性与有效性', '3');
INSERT INTO `blog` VALUES (9, b'1', b'1', '2023-03-01 16:46:07.000000', '/images/img/2.jpg', '', b'1', b'0', b'1', '2023-04-08 09:24:15.000000', 15, 1, 1, 'Java —— 反射机制', '### 反射机制\r\n\r\n#### Java反射机制概述\r\n\r\n**动态语言和静态语言**\r\n\r\n**动态语言**\r\n\r\n- 是一类可以在运行时改变其结构的语言\r\n- Object-c、C#、JavaScript、PHP、Python\r\n\r\n**静态语言**\r\n\r\n- 与动态语言对应的，运行时结构不可以改变的语言，如 Java、C、C++\r\n- Java不是动态语言，但是Java可以称之为\"准动态语言\"，也就是Java有一定的动态性\r\n\r\n**反射**\r\n\r\nReflection（反射）是Java被视为动态语言的关键，反射机制允许程序在执行期间借助于Reflection API 取得任何类的内部信息，并能直接操作任意对象的内部属性和方法\r\n\r\n```java\r\nClass c = Class.forName(\"java.lang.String\");\r\n```\r\n\r\n加载完类之后，在堆内存的方法区中就产生了一个Class类型的对象（一个类只有一个Class对象），这个对象就包含了完整的类的结构信息，我们可以通过这个对象，获得类的所有的属性方法\r\n\r\n- 正常方式：引入需要的“包类”名称 -> 通过 new 实例化 -> 取得实例化对象\r\n- 反射方式：实例化对象 -> getClass()方法 -> 得到完整的”包类“名称\r\n\r\n**优点**\r\n\r\n- 可以实现动态创建对象和编译，体现出很大的灵活性\r\n\r\n**缺点**\r\n\r\n- 对性能有影响，使用反射基本上是一种解释操作，我们可以高速JVM，我们希望做什么并且它能满足我们的需求，这类操作总是慢于直接执行相同的操作。\r\n\r\n**反射主要的API**\r\n\r\n```\r\njava.lang.Class 代表一个类\r\njava.lang.reflect.Method 代表类的方法\r\njava.lang.reflect.Field 代表类的成员变量\r\njava.lang.reflect.Constructor 代表类的构造器\r\n```\r\n\r\n#### 理解Class类并获取Class实例\r\n\r\n```java\r\npublic class Test01 {\r\n    public static void main(String[] args) throws Exception {\r\n        // 通过反射获取Class对象\r\n        Class<?> clazz = Class.forName(\"cn.icanci.reflection.User\");\r\n        Class<?> clazz2 = Class.forName(\"cn.icanci.reflection.User\");\r\n        Class<?> clazz3 = Class.forName(\"cn.icanci.reflection.User\");\r\n        // 一个类在内存中只有一个Class对象\r\n        // 一个类被加载之后，类的整个结构都会被封装在Class对象中\r\n        System.out.println(clazz == clazz2);\r\n        System.out.println(clazz2 == clazz3);\r\n        User user = (User) clazz.newInstance();\r\n        user.setUsername(\"hello\");\r\n        System.out.println(user);\r\n    }\r\n}\r\n\r\nclass User {\r\n    private String username;\r\n    private int id;\r\n\r\n    private int age;\r\n	\r\n    // 省略 getter 、 setter 、 toString ...\r\n}\r\n\r\n```\r\n\r\n**Class类**\r\n\r\n在Object类中定义了一下方法，此方法被所有的子类继承\r\n\r\n```java\r\npublic final native Class<?> getClass();\r\n```\r\n\r\n上面的方法返回值的类型是一个Class类，此类事Java反射的源头，实际上所谓反射从程序的运行结果来看也很好理解：可以通过对象反射求出类的名称\r\n\r\n对象照镜子可以得到的信息：某个类的属性、方法和构造器、某个类到底实现了哪些接口。对于每个类而言，JRE都为其保留一个不变的Class类型的对象，一个Class类型的对象包含了特定的某个结构（class/interface/enum/annotation/primitive type/void[]）\r\n\r\n- Class 本身就是一个类\r\n- Class只能由系统创建对象\r\n- 一个加载的累在JVM中只会有一个Class实例\r\n- 一个Class实例对象对应的是一个加载到JVM中的一个class文件\r\n- 每个类的实例都会记得自己由哪个Class实例生成\r\n- 通过Class类可以完整的得到一个类中的所有的被加载的结构\r\n- Class类是Reflecttion可以的根源，针对任何你想动态加载、运行的类，唯有先获得相应的Class对象\r\n\r\n**Class类的常用方法**\r\n\r\n| 方法名                                | 功能说明                                                  |\r\n| ------------------------------------- | --------------------------------------------------------- |\r\n| static ClassforName(String name)      | 返回指定类名name的Class对象                               |\r\n| Object newInstance()                  | 调用缺省构造函数，返回一个Class对象的一个实例             |\r\n| getName()                             | 返回此Class对象所表示的实体(类，接口，数组或者void)的名称 |\r\n| Class getSuperClass()                 | 返回当前Class对象的父类的Class对象                        |\r\n| Class[] getinterfaces()               | 返回当前Class对象的接口                                   |\r\n| ClassLoader getClassLoader()          | 返回该类的类加载器                                        |\r\n| Constructor[] getConstructors()       | 返回一个包含某些Constructor对象的数组                     |\r\n| Method getMethod(String name,Class T) | 返回一个Method对象，此对象类型为paramType                 |\r\n| Field[] getDeclareds()                | 返回Field对象的有一个数组                                 |\r\n', '反射就是Reflection，Java的反射是指程序在运行期可以拿到一个对象的所有信息。 ', '2');
INSERT INTO `blog` VALUES (10, b'1', b'1', '2023-03-04 22:06:50.000000', '/images/img/leetcode.png', '', b'1', b'0', b'1', '2023-04-03 22:06:50.000000', 7, 4, 1, 'LeetCode 77 组合', '### 题目描述： 组合      \r\n###### 给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。\r\n示例: 输入: n = 4, k = 2 输出: [ [2,4], [3,4], [2,3], [1,2], [1,3], [1,4], ]\r\n\r\n### 回溯法\r\n```java\r\nList<List<Integer>> result = new ArrayList();\r\n    public List<List<Integer>> combine(int n, int k) {\r\n        ArrayList<Integer> list = new ArrayList<>();\r\n        backTracking(n,k,1,list);\r\n        return result;\r\n\r\n    }\r\n    public void backTracking(int n, int k,int cur,ArrayList<Integer> list) { //k层数\r\n        if(list.size()==k){\r\n            result.add(new ArrayList<>(list));\r\n            return;\r\n        }\r\n        for (int i = cur; i <=n; i++) {\r\n            list.add(i);\r\n            backTracking(n,k,i+1,list);\r\n            list.remove(list.size() - 1);\r\n        }\r\n\r\n    }\r\n```', '给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。', '2,4');
INSERT INTO `blog` VALUES (11, b'1', b'1', '2023-03-01 00:11:14.000000', '/images/img/leetcode.png', '', b'1', b'0', b'1', '2023-04-04 16:59:07.000000', 11, 4, 1, 'LeetCode 151 反转字符串中的单词', '### 题目描述： 组合      \r\n###### 给定一个字符串，逐个翻转字符串中的每个单词。\r\n输入：s = \"the sky is blue\"\r\n输出：\"blue is sky the\"\r\n\r\n### 解题思路如下：\r\n\r\n1. 移除多余空格\r\n1. 将整个字符串反转\r\n1. 将每个单词反转\r\n\r\n```java\r\n    public String reverseWords(String s) {\r\n        StringBuilder sb=removeExtraSpaces(s);\r\n        reverseString(sb,0,sb.length()-1);\r\n         reverseEachWord(sb);\r\n\r\n         return sb.toString();\r\n    }\r\n    ////去除所有空格并在相邻单词之间添加空格, （快慢指针）\r\n    public StringBuilder removeExtraSpaces(String s){\r\n        int start=0;\r\n        int end = s.length()-1;\r\n        while (s.charAt(start)==\' \')start++;\r\n        while (s.charAt(end)==\' \') end--;\r\n        StringBuilder sb = new StringBuilder();\r\n\r\n        while(start <= end){\r\n            char c = s.charAt(start);\r\n            if(c!=\' \'||s.charAt(start-1)!=\' \'){\r\n                sb.append(c);\r\n            }\r\n            start++;\r\n        }\r\n        return sb;\r\n    }\r\n    /**\r\n     * 反转字符串指定区间[start, end]的字符\r\n     */\r\n    public static void reverseString(StringBuilder sb, int start, int end) {\r\n        while (start <= end) {\r\n            char temp=sb.charAt(start);\r\n            sb.setCharAt(start,sb.charAt(end));\r\n            sb.setCharAt(end,temp);\r\n            start++;\r\n            end--;\r\n        }\r\n    }\r\n    /*\r\n    *\r\n    * */\r\n    public static void reverseEachWord(StringBuilder sb) {\r\n        int left=0;\r\n        int right=1;\r\n        while(right<sb.length()){\r\n            if (sb.charAt(right) != \' \') {\r\n                right++;\r\n            }\r\n            else {\r\n                reverseString(sb,left,right-1);\r\n\r\n                left=right+1;\r\n                right++;\r\n            }\r\n\r\n        }\r\n        reverseString(sb,left,right-1);\r\n\r\n\r\n    }\r\n\r\n    public static void main(String[] args) {\r\n        StringBuilder sb =new StringBuilder(\"HELLO WORLD\");\r\n        reverseEachWord(sb);\r\n        System.out.println(sb.toString());\r\n    }\r\n```', '给定一个字符串，逐个翻转字符串中的每个单词。', '4,2');
INSERT INTO `blog` VALUES (12, b'1', b'1', '2023-03-01 00:21:53.000000', '/images/img/leetcode.png', '', b'1', b'0', b'1', '2023-04-09 00:49:37.000000', 17, 4, 1, 'LeetCode 200 岛屿数量', '### 题目描述： 岛屿数量      \r\n###### 给你一个由 \'1\'（陆地）和 \'0\'（水）组成的的二维网格，请你计算网格中岛屿的数量。岛屿总是被水包围，并且每座岛屿只能由水平方向或竖直方向上相邻的陆地连接形成。此外，你可以假设该网格的四条边均被水包围。\r\n\r\n------------\r\n\r\n\r\n\r\n示例:  \r\n输入：grid = [  \r\n  [\"1\",\"1\",\"1\",\"1\",\"0\"],  \r\n  [\"1\",\"1\",\"0\",\"1\",\"0\"],  \r\n  [\"1\",\"1\",\"0\",\"0\",\"0\"],  \r\n  [\"0\",\"0\",\"0\",\"0\",\"0\"]  \r\n]   \r\n输出：1  \r\n\r\n------------\r\n\r\n\r\n\r\n### 并查集\r\n```java\r\n/****************并查集******************/\r\n    int count=0;\r\n    public int unionFind(char[][] grid){\r\n        int row =grid.length;\r\n        int col =grid[0].length;\r\n\r\n        count=row*col;\r\n        int waters=0;\r\n        int[] root=new int[count];\r\n        for (int i = 0; i < count; i++) {\r\n            root[i]=i;\r\n        }\r\n\r\n        for (int i = 0; i < row; i++) {\r\n            for (int j = 0; j < col; j++) {\r\n                if(grid[i][j]==\'0\')\r\n                    waters++;\r\n                else{\r\n                    int[][] points=new int[][]{{0,1},{0,-1},{1,0},{-1,0}};\r\n                    for (int[] point :points){\r\n                        int x=i+point[0];\r\n                        int y=j+point[1];\r\n                        if(x>=0&&x<row&&y>=0&&y<col&&grid[x][y]==\'1\')\r\n                            union(x*col+y,i*col+j,root);  //遍历上下左右节点,传入在一维数组中的坐标,进行同化\r\n                    }\r\n                }\r\n            }\r\n        }\r\n        return count-waters;  //row*col-union_count-waters\r\n    }\r\n    public int find(int x,int[] root){\r\n        if (x==root[x])return x;\r\n        return root[x]=find(root[x],root);\r\n\r\n    }\r\n    public void union(int x,int y,int[] root){\r\n        int rootX=find(x,root);\r\n        int rootY=find(y,root);\r\n        if (rootX!=rootY){\r\n            root[rootX]=rootY;\r\n            count--;\r\n        }\r\n    }\r\n```\r\n### DFS\r\n```java\r\n//**************DFS********************/\r\n    public int dfs(char[][] grid){\r\n        int result=0;\r\n        int row = grid.length;\r\n        int col = grid[0].length;\r\n        for (int i = 0; i < row; i++) {\r\n            for (int j = 0; j < col; j++) {\r\n                if(grid[i][j]==\'1\'){\r\n                    result++;\r\n                    dfs_work(i,j,row,col,grid);\r\n                }\r\n            }\r\n\r\n        }\r\n        return result;\r\n    }\r\n    public void dfs_work(int x,int y,int row,int col,char[][] grid){//递归体\r\n        if(x<0||y<0||x>row-1||y>col-1||grid[x][y]==\'0\')return;\r\n        grid[x][y]=\'0\';\r\n        dfs_work(x-1,y,row,col,grid);\r\n        dfs_work(x+1,y,row,col,grid);\r\n        dfs_work(x,y-1,row,col,grid);\r\n        dfs_work(x,y+1,row,col,grid);\r\n    }\r\n```\r\n### BFS\r\n```java\r\n//**************BFS********************/\r\n    public int bfs(char[][] grid){\r\n        int result=0;\r\n        int row = grid.length;\r\n        int col = grid[0].length;\r\n        Queue<int[]> queue = new LinkedList<>();\r\n        for (int i = 0; i < row; i++) {\r\n            for (int j = 0; j < col; j++) {\r\n                if (grid[i][j] == \'1\') {\r\n                    result++;\r\n                    queue.add(new int[]{i, j});\r\n                    grid[i][j] = 0;\r\n                    while (!queue.isEmpty()) {\r\n                        int[] cur = queue.poll();\r\n                        int x = cur[0];\r\n                        int y = cur[1];\r\n                        if (x - 1 >=0 && grid[x - 1][y] == \'1\') { //>=0\r\n                            queue.add(new int[]{x - 1, y});\r\n                            grid[x - 1][y] = \'0\';\r\n                        }\r\n                        if (y - 1 >= 0 && grid[x][y - 1] == \'1\') {\r\n                            queue.add(new int[]{x, y - 1});\r\n                            grid[x][y - 1] = \'0\';\r\n                        }\r\n                        if (x + 1 < row && grid[x + 1][y] == \'1\') {\r\n                            queue.add(new int[]{x + 1, y});\r\n                            grid[x + 1][y] = \'0\';\r\n                        }\r\n                        if (y + 1 < col && grid[x][y + 1] == \'1\') {\r\n                            queue.add(new int[]{x, y + 1});\r\n                            grid[x][y + 1] = \'0\';\r\n                        }\r\n                    }\r\n                }\r\n            }\r\n        }\r\n        return result;\r\n    }\r\n```', '并查集 | BFS | DFS', '2,4');
INSERT INTO `blog` VALUES (13, b'1', b'1', '2023-03-01 00:42:44.000000', '/images/img/leetcode.png', '', b'1', b'0', b'1', '2023-04-01 00:47:56.000000', 9, 4, 1, 'LeetCode 63  不同路径 II', '### 题目描述： 不同路径 II      \r\n######   一个机器人位于一个 m x n 网格的左上角  机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角\r\n######   现在考虑网格中有障碍物。那么从左上角到右下角将会有多少条不同的路径？\r\n######   网格中的障碍物和空位置分别用 1 和 0 来表示。  \r\n\r\n------------\r\n  \r\n示例: 输入：obstacleGrid = [[0,0,0],[0,1,0],[0,0,0]]   \r\n输出：2  \r\n解释：3x3 网格的正中间有一个障碍物。  \r\n从左上角到右下角一共有 2 条不同的路径：  \r\n1. 向右 -> 向右 -> 向下 -> 向下  \r\n2. 向下 -> 向下 -> 向右 -> 向右  \r\n\r\n\r\n------------\r\n\r\n\r\n### 动态规划\r\n- dp[i][j] ：表示从（0 ，0）出发，到(i, j) 有dp[i][j]条不同的路径。\r\n- 递推公式  dp[i][j] = dp[i - 1][j] + dp[i][j - 1]。\r\n\r\n```java\r\n  public int uniquePathsWithObstacles(int[][] obstacleGrid) {\r\n        int m = obstacleGrid.length;\r\n        int n = obstacleGrid[0].length;\r\n        if (obstacleGrid[m - 1][n - 1] == 1) return 0;\r\n        int[][] dp = new int[m][n];\r\n        dp[0][0] = 1;\r\n        for (int i = 0; i < m; i++) {\r\n            for (int j = 0; j < n; j++) {\r\n                if (obstacleGrid[i][j] == 1) {\r\n                    dp[i][j] = -1;\r\n                    continue;\r\n                }\r\n                if (j - 1 >= 0 && dp[i][j - 1] >= 0) dp[i][j] += dp[i][j - 1];\r\n                if (i - 1 >= 0 && dp[i - 1][j] >= 0) dp[i][j] += dp[i - 1][j];\r\n//                System.out.println(dp[i][j]);\r\n            }\r\n\r\n        }\r\n\r\n        return dp[m - 1][n - 1];\r\n    }\r\n```', '一个机器人位于一个 m x n 网格的左上角  机器人每次只能向下或者向右移动一步。机器人试图达到网格的右下角', '2,4');
INSERT INTO `blog` VALUES (14, b'1', b'1', '2023-03-01 10:45:31.000000', '/images/img/1.jpg', '', b'1', b'1', b'1', '2023-04-26 10:45:31.000000', 26, 3, 1, 'Spring学习笔记之 AOP', '[![qWgGoq.md.jpg](https://s1.ax1x.com/2022/03/31/qWgGoq.md.jpg)](https://imgse.com/i/qWgGoq)\r\n[![qWcXZR.md.jpg](https://s1.ax1x.com/2022/03/31/qWcXZR.md.jpg)](https://imgse.com/i/qWcXZR)\r\n[![qWgLp8.md.jpg](https://s1.ax1x.com/2022/03/31/qWgLp8.md.jpg)](https://imgse.com/i/qWgLp8)', 'AOP是一种面向切面的编程,是基于动态代理的,对原有代码毫无入侵性,把和主业务无关的事情,放到代码外面去做。', '1');

-- ----------------------------
-- Table structure for blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `blog_tags`;
CREATE TABLE `blog_tags`  (
  `blog_id` bigint(20) NOT NULL,
  `tag_id` bigint(20) NOT NULL,
  INDEX `FKmw8u76fxjdexf049slt8qds7k`(`tag_id`) USING BTREE,
  INDEX `FKti2koe4o5wgd9bw1unuxwsby4`(`blog_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog_tags
-- ----------------------------
INSERT INTO `blog_tags` VALUES (1, 2);
INSERT INTO `blog_tags` VALUES (1, 1);
INSERT INTO `blog_tags` VALUES (2, 2);
INSERT INTO `blog_tags` VALUES (2, 1);
INSERT INTO `blog_tags` VALUES (5, 4);
INSERT INTO `blog_tags` VALUES (5, 2);
INSERT INTO `blog_tags` VALUES (10, 2);
INSERT INTO `blog_tags` VALUES (10, 4);
INSERT INTO `blog_tags` VALUES (13, 2);
INSERT INTO `blog_tags` VALUES (13, 4);
INSERT INTO `blog_tags` VALUES (12, 2);
INSERT INTO `blog_tags` VALUES (12, 4);
INSERT INTO `blog_tags` VALUES (9, 2);
INSERT INTO `blog_tags` VALUES (14, 1);
INSERT INTO `blog_tags` VALUES (3, 1);
INSERT INTO `blog_tags` VALUES (4, 3);
INSERT INTO `blog_tags` VALUES (7, 3);
INSERT INTO `blog_tags` VALUES (8, 3);
INSERT INTO `blog_tags` VALUES (6, 1);
INSERT INTO `blog_tags` VALUES (6, 2);
INSERT INTO `blog_tags` VALUES (11, 4);
INSERT INTO `blog_tags` VALUES (11, 2);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` bigint(20) NOT NULL,
  `admin_comment` bit(1) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `blog_id` bigint(20) NULL DEFAULT NULL,
  `parent_comment_id` bigint(20) NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKhvh0e2ybgg16bpu229a5teje7`(`parent_comment_id`) USING BTREE,
  INDEX `FKkap39f76wn135k7ru564fbjb7`(`blog_id`) USING BTREE,
  CONSTRAINT `FKhvh0e2ybgg16bpu229a5teje7` FOREIGN KEY (`parent_comment_id`) REFERENCES `comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for hibernate_sequence
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequence`;
CREATE TABLE `hibernate_sequence`  (
  `next_val` bigint(20) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of hibernate_sequence
-- ----------------------------

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `time` datetime NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES (2, NULL, 'https://s1.ax1x.com/2022/03/31/qfsY6J.md.jpg', NULL);
INSERT INTO `picture` VALUES (3, NULL, 'https://s1.ax1x.com/2022/03/31/qfsJl4.md.jpg', NULL);
INSERT INTO `picture` VALUES (4, NULL, 'https://s1.ax1x.com/2022/03/31/qWb7rt.md.jpg', NULL);
INSERT INTO `picture` VALUES (5, NULL, 'https://s1.ax1x.com/2022/03/31/qWb48H.md.jpg', NULL);
INSERT INTO `picture` VALUES (6, NULL, 'https://s1.ax1x.com/2022/03/31/qWbyK1.md.jpg', NULL);
INSERT INTO `picture` VALUES (7, NULL, 'https://s1.ax1x.com/2022/03/31/qWb3gs.md.jpg', NULL);

-- ----------------------------
-- Table structure for t_blog
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `first_picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `views` int(11) NULL DEFAULT NULL,
  `appreciation` int(11) NOT NULL DEFAULT 0,
  `share_statement` int(11) NOT NULL DEFAULT 0,
  `commentabled` int(11) NOT NULL DEFAULT 0,
  `published` int(11) NOT NULL DEFAULT 0,
  `recommend` int(11) NOT NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `type_id` bigint(20) NULL DEFAULT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `tag_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_blog
-- ----------------------------

-- ----------------------------
-- Table structure for t_blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `t_blog_tags`;
CREATE TABLE `t_blog_tags`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) NULL DEFAULT NULL,
  `blog_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_blog_tags
-- ----------------------------

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `blog_id` bigint(20) NULL DEFAULT NULL,
  `parent_comment_id` bigint(20) NULL DEFAULT NULL,
  `admin_comment` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES (1, 'Jack', 'xxxrpv@gmail.com', '1111', '/images/profile/avatar.png', '2023-05-04 18:39:19', 5, -1, 1);

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_tag
-- ----------------------------

-- ----------------------------
-- Table structure for t_type
-- ----------------------------
DROP TABLE IF EXISTS `t_type`;
CREATE TABLE `t_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_type
-- ----------------------------

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, 'Spring');
INSERT INTO `tag` VALUES (2, 'Java');
INSERT INTO `tag` VALUES (3, '数据库');
INSERT INTO `tag` VALUES (4, 'LeetCode');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '技术交流');
INSERT INTO `type` VALUES (2, '摸鱼日记');
INSERT INTO `type` VALUES (3, '学习笔记');
INSERT INTO `type` VALUES (4, '刷题');
INSERT INTO `type` VALUES (5, '转载');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '/images/profile/avatar.png', NULL, NULL, 'Jack', 'c6f057b86584942e415435ffb1fa93d4', NULL, NULL, 'Jack');

SET FOREIGN_KEY_CHECKS = 1;
