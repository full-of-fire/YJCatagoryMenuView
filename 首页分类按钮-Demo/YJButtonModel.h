//
//  YJButtonModel.h
//  首页分类按钮-Demo
//
//  Created by yangjie on 16/1/6.
//  Copyright © 2016年 yangjie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJButtonModel : NSObject

@property (nonatomic,copy) NSString* imageUrl; // 图片地址

@property (nonatomic,copy) NSString* title; // 按钮标题

@property (nonatomic,assign) id data; // 用传递数据
@end
