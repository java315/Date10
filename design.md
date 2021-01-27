Date10 设计文档

[TOC]

## 写在开头

>重点强调的是：**数据描述表示的不是数据模型的完整定义，而是在这个页面下可能会用到的数据**，数据模型的实现将严格按照数据描述中进行实现，数据接口内的描述也将持续更新

## 1 首页√

### 1.1 页面布局

![image-20210125195254366](\design.assets\image-20210125195254366.png)

### 1.2 功能简述

- 搜索
- 分类导航（CollectionView)：提供美食、景点、酒吧、电影等按钮，点击按钮跳转到具体的分类页面
- 动态展示（TableView）：按照最新发布时间展示所有用户的public动态，展示以卡片方式展示，展示的数据定义见[数据接口](#1.3 数据接口)



**动态展示的卡片示意**

<img src="\design.assets\Screenshot_20210125_164051_com.dianping.v1.jpg" alt="Screenshot_20210125_164051_com.dianping.v1" style="zoom: 25%;" />

### 1.3 数据接口

动态展示的数据定义为：

```swift
class Post{
    var postId:Int //不展示，用于索引
    var title:String
    var poster:String
    var likes:Int  //点赞
    var address:String
    var frontImg:UIImage
    var isPublic:Bool
    var images = [UIImage]() //不在首页展示
}
```



### 1.4 相关代码

- `IndexViewController.swift`：实现页面相关
- `IndexPostCollectionViewCell.swift`：展示动态的卡片
- `ButtonCollectionViewCell.swift`：分类导航的按钮



### 1.5 跳转描述

1. 点击分类导航的按钮可以跳转到具体的分类页面：[美食分类](#6 美食分类)、[景点分类](#7 景点分类)
2. 点击动态展示的某一条动态会跳转到具体的[动态详情页](#5 动态详情页)

## 2 消息√

### 2.1 页面布局

<img src="\design.assets\image-20210125195311513.png" alt="image-20210125195311513"  />

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

## 3 我们√

### 3.1 页面布局

![image-20210125195341448](\design.assets\image-20210125195341448.png)

### 3.2 功能简述

- 情侣信息展示（horizontal stack view）：展示情侣头像和情侣信息（见[数据接口](#3.3 数据接口)），如果没有情侣，则将另一个头像改为灰色，情侣信息展示为“单身狗贵族”
- 情侣动态展示（table view）：展示情侣两人发布的动态信息
- 动态发布（button）

### 3.3 数据接口

```swift
class Couple {
    var boy : String
    var girl : String
    var startTime : Date
    var sweetValue: Int
    func getTogetherDays() -> Int {}
    
}

class Post { // 同首页中的动态定义
    
}
```



### 3.4 相关代码

- `Couple.swift`：情侣的定义
- `PostTableViewController`



### 3.5 跳转描述

1. 点击动态发布按钮，跳转到[动态发布页面](#9 动态发布页)

2. 点击某一动态，跳转到[动态详情页](#5 动态详情页)

   

## 4 我√

### 4.1 页面布局

![image-20210125195357520](\design.assets\image-20210125195357520.png)

### 4.2 功能简述

查看个人信息以及修改个人设置

### 4.3 数据接口

```swift
class User {
    var name : String
    var npy : String
    var fans = [String]()
    var followings = [String]()
    var birthday : Date
    var avatar : UIImage? //头像
    
}
```



### 4.4 相关代码

- `User.swift`
- `MeViewController.swift`

### 4.5 跳转描述

**暂时不做跳转**

## 5 动态详情页√

### 5.1 页面布局

![image-20210126190502513](\design.assets\image-20210126190502513.png)

### 5.2 功能简述

- 展示一条动态的详细信息
- 发表评论

### 5.3 数据接口

```swift
class Post{
    var postId:Int //不展示，用于索引
    var title:String
    var content:String
    var poster:String
    var likes:Int  //点赞
    var address:String
    var frontImg:UIImage
    var isPublic:Bool
    var images = [UIImage]() //不在首页展示
    var comments = [Comment]()
    var postDate : Date
}

class PostComment {
    var content:String
    var date:Date
    var commenter:String
    var likes:Int
}
```



### 5.4 相关代码

- `Comment.swift`
- `Post.swift`
- `PostDetailViewController.swift`
- `PostCommentCollectionViewCell.swift`:动态中评价的cell

### 5.5 跳转描述

无



## 6 美食分类√

### 6.1 页面布局

![image-20210125203000604](\design.assets\image-20210125203000604.png)

### 6.2 功能简述

- 搜索
- 展示美食（table view)

### 6.3 数据接口

```swift
class Food {
    var name : String
    var score : Float
    var averagePrice : Float
    var address : String
    var shortComment : String
    var frontImg : UIImage
    func getCommentsCount() -> Int {}
}
```



### 6.4 相关代码

- `FoodViewController.swift`
- `FoodCollectionViewCell.swift`
- `Food.swift`

### 6.5 跳转描述

1. 点击具体的美食后将跳转到[美食详情页](#10 美食详情页)


## 7 景点分类√

### 7.1 页面布局

![image-20210126182625359](\design.assets\image-20210126182625359.png)

### 7.2 功能简述

- 展示所有景点信息
- 搜索

### 7.3 数据接口

```swift
class Spot {
    var name : String
    var hotValue : Int
    var shortComment : String
    var frontImg : UIImage
   	var images = [UIImage]()
    var comments = [SpotComment]()
    //地点
    var score : Float
}
```



### 7.4 相关代码

- `Spot.swift`
- `SpotViewController.swift`
- `SpotCollectionViewCell.swift`

### 7.5 跳转描述

点击具体的景点跳转到[景点详情页](#8 景点详情页)

## 8 景点详情页√

### 8.1 页面布局

![image-20210126183459221](\design.assets\image-20210126183459221.png)

### 8.2 功能简述

- 景点评价发布
- 展示景点详情

### 8.3 数据接口

```swift
class SpotComment {
    var commenter : String
    var date : Date
    var likes : Int
    var content : String
    var images = [UIImage]()
}

class Spot { // 同7.3
    
}
```



### 8.4 相关代码

* `SpotDetailViewController.swift`
* `SpotDetailCommentCollectionViewCell.swift`

### 8.5 跳转描述

暂无

## 9 动态发布页

### 9.1 页面布局

![image-20210126190438546](\design.assets\image-20210126190438546.png)

### 9.2 功能简述

- 发表一条动态：包括动态的文字描述、图片、地点

### 9.3 数据接口

```swift
class Post { 
    var content : String
    var poster : String
    var images = [UIImage]()
    var address : String
}
```



### 9.4 相关代码

* `PostDetailViewController.swift`
* `PostCommentCollectionViewCell.swift`

### 9.5 跳转描述

1. 点击发布or取消后都会跳转回上一页面
2. 点击图片输入后会跳转到选择图片的页面

## 10 美食详情页√

### 10.1 页面布局

![image-20210126190053942](\design.assets\image-20210126190053942.png)

### 10.2 功能简述

- 展示美食的详细信息

- 给美食下的评论点赞
- 发表对当前美食的评论

### 10.3 数据接口

```swift
class FoodComment {
    var likes : Int
    var date : Date
    var content : String
    var commenter : String
    var score : Int
}
class Food{
    var images = [UIImage]()
    var comments = [FoodComment]()
    var name : String
    var score : Float
}
```



### 10.4 相关代码

* `FoodDetailViewController.swift`
* `FoodDetailCommentCollectionViewCell.swift`

### 10.5 跳转描述

1. 点击发布后跳转到[评价发布页](11 评价发布页)

   

## 11 评价发布页

### 11.1 页面布局

![image-20210126190153449](\design.assets\image-20210126190153449.png)

### 11.2 功能简述

发布评价

### 11.3 数据接口

```swift
class FoodComment {
    
}

class SpotComment {
    
}
```



### 11.4 相关代码

### 11.5 跳转描述

点击取消or发布都会跳转回上一页面

## 暂无

暂无，后续会加上