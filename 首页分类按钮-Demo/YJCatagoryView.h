//
//  YJCatagoryView.h
//  首页分类按钮-Demo
//
//  Created by yangjie on 16/1/6.
//  Copyright © 2016年 yangjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJButtonPageView.h"
@class YJCatagoryView;
@protocol YJCatagoryViewDelegate <NSObject>
@optional
// 按钮被点击的协议
- (void)catagoryView:(YJCatagoryView*)catagoryView catagoryButtonDidClick:(YJCatagoryButton*)catagoryButton;

@end

@interface YJCatagoryView : UIView
// 数组中包含按钮模型
@property (nonatomic,strong) NSArray *buttonModels;
/**
 *  代理
 */
@property(nonatomic, weak) id<YJCatagoryViewDelegate> delegate;
@end
