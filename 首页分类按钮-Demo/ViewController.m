//
//  ViewController.m
//  首页分类按钮-Demo
//
//  Created by yangjie on 16/1/6.
//  Copyright © 2016年 yangjie. All rights reserved.
//

#import "ViewController.h"
#import "YJCatagoryView.h"

@interface ViewController ()<YJCatagoryViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*accessToken = 7282a7edc3e6365c94de0cbd90fc0682;*/
    
//    getClassifyOneOfCHWL
    
    NSString *urlString = @"http://120.24.162.80:8080/sjlmApp/getClassifyOneOfCHWL?accessToken=7282a7edc3e6365c94de0cbd90fc0682";
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
       
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        NSLog(@"%@",dic);
        
        NSArray *arr = dic[@"data"];
        
        NSMutableArray *modelArr = [NSMutableArray array];
        
        for (NSDictionary *dict in arr) {
            
            YJButtonModel *model = [[YJButtonModel alloc] init];
            
            model.imageUrl = dict[@"classifyImage"];
            model.data = dict[@"classifyId"];
            model.title = dict[@"classifyName"];
            
            [modelArr addObject:model];
        }
        
        YJCatagoryView *catagoryView = [[YJCatagoryView alloc] init];
        
        catagoryView.buttonModels = modelArr;
        
        catagoryView.x = 0;
        catagoryView.y = 64;
        catagoryView.width = self.view.width;
        catagoryView.height = 160;
        
        catagoryView.delegate  =self;
        
//        catagoryView.backgroundColor = [UIColor redColor];
        
        [self.view addSubview:catagoryView];
        
    }];
    
    
}

- (void)catagoryView:(YJCatagoryView *)catagoryView catagoryButtonDidClick:(YJCatagoryButton *)catagoryButton {

    NSLog(@"%@",catagoryButton.data);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
