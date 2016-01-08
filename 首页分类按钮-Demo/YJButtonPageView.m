//
//  YJButtonPageView.m
//  首页分类按钮-Demo
//
//  Created by yangjie on 16/1/6.
//  Copyright © 2016年 yangjie. All rights reserved.
//

#import "YJButtonPageView.h"
// 分类按钮被点击的通知
NSString *const YJCatagoryButtonClickNotcification = @"CatagoryButtonClickNotcification";
@implementation YJButtonPageView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setButtonModels:(NSArray *)buttonModels {

    _buttonModels = buttonModels;
    
    NSUInteger count = buttonModels.count;
    
    for (int i = 0; i<count; i++) {
        
        YJCatagoryButton *button = [[YJCatagoryButton alloc] init];
        YJButtonModel *model = buttonModels[i];
        
        [button sd_setImageWithURL:[NSURL URLWithString:model.imageUrl] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        [button setTitle:model.title forState:UIControlStateNormal];
        
        // 把模型中数据传递给按钮，这样每个按钮对应有数据
        button.data = model;
        
        // 监听按钮的点击事件
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:button];
    }
}

- (void)layoutSubviews {

    [super layoutSubviews];
    
    NSUInteger count = self.buttonModels.count;
    
    CGFloat buttonW = self.width/ YJCatagroyButtonMaxCols;
    
    CGFloat buttonH = self.height/YJCatagoryButtonMaxRows;
    
    for (int i = 0; i<count; i++) {
    
        YJCatagoryButton *button = self.subviews[i];
        button.x = buttonW*(i%YJCatagroyButtonMaxCols);
        button.y = buttonH*(i/YJCatagroyButtonMaxCols);
        button.width = buttonW;
        button.height = buttonH;
        
        
    }
}

#pragma mark - 按钮被点击了
- (void)buttonClick:(YJCatagoryButton*)button{

    //在这里发送通知
    
    [[NSNotificationCenter defaultCenter] postNotificationName:YJCatagoryButtonClickNotcification object:button];
}

@end
