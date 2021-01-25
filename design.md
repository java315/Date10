Date10 设计文档

[TOC]



## 1 首页

### 1.1 页面布局

暂无

### 1.2 功能简述

- 搜索
- 分类导航（CollectionView)：提供美食、景点、酒吧、电影等按钮，点击按钮跳转到具体的分类页面
- 动态展示（TableView）：按照最新发布时间展示所有用户的public动态，展示以卡片方式展示，展示的数据定义见[数据接口](#1.3 数据接口)



**动态展示的卡片示意**

<img src="D:\github\Date10\design.assets\Screenshot_20210125_164051_com.dianping.v1.jpg" alt="Screenshot_20210125_164051_com.dianping.v1" style="zoom: 25%;" />

### 1.3 数据接口

动态展示的数据定义为：

```swift
class News{
    var postId:Int //不展示，用于索引
    var title:String
    var poster:String
    var good:Int  //点赞
    var address:String
    var frontImg:UIImage
}
```



### 1.4 控制代码

- `IndexViewController.swift`：实现页面控制
- `NewsTableViewCell`：展示动态的卡片



### 1.5 跳转描述

1. 点击分类导航的按钮可以跳转到具体的分类页面
2. 点击动态展示的某一条动态会跳转到具体的动态详情页

## 2 消息

### 2.1 页面布局

### 2.2 功能简述

查看其他用户、系统向该用户发送的消息

- 搜索：根据用户输入的关键字查找相关消息并跳转到[消息搜索结果页]()展示
- 系统通知
- 收到的赞
- 新增粉丝
- 普通消息展示：展示所有与该用户有关的`Communication`中的最新一条`Message`，展示发送方的头像、用户名和消息内容、发送时间（见[数据接口](#2.3 数据接口)）

### 2.3 数据接口

```swift
class Message{
    var sender:String
    var content:String
    var sendTime:Date
}

class Communication {
    var users = [String]()
    var messages = [Message]()
}
```



### 2.4 控制代码

### 2.5 跳转描述





## 3 我们

### 3.1 页面布局

### 3.2 功能简述

### 3.3 数据接口

### 3.4 控制代码

### 3.5 跳转描述

## 4 我

### 4.1 页面布局

### 4.2 功能简述

### 4.3 数据接口

### 4.4 控制代码

### 4.5 跳转描述



## 5 动态详情页

### 5.1 页面布局

### 5.2 功能简述

### 5.3 数据接口

### 5.4 控制代码

### 5.5 跳转描述





## 6 美食分类





## 7 景点分类





## 8 地点详情页

