//
//  YJCatagoryView.m
//  首页分类按钮-Demo
//
//  Created by yangjie on 16/1/6.
//  Copyright © 2016年 yangjie. All rights reserved.
//

#import "YJCatagoryView.h"


@interface YJCatagoryView ()<UIScrollViewDelegate>
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIPageControl *pageControl;
@end

@implementation YJCatagoryView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        // 1.UIScollView
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        // 去除水平方向的滚动条
        scrollView.showsHorizontalScrollIndicator = NO;
        // 去除垂直方向的滚动条
        scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:scrollView];
        self.scrollView = scrollView;
        
        // 2.pageControl
        UIPageControl *pageControl = [[UIPageControl alloc] init];
        pageControl.userInteractionEnabled = NO;
        // 设置内部的圆点图片(kvc设置图片)
//        [pageControl setValue:[UIImage imageNamed:@"compose_keyboard_dot_normal"] forKeyPath:@"pageImage"];
//        [pageControl setValue:[UIImage imageNamed:@"compose_keyboard_dot_selected"] forKeyPath:@"currentPageImage"];
        // 设置未选中的颜色
        pageControl.pageIndicatorTintColor = [UIColor purpleColor];
        // 设置当前选中颜色
        pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
        
        [self addSubview:pageControl];
        self.pageControl = pageControl;
        
        // 在这里监听按钮被点击的通知
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(noticeAction:) name:YJCatagoryButtonClickNotcification object:nil];
    }
    return self;
}


- (void)dealloc {
  
   // 注销通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 收到通知的反应
- (void)noticeAction:(NSNotification*)notice {

    YJCatagoryButton *button = notice.object;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(catagoryView:catagoryButtonDidClick:)]) {
        
        [self.delegate catagoryView:self catagoryButtonDidClick:button];
    }
}

// 根据按钮模型来创建
- (void)setButtonModels:(NSArray *)buttonModels {

    _buttonModels = buttonModels;
    
    // 页数计算公式
    NSUInteger count = (buttonModels.count + YJButtonPageSize - 1)/YJButtonPageSize;
    
    // 设置页数
    self.pageControl.numberOfPages = count;
    
    //创建每页的控件
    for (int i = 0; i<count; i++) {
        
        YJButtonPageView *pageView = [[YJButtonPageView alloc] init];
        //计算这页还剩下按钮数
        NSRange range;
        range.location = i*YJButtonPageSize;
        //left剩余按钮个数
        NSUInteger left = buttonModels.count - range.location;
        
        if (left>=YJButtonPageSize) {
            
            range.length = YJButtonPageSize;
        }
        else {
        
            range.length = left;
        }
        
        //截取数组(根据范围截取数组)
        pageView.buttonModels = [buttonModels subarrayWithRange:range];
        
        // 添加到scrollViwe上去
        [self.scrollView addSubview:pageView];
    }
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 1.pageControl
    self.pageControl.width = self.width;
    self.pageControl.height = 25;
    self.pageControl.x = 0;
    self.pageControl.y = self.height - self.pageControl.height;
    
    // 2.scrollView
    self.scrollView.width = self.width;
    self.scrollView.height = self.pageControl.y;
    self.scrollView.x = self.scrollView.y = 0;
    
    // 3.设置scrollView内部每一页的尺寸
    NSUInteger count = self.scrollView.subviews.count;
    for (int i = 0; i<count; i++) {
        YJButtonPageView *pageView = self.scrollView.subviews[i];
        pageView.height = self.scrollView.height;
        pageView.width = self.scrollView.width;
        pageView.x = pageView.width * i;
        pageView.y = 0;
    }
    
    // 4.设置scrollView的contentSize
    self.scrollView.contentSize = CGSizeMake(count * self.scrollView.width, 0);
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double pageNo = scrollView.contentOffset.x / scrollView.width;
    self.pageControl.currentPage = (int)(pageNo + 0.5);
}

@end
