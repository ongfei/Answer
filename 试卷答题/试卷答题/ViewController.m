//
//  ViewController.m
//  试卷答题
//
//  Created by df on 16/8/2.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;

}
-(UIButton*)superBtn
{
    if (_superBtn==nil) {
        
        _superBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _superBtn.frame = CGRectMake(0, 2,(15), (20));
        
        [_superBtn setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        
        [_superBtn addTarget:self action:@selector(superBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _superBtn;
}
-(void)superBtnClick {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
