//
//  FirstViewController.m
//  试卷答题
//
//  Created by df on 16/8/2.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import "FirstViewController.h"
#import "PrepareExamController.h"


@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    
    btn.frame = CGRectMake(20, 100, self.view.frame.size.width - 40, 30);
    
    btn.backgroundColor = [UIColor colorWithRed:1.0 green:0.3138 blue:0.3093 alpha:1.0];
    
    btn.layer.cornerRadius = 3;
    
    [btn setTintColor:[UIColor whiteColor]];
    
    [btn setTitle:@"答题" forState:(UIControlStateNormal)];
    
    [btn addTarget:self action:@selector(btnClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:btn];
}

- (void)btnClick {
    
    PrepareExamController *prepareExam = [PrepareExamController new];
    
    [self.navigationController pushViewController:prepareExam animated:YES];
}


@end
