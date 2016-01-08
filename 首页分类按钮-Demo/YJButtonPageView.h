//
//  YJButtonPageView.h
//  首页分类按钮-Demo
//
//  Created by yangjie on 16/1/6.
//  Copyright © 2016年 yangjie. All rights reserved.
// 用来表示一页的分类的按钮（里面显示1~8个按钮）

#import <UIKit/UIKit.h>
#import "YJButtonModel.h"
#import "YJCatagoryButton.h"
#import "UIButton+WebCache.h"
// 分类按钮被点击的通知
extern NSString *const  YJCatagoryButtonClickNotcification;
// 一页中最多2行
#define YJCatagoryButtonMaxRows 2
// 一页中最多的 4列
#define YJCatagroyButtonMaxCols 4
// 每页的最多按钮个数
#define YJButtonPageSize (YJCatagoryButtonMaxRows*YJCatagroyButtonMaxCols)

@interface YJButtonPageView : UIView
// 数组中包含按钮模型
@property (nonatomic,strong) NSArray *buttonModels;
@end
