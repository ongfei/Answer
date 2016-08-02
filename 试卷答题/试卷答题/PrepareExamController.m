//
//  PrepareExamController.m
//  EPartyConstruction
//
//  Created by df on 16/7/21.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import "PrepareExamController.h"
#import "ExamsModel.h"
#import "ExamController.h"

@interface PrepareExamController ()

@property (nonatomic, strong) UIButton *sureBtn;

@property (nonatomic, strong) ExamsModel *examsM;


@end

@implementation PrepareExamController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;

    self.view.backgroundColor = [UIColor colorWithRed:0.8943 green:0.8943 blue:0.8943 alpha:1.0];
    self.title = @"准备考试";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.superBtn];
    
    [self prepareLayout];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self requestData];

}

- (void)requestData {
    
    
        
    self.examsM = [ExamsModel mj_objectWithFile:[[NSBundle mainBundle] pathForResource:@"exam" ofType:nil]];
    
    self.examList = [ExamLists mj_objectWithFile:[[NSBundle mainBundle] pathForResource:@"examList" ofType:nil]];
    
    [self canClickWithStr:self.examList.isBegin == 0 ? @"开 始 考 试" :(self.examList.isBegin == 1 ? @"继 续 考 试" : @"考 试 已 完 成")];


    
}

- (void)prepareLayout {

    UILabel *titleL = [UILabel customLablWithFrame:CGRectMake(0, 64, ScreenWidth, 80) andTitle:self.examList.vcTitle andFontNumber:17];
    
    titleL.textAlignment = NSTextAlignmentCenter;
    
    titleL.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:titleL];
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, titleL.bottom + 20, ScreenWidth, 100)];
    
    bgView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:bgView];
    
    
    UILabel *haveDoneL = [UILabel customLablWithFrame:CGRectMake(10, 5, ScreenWidth/2,30) andTitle:[NSString stringWithFormat:@"已答%ld/%ld",self.examList.answerdNumber,self.examList.nTopicsTotal] andFontNumber:15];
    
    [bgView addSubview:haveDoneL];
    
    
    UILabel *numberL = [UILabel customLablWithFrame:CGRectMake(haveDoneL.right, 5, ScreenWidth/2,30) andTitle:[NSString stringWithFormat:@"%ld人作答",self.examList.examedNumber] andFontNumber:15];
    
    [bgView addSubview:numberL];
    
    
    UILabel *totalL = [UILabel customLablWithFrame:CGRectMake(10, haveDoneL.bottom, ScreenWidth/2,30) andTitle:[NSString stringWithFormat:@"卷面总分:%ld",self.examList.nTotal] andFontNumber:15];
    
    [bgView addSubview:totalL];
    
    
    UILabel *passL = [UILabel customLablWithFrame:CGRectMake(totalL.right, haveDoneL.bottom, ScreenWidth/2,30) andTitle:[NSString stringWithFormat:@"及格分:%ld",self.examList.nPass] andFontNumber:15];
    
    [bgView addSubview:passL];
    
    
    UILabel *adminL = [UILabel customLablWithFrame:CGRectMake(10, totalL.bottom, ScreenWidth/2,30) andTitle:[NSString stringWithFormat:@"发布人:%@",self.examList.vcRegister] andFontNumber:15];
    
    [bgView addSubview:adminL];
    
    
    UILabel *dateL = [UILabel customLablWithFrame:CGRectMake(adminL.right, totalL.bottom, ScreenWidth/2,30) andTitle:[NSString stringWithFormat:@"发布时间:%@",[self.examList.dtReg substringToIndex:self.examList.dtReg.length - 9]] andFontNumber:15];
    
    [bgView addSubview:dateL];
    
    
    NSString *str = self.examList.isBegin == 0 ? @"开 始 考 试" :(self.examList.isBegin == 1 ? @"继 续 考 试" : @"考 试 已 完 成");
    
    UIButton *btn = [UIButton buttonWithType:(UIButtonTypeSystem)];
    
    btn.frame = CGRectMake(20, bgView.bottom + 20, ScreenWidth - 40, 30);
    
    btn.backgroundColor = [UIColor colorWithRed:1.0 green:0.3138 blue:0.3093 alpha:1.0];
    
    btn.layer.cornerRadius = 3;
    
    [btn setTintColor:[UIColor whiteColor]];
    
    [btn setTitle:str forState:(UIControlStateNormal)];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.sureBtn = btn;
    
    [self canClickWithStr:str];
    
    [self.view addSubview:btn];

}

- (void)canClickWithStr:(NSString *)str {
    if ([str isEqualToString:@"考 试 已 完 成"]) {
        self.sureBtn.enabled = NO;
    }else {
        self.sureBtn.enabled = YES;
    }
    
}

- (void)btnClick:(UIButton *)sender {
    if ([sender.currentTitle isEqualToString:@"开 始 考 试"]) {
        
      
            
            ExamController *examC = [ExamController new];
            
            examC.examList = self.examList;
            
            examC.examsM = self.examsM;
            
            [self.navigationController pushViewController:examC animated:YES];
        
        
    }else if ([sender.currentTitle isEqualToString:@"继 续 考 试"]) {
       
            DLog(@"--------继续考试---------");
            
//          这里应该请求 已答题的答案 ExamController 里有个array就是存答案的
        


    }
}



@end
