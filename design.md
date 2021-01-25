Date10 设计文档

[TOC]



## 页面描述

### 1 首页

#### 1.1 页面布局

暂无

#### 1.2 功能简述

- 搜索
- 分类导航（CollectionView)：提供美食、景点、酒吧、电影等按钮，点击按钮跳转到具体的分类页面
- 动态展示（TableView）：按照最新发布时间展示所有用户的public动态，展示以卡片方式展示，展示的数据定义见[数据接口](#1.3 数据接口)



**动态展示的卡片示意**

<img src="D:\github\Date10\design.assets\Screenshot_20210125_164051_com.dianping.v1.jpg" alt="Screenshot_20210125_164051_com.dianping.v1" style="zoom: 25%;" />

#### 1.3 数据接口

动态展示的数据定义为：

```swift
class News{
    postId:Int //不展示，用于索引
    title:String
    poster:String
    good:Int  //点赞
    address:String
    frontImg:UIImage
}
```



#### 1.4 控制代码

- `IndexViewController.swift`：实现页面控制
- `NewsTableViewCell`：展示动态的卡片

