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
    var isPublic:Bool
    var images = [UIImage]() //不在首页展示
}
```



### 1.4 相关代码

- `IndexViewController.swift`：实现页面相关
- `NewsTableViewCell.swift`：展示动态的卡片
- `ButtonCollectionViewCell.swift`：分类导航的按钮



### 1.5 跳转描述

1. 点击分类导航的按钮可以跳转到具体的分类页面：[美食分类](#6 美食分类)、[景点分类](#7 景点分类)
2. 点击动态展示的某一条动态会跳转到具体的[动态详情页](#5 动态详情页)

## 2 消息

### 2.1 页面布局

### 2.2 功能简述

查看其他用户、系统向该用户发送的消息

- 搜索：根据用户输入的关键字查找相关消息并跳转到[消息搜索结果页](#暂无)展示
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



### 2.4 相关代码

- `Message.swift`：消息的定义
- `Communication.swift`：会话的定义
- `MessageTableViewController.swift`
- `MessageTableViewCell.swift`

### 2.5 跳转描述

1. 点击具体的会话会跳转到[会话详情页](#暂无)
2. 系统通知、收到的赞、新增粉丝暂时留空

## 3 我们

### 3.1 页面布局

### 3.2 功能简述

- 情侣信息展示（horizontal stack view）：展示情侣头像和情侣信息（见[数据接口](#3.3 数据接口)），如果没有情侣，则将另一个头像改为灰色，情侣信息展示为“单身狗贵族”
- 情侣动态展示（table view）：展示情侣两人发布的动态信息
- 动态发布（button）

### 3.3 数据接口

```swift
class couple {
    var boy : String
    var girl : String
    var startTime : Date
    var sweetValue: Int
    func getTogetherDays() -> Int {}
    
}

class News { // 同首页中的动态定义
    
}
```



### 3.4 相关代码

- `Couple.swift`：情侣的定义
- `NewsTableViewController`



### 3.5 跳转描述

1. 点击动态发布按钮，跳转到[动态发布页面](#9 动态发布页)

2. 点击某一动态，跳转到[动态详情页](#5 动态详情页)

   

## 4 我

### 4.1 页面布局

### 4.2 功能简述

### 4.3 数据接口

### 4.4 相关代码

### 4.5 跳转描述



## 5 动态详情页

### 5.1 页面布局

### 5.2 功能简述

### 5.3 数据接口

### 5.4 相关代码

### 5.5 跳转描述





## 6 美食分类





## 7 景点分类





## 8 地点详情页





## 暂无

暂无，后续会加上