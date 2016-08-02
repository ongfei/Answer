
//
//  ExamCell.m
//  EPartyConstruction
//
//  Created by df on 16/7/21.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import "ExamCell.h"
#import "DyfTool.h"
#import "AnswerCell.h"

@interface ExamCell ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UILabel *titleL;

@property (nonatomic, strong) UITableView *examTableV;

@property (nonatomic, strong) NSMutableDictionary *dic;

@property (nonatomic, strong) NSMutableString *selectStr;


@end
@implementation ExamCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareLayout];
    }
    return self;
}

- (void)prepareLayout {
    
    self.dic = [NSMutableDictionary dictionary];
    
    self.titleL = [UILabel customLablWithFrame:CGRectMake(15, 30, ScreenWidth - 30, 40) andTitle:@"" andFontNumber:16];
    
    self.titleL.numberOfLines = 0;
    
    [self.contentView addSubview:self.titleL];
    
    self.examTableV = [[UITableView alloc] initWithFrame:CGRectMake(0, self.titleL.bottom, ScreenWidth, ScreenHeight - 64 - 50 - 70) style:(UITableViewStylePlain)];
    
    [self.contentView addSubview:self.examTableV];

    self.examTableV.delegate = self;
    
    self.examTableV.dataSource = self;
    
    self.examTableV.scrollEnabled = NO;
    
    self.examTableV.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.examTableV registerClass:[AnswerCell class] forCellReuseIdentifier:@"AnswerCell"];
    
    
}

- (void)setExamModel:(Exam *)examModel {
    if (_examModel != examModel) {
        _examModel = nil;
        _examModel = examModel;
        
        
        self.titleL.text = [NSString stringWithFormat:@"%ld (%@): %@",examModel.nCodeId, examModel.vcType,examModel.vcTitle];
        
        [self.examTableV reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.examModel.choices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AnswerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AnswerCell" forIndexPath:indexPath];
    
    Choices *choicesM = self.examModel.choices[indexPath.row];
    
    if (!self.type) {
        for (NSString *anse in self.answer) {
            if ([anse isEqualToString:[choicesM.vcAnswer substringToIndex:1]]) {
                
                choicesM.isSelect = YES;
            }
        }
    }
    
    cell.choicesM = choicesM;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {
        __block ExamCell *strongSelf = self;
    [self.examTableV deselectRowAtIndexPath:indexPath animated:YES];
    
    AnswerCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([self.examModel.vcType isEqualToString:@"单选"]) {
        
        [cell selectBtnClickWithRow:indexPath.row andModel:self.examModel andType:NO andFirst:NO block:^() {
            
            [strongSelf.examTableV reloadData];

        }];
//        [self.examTableV reloadData];
        
        /**
         *  单选: 这里每答一道题 进行保存 本地或者服务器
         */
    }else {
        
        self.selectStr = [NSMutableString string];

        
        [cell selectBtnClickWithRow:indexPath.row andModel:self.examModel andType:YES andFirst:!self.type block:^() {
            
            [strongSelf.dic setObject: [NSString stringWithFormat:@"%d", strongSelf.examModel.choices[indexPath.row].isSelect] forKey:[NSString stringWithFormat:@"%ld",indexPath.row]];
            
            for (NSString *str in strongSelf.dic.allKeys) {
                
                if ([strongSelf.dic[str] isEqualToString:@"1"]) {
                    
                    int num = [str intValue];
                
                    NSString *sele = [NSString stringWithFormat:@"%c",num + 65];
                    
                    if (sele) {
                        
                        [self.selectStr appendFormat:@"%@,",sele];
                    }
                }
            }
            
  
        }];
        
        /**
         *  多选 : 这里每答一道题 进行保存 本地或者服务器
         */
        
    }
    self.type = YES;

    [self.examTableV reloadData];
}
@end
