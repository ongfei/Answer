//
//  AnswerSheetController.h
//  EPartyConstruction
//
//  Created by df on 16/7/26.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import "ViewController.h"
#import "ExamListModel.h"

@interface AnswerSheetController : ViewController
/**
 *  试卷信息
 */
@property (nonatomic, strong) ExamLists *examList;
/**
 *  答案
 */
@property (nonatomic, strong) NSArray *answerArr;
/**
 *  单选
 */
@property (nonatomic, strong) NSMutableDictionary *singleDic;
/**
 *  多选
 */
@property (nonatomic, strong) NSMutableDictionary *doubleDic;

@property (nonatomic, copy) void (^AnswerSheetBlock)(NSInteger row);


@end
