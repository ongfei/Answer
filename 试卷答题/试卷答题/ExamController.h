//
//  ExamController.h
//  EPartyConstruction
//
//  Created by df on 16/7/21.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import "ViewController.h"
#import "ExamsModel.h"
#import "ExamListModel.h"

@interface ExamController : ViewController

@property (nonatomic, strong) ExamsModel *examsM;
/**
 *  试卷信息
 */
@property (nonatomic, strong) ExamLists *examList;
/**
 *  答案
 */
@property (nonatomic, strong) NSArray *answerArr;

@end
