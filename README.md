# 个人博客系统

基于 Spring Boot + MyBatis + Redis 实现的轻量级个人博客后端系统，支持博客发布/编辑/删除、分类/标签管理、评论层级展示、用户登录鉴权等核心功能，兼顾性能与安全性。

随着个人创作需求的增长，需要一款轻量、易维护的博客管理系统，满足用户个性化创作与内容管理需求。本博客基于 Spring Boot，使用 Spring MVC、MyBatis 搭建，前端使用 HTML+Semantic UI 框架+Thymeleaf 模板，集成了 PageHelper、MD5 加密、Tocbot、MarkDown 等插件。

## 一、技术栈

| 技术 / 框架       | 版本 / 用途                     |
| ----------------- | ------------------------------- |
| Spring Boot       | 2.7.x（核心框架）               |
| MyBatis           | 3.5.x（ORM 框架，操作数据库）   |
| MySQL             | 5.7+/8.0（关系型数据库）        |
| Redis             | 5.0+（缓存，提升查询性能）      |
| PageHelper        | 1.4.x（分页插件）               |
| Lombok            | 1.18.x（简化实体类代码）        |
| Spring Security   | 5.7.x（密码加密、CSRF 防护）    |
| SLF4J + Logback   | 日志记录（替代控制台输出）      |
| Maven             | 3.6+（项目构建工具）            |

## 二、环境要求

1. JDK：1.8 及以上（推荐 1.8）
2. MySQL：5.7 或 8.0（需提前创建数据库）
3. Redis：5.0+（本地/远程 Redis 服务，需开启并配置密码）
4. Maven：3.6+（依赖管理与打包）
5. IDE：IntelliJ IDEA/Eclipse（推荐 IDEA）

## 三、快速部署

### 1. 克隆代码

```bash
git clone [仓库地址]
cd blog-backend
```

### 2. 数据库配置

#### （1）创建数据库

```sql
CREATE DATABASE blog_system DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

#### （2）导入数据表

执行项目根目录 `sql/blog_system.sql` 文件，自动创建博客、分类、标签、评论、用户等表结构。

### 3. 配置文件修改

修改 `src/main/resources/application.yml`，配置数据库、Redis 连接信息。

## 四、核心功能模块

| 模块             | 核心功能                                                         |
| ---------------- | -------------------------------------------------------------- |
| 博客管理         | 博客发布/编辑/删除、分页查询、按分类/标签筛选、热门博客推荐、内容缓存 |
| 分类/标签管理    | 分类/标签的增删改查、博客与分类/标签的关联管理                   |
| 评论管理         | 评论提交、层级展示（父评论+子评论）、评论列表分页、评论内容校验       |
| 用户管理         | 管理员登录鉴权、密码加密存储、登录状态拦截                         |
| 缓存管理         | Redis 缓存博客数据、缓存更新/删除、防止缓存穿透/击穿/雪崩           |

## 五、项目目录结构

```
src/main/java/com/blog/
├── BlogApplication.java       // 项目启动类
├── controller/                // 控制器层（接收请求、返回响应）
│   ├── BlogController.java    // 博客相关接口
│   ├── CommentController.java // 评论相关接口
│   ├── TypeController.java    // 分类相关接口
│   ├── TagController.java     // 标签相关接口
│   └── UserController.java    // 用户相关接口
├── service/                   // 服务层（业务逻辑实现）
│   ├── impl/                  // 服务实现类
│   └── *Service.java          // 服务接口
├── mapper/                    // Mapper 接口（MyBatis 数据访问）
├── entity/                    // 实体类（对应数据库表）
│   ├── Blog.java
│   ├── Type.java
│   ├── Tag.java
│   ├── Comment.java
│   └── User.java
├── vo/                        // 视图对象（前端展示专用，减少冗余字段）
│   ├── DetailedBlog.java      // 博客详情 VO
│   ├── RecommendBlog.java     // 推荐博客 VO
│   └── ShowBlog.java          // 博客列表展示 VO
├── config/                    // 配置类
│   ├── RedisConfig.java       // Redis 配置
│   ├── WebConfig.java         // 拦截器、资源映射配置
│   └── SecurityConfig.java    // 安全配置（密码加密、CSRF）
├── exception/                 // 自定义异常
│   ├── BlogNotFoundException.java
│   └── GlobalExceptionHandler.java // 全局异常处理器
└── utils/                     // 工具类
    ├── RedisService.java      // Redis 缓存操作封装
    └── CommonUtils.java       // 通用工具（如 VO 转换）

src/main/resources/
├── application.yml            // 全局配置文件
├── mapper/                    // MyBatis 映射文件（SQL 语句）
└── static/                    // 静态资源（CSS/JS/图片）
```

## 六、Redis 缓存策略（核心优化点）

### 1. 缓存场景
- 单篇博客查询（优先查缓存，无则查库并更新缓存）
- 热门博客列表（缓存减少数据库高频查询）
- 分类/标签列表（低频变更数据，长期缓存）

### 2. 缓存更新规则
- 新增博客：数据库写入后，主动将博客数据写入 Redis
- 修改/删除博客：数据库操作后，删除对应 Redis 缓存（下次查询自动加载最新数据）
- 缓存过期时间：博客缓存默认 30 分钟，防止缓存长期无效

### 3. 缓存防护
- 缓存穿透：对不存在的博客 ID，缓存空值（避免直击数据库）
- 缓存击穿：热门博客查询加互斥锁（防止缓存过期后大量请求查库）
- 性能优化：用 `scan` 替代 `keys` 命令遍历缓存键，避免 Redis 阻塞
