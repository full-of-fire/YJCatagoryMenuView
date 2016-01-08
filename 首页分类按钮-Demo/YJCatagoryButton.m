//
//  YJCatagoryButton.m
//  首页分类按钮-Demo
//
//  Created by yangjie on 16/1/6.
//  Copyright © 2016年 yangjie. All rights reserved.
//

#import "YJCatagoryButton.h"

@implementation YJCatagoryButton

- (void)layoutSubviews {

    [super layoutSubviews];
    self.imageView.height = self.height - 20;
    self.imageView.width = self.imageView.height;
    self.imageView.x = (self.width - self.imageView.width)/2;
    self.imageView.y = 0;
    
    self.titleLabel.x = 0;
    self.titleLabel.y = CGRectGetMaxY(self.imageView.frame);
    self.titleLabel.width = self.width;
    self.titleLabel.height = 20;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    
}

@end
