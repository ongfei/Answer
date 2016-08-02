//
//  ExamListModel.h
//  EPartyConstruction
//  试卷信息
//  Created by df on 16/7/20.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ExamLists;
@interface ExamListModel : NSObject

@property (nonatomic, strong) NSArray<ExamLists *> *objects;

@end
@interface ExamLists : NSObject

@property (nonatomic, copy) NSString *vcExamGroupName;

@property (nonatomic, assign) NSInteger nPass;

@property (nonatomic, assign) NSInteger nId;

@property (nonatomic, copy) NSString *vcRegister;

@property (nonatomic, assign) NSInteger examedNumber;

@property (nonatomic, assign) NSInteger nTotal;

@property (nonatomic, assign) NSInteger isBegin;

@property (nonatomic, copy) NSString *vcTitle;

@property (nonatomic, assign) NSInteger nTopicsTotal;

@property (nonatomic, assign) NSInteger answerdNumber;

@property (nonatomic, assign) NSInteger nTimer;

@property (nonatomic, copy) NSString *dtReg;

@property (nonatomic, copy) NSString *vcExamGroupId;

@end

