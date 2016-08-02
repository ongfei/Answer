//
//  ExamController.m
//  EPartyConstruction
//
//  Created by df on 16/7/21.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import "ExamController.h"
#import "ExamCell.h"
#import "AnswerSheetController.h"

@interface ExamController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionV;
/**
 *  当前的位置
 */
@property (nonatomic, strong) NSIndexPath *indexPathNow;

@property (nonatomic, strong) UICollectionViewFlowLayout *layout;

@end

@implementation ExamController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.9952 green:0.9904 blue:1.0 alpha:1.0];
    self.title = @"考试";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.superBtn];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"交卷" style:(UIBarButtonItemStyleDone) target:self action:@selector(commitClick)];
    
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor blackColor];
    
    [self prepareLayout];
    
}

// 根据题号 获取到答案
- (NSArray *)getAnswerWithId:(NSInteger)str {
    if (self.answerArr != nil) {
        NSString *answerStr;
        for (NSDictionary *dic in self.answerArr) {
            if ([[NSString stringWithFormat:@"%@",dic[@"nTitleId"]] isEqualToString:[NSString stringWithFormat:@"%ld",str]]) {
                answerStr = dic[@"vcAnswer"];
            }
        }
        return [answerStr componentsSeparatedByString:@","];
    }
    return nil;
}

- (void)prepareLayout {
    
    self.layout = [[UICollectionViewFlowLayout alloc] init];
    
    self.layout .scrollDirection = UICollectionViewScrollDirectionHorizontal;

    self.layout .itemSize = CGSizeMake(ScreenWidth, ScreenHeight - 64 - 50);
    
    self.collectionV = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64 - 50) collectionViewLayout:self.layout];
    
    self.collectionV.backgroundColor = [UIColor whiteColor];
    
    self.collectionV.showsVerticalScrollIndicator = NO;
    
    self.collectionV.showsHorizontalScrollIndicator = NO;
    
    self.collectionV.delegate = self;
    
    self.collectionV.dataSource = self;
    
    self.collectionV.pagingEnabled = YES;
    
    self.collectionV.bounces = YES;
    
    [self.collectionV registerClass:[ExamCell class] forCellWithReuseIdentifier:@"ExamCell"];
    
    [self.view addSubview:self.collectionV];
    
    UIView *bottomBgView = [[UIView alloc] initWithFrame:CGRectMake(0, self.collectionV.bottom, ScreenWidth, 50)];
    
    bottomBgView.backgroundColor = [UIColor colorWithRed:1.0 green:0.3138 blue:0.3093 alpha:1.0];
    
    [self.view addSubview:bottomBgView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 5, 8, 15)];
    
    imageView.image = [UIImage imageNamed:@"back"];
    
    [bottomBgView addSubview:imageView];
    
    imageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *up = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(upSelectClick)];
    
    [imageView addGestureRecognizer:up];
    
    
    UIImageView *rimageView = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth - 38, 5, 8, 15)];
    
    rimageView.image = [UIImage imageNamed:@"right"];
    
    [bottomBgView addSubview:rimageView];
    
    rimageView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *down = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(downSelectClick)];
    
    [rimageView addGestureRecognizer:down];
    

    UIButton *left = [UIButton buttonWithType:(UIButtonTypeSystem)];
    
    left.frame = CGRectMake(10, imageView.bottom, 100, bottomBgView.height - 25);
    
    left.centerX = imageView.centerX;
    
    [left setTintColor:[UIColor whiteColor]];
    
    [left setTitle:@"上一题" forState:(UIControlStateNormal)];
    
    [bottomBgView addSubview:left];
    
    [left addTarget:self action:@selector(upSelectClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    left.tag = 998;
    
    
    UIButton *right = [UIButton buttonWithType:(UIButtonTypeSystem)];
    
    right.frame = CGRectMake(ScreenWidth - 60, imageView.bottom, 100, bottomBgView.height - 25);
    
    right.centerX = rimageView.centerX;
    
    [right setTintColor:[UIColor whiteColor]];
    
    [right setTitle:@"下一题" forState:(UIControlStateNormal)];
    
    [bottomBgView addSubview:right];
    
    [right addTarget:self action:@selector(downSelectClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    right.tag = 999;


}

#pragma mark - delegate 

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.examsM.objects.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ExamCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ExamCell" forIndexPath:indexPath];
    
    //根据题号取得答案
    cell.answer = [self getAnswerWithId:self.examsM.objects[indexPath.item].nId];
    
    cell.examModel = self.examsM.objects[indexPath.item];
    
    
    return cell;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
    
}

#pragma mark - button-click

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    CGPoint pInView = [self.view convertPoint:self.collectionV.center toView:self.collectionV];

    self.indexPathNow = [self.collectionV indexPathForItemAtPoint:pInView];
    
}
 //上一题
- (void)upSelectClick {
        
    if (self.indexPathNow.row > 0) {
        
        [self.collectionV scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.indexPathNow.item - 1 inSection:self.indexPathNow.section] atScrollPosition:(UICollectionViewScrollPositionNone) animated:YES];
        
        self.indexPathNow = [NSIndexPath indexPathForItem:self.indexPathNow.item - 1 inSection:self.indexPathNow.section];
        
        [self.collectionV reloadData];
        
    }else {
        NSLog( @"已经是第一题了");
    }
    
}
//下一题
- (void)downSelectClick {
    
    if (self.indexPathNow.row < self.examsM.objects.count - 1) {
        
        [self.collectionV scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.indexPathNow.item + 1 inSection:self.indexPathNow.section] atScrollPosition:(UICollectionViewScrollPositionNone) animated:YES];
        
        self.indexPathNow = [NSIndexPath indexPathForItem:self.indexPathNow.item + 1 inSection:self.indexPathNow.section];
        
        [self.collectionV reloadData];
    }else {
        NSLog(@"已经是最后一题了" );
    }

}
- (void)commitClick {
//单选
    NSMutableDictionary *singleDic = [NSMutableDictionary dictionary];
//多选
    NSMutableDictionary *doubleDic = [NSMutableDictionary dictionary];
    

    for (Exam *exam in self.examsM.objects) {
        if ([exam.vcType isEqualToString:@"单选"]) {
            
            
            [singleDic setObject:exam forKey:@([self.examsM.objects indexOfObject:exam])];
            
        }else {//多选
            
            [doubleDic setObject:exam forKey:@([self.examsM.objects indexOfObject:exam])];
    
        }
    }
    
    __block ExamController *strongSelf = self;
    
    /**
     * 跳转到答题卡 这里应该请求数据 获取到已答题
     *
     * 或者答题的时候 自己保存已答题
     */
    

    
        AnswerSheetController *answerSheet = [AnswerSheetController new];
        
        answerSheet.examList = self.examList;
    
        answerSheet.singleDic = singleDic;
        
        answerSheet.doubleDic = doubleDic;
        
        answerSheet.AnswerSheetBlock = ^(NSInteger row) {
            [strongSelf.collectionV scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:row inSection:0] atScrollPosition:(UICollectionViewScrollPositionNone) animated:YES];
    
        };
        
        
        [self.navigationController pushViewController:answerSheet animated:YES];
    

}

@end
