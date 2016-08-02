//
//  AnswerSheetController.m
//  EPartyConstruction
//
//  Created by df on 16/7/26.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import "AnswerSheetController.h"
#import "ExamsModel.h"


@interface AnswerSheetController ()

@end

@implementation AnswerSheetController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.8943 green:0.8943 blue:0.8943 alpha:1.0];
    
    self.title = @"答题卡";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.superBtn];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"确定交卷" style:(UIBarButtonItemStyleDone) target:self action:@selector(sureClick)];
    
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor blackColor];

    [self prepareLayout];
}

- (void)prepareLayout {
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 60)];
    
    [self.view addSubview:titleLabel];
    
    titleLabel.backgroundColor = [UIColor whiteColor];
    
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    titleLabel.font = FontSystem(14);
    
    titleLabel.numberOfLines = 0;
    
    titleLabel.text = [NSString stringWithFormat:@"本试卷共有%ld道题,已答%ld道",self.examList.nTopicsTotal,self.answerArr.count];
    CGFloat lastBottom = titleLabel.bottom + 5;
//    单选
    if (self.singleDic.allKeys.count != 0 && self.singleDic != nil) {
        
        UILabel *singleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, titleLabel.bottom + 5, ScreenWidth, 25)];
        
        [self.view addSubview:singleLabel];
        
        singleLabel.backgroundColor = [UIColor whiteColor];
        
        singleLabel.text = @"单选题";
        
        singleLabel.font = FontSystem(14);
        
        UIView *singleBgView = [[UIView alloc] init];
        
        singleBgView.backgroundColor = [UIColor colorWithRed:0.9334 green:0.9334 blue:0.9334 alpha:1.0];
        
        [self.view addSubview:singleBgView];
        
        NSInteger number = 1;
        
        UIButton *lastBtn = nil;
        for (int i = 0; i < self.singleDic.allKeys.count; i++) {
            
            UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
            
            [singleBgView addSubview:btn];
            
            CGFloat top;
            if(lastBtn == nil) {
                top = 5;
            } else if (lastBtn.right + 40 > ScreenWidth) {
                top = lastBtn.bottom + 5;
                number++;
            } else{
                top = lastBtn.top;
            }
            
            btn.frame = CGRectMake(lastBtn == nil ? 20 : lastBtn.right + 40 > ScreenWidth ? 20 : lastBtn.right + 20, top, 30, 30);
            
            btn.layer.cornerRadius = 15;
            
            [btn setBackgroundColor:[UIColor whiteColor]];
            
            [btn setTitle:[NSString stringWithFormat:@"%ld",[[self getSingleArray][i] integerValue] + 1] forState:(UIControlStateNormal)];
            
            Exam *exam = [self.singleDic objectForKey: [self getSingleArray][i]];
            for (NSDictionary *dic in self.answerArr) {
                
                if ([[NSString stringWithFormat:@"%ld",exam.nId] isEqualToString: [NSString stringWithFormat:@"%@",dic[@"nTitleId"]]]) {
                    
                    [btn setBackgroundColor: [UIColor colorWithRed:1.0 green:0.3138 blue:0.3093 alpha:1.0]];
                    break;
                }
            }
            
            btn.tag = 1000 + [[self getSingleArray][i] integerValue];
            
            [btn addTarget:self action:@selector(listSelect:) forControlEvents:(UIControlEventTouchUpInside)];
            
            lastBtn = btn;
        }
        singleBgView.frame = CGRectMake(0, singleLabel.bottom + 5, ScreenWidth, number * 40);

        lastBottom = singleBgView.bottom + 5;
        
    }
//    多选
    if (self.doubleDic.allKeys.count != 0 && self.doubleDic != nil) {
        
        UILabel *doubleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, lastBottom, ScreenWidth, 25)];
        
        [self.view addSubview:doubleLabel];
        
        doubleLabel.backgroundColor = [UIColor whiteColor];
        
        doubleLabel.text = @"多选题";
        
        doubleLabel.font = FontSystem(14);
        
        UIView *doubleBgView = [[UIView alloc] init];
        
        doubleBgView.backgroundColor = [UIColor colorWithRed:0.9334 green:0.9334 blue:0.9334 alpha:1.0];
        
        [self.view addSubview:doubleBgView];
        
        NSInteger number = 1;
        
        UIButton *lastBtn = nil;
        for (int i = 0; i < self.doubleDic.allKeys.count; i++) {
            
            UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
            
            [doubleBgView addSubview:btn];
            
            CGFloat top;
            if(lastBtn == nil) {
                top = 5;
            } else if (lastBtn.right + 40 > ScreenWidth) {
                top = lastBtn.bottom + 5;
                number++;
            } else{
                top = lastBtn.top;
            }
            
            btn.frame = CGRectMake(lastBtn == nil ? 20 : lastBtn.right + 40 > ScreenWidth ? 20 : lastBtn.right + 20, top, 30, 30);
            
            btn.layer.cornerRadius = 15;
            
            [btn setBackgroundColor:[UIColor whiteColor]];
            
            [btn setTitle:[NSString stringWithFormat:@"%ld",[[self getDoubleArray][i] integerValue] + 1] forState:(UIControlStateNormal)];
            
            Exam *exam = [self.doubleDic objectForKey: [self getDoubleArray][i]];
            for (NSDictionary *dic in self.answerArr) {
                
                if ([[NSString stringWithFormat:@"%ld",exam.nId] isEqualToString: [NSString stringWithFormat:@"%@",dic[@"nTitleId"]]]) {
                    
                    [btn setBackgroundColor: [UIColor colorWithRed:1.0 green:0.3138 blue:0.3093 alpha:1.0]];
                    break;
                }
            }
            
            btn.tag = 1000 + [[self getDoubleArray][i] integerValue];
            
            [btn addTarget:self action:@selector(listSelect:) forControlEvents:(UIControlEventTouchUpInside)];
            
            lastBtn = btn;
        }
        doubleBgView.frame = CGRectMake(0, doubleLabel.bottom + 5, ScreenWidth, number * 40);

    }
    
    

}

- (NSArray *)getSingleArray {
    
    return [self.singleDic.allKeys sortedArrayUsingSelector:@selector(compare:)];
}

- (NSArray *)getDoubleArray {
    
    return [self.doubleDic.allKeys sortedArrayUsingSelector:@selector(compare:)];
}

- (void)sureClick {
    DLog(@"%d" ,__LINE__);
}

- (void)listSelect:(UIButton *)btn {
    
    DLog(@"%ld",btn.tag - 1000);
    
    self.AnswerSheetBlock(btn.tag - 1000);
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
