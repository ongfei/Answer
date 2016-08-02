//
//  ExamsModel.h
//  EPartyConstruction
//
//  试题
//
//  Created by df on 16/7/21.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Exam,Choices;
@interface ExamsModel : NSObject

@property (nonatomic, strong) NSArray<Exam *> *objects;

@property (nonatomic, assign) NSInteger isBegin;

@end
@interface Exam : NSObject

@property (nonatomic, copy) NSString *vcType;

@property (nonatomic, assign) NSInteger nCodeId;

@property (nonatomic, assign) NSInteger nScore;

@property (nonatomic, strong) NSArray<Choices *> *choices;

@property (nonatomic, assign) NSInteger nTopicsId;

@property (nonatomic, copy) NSString *vcAnswer;

@property (nonatomic, copy) NSString *vcTitle;

@property (nonatomic, assign) NSInteger nId;

@end

@interface Choices : NSObject

@property (nonatomic, assign) NSInteger nId;

@property (nonatomic, assign) BOOL isSelect;

@property (nonatomic, assign) NSInteger nContentId;

@property (nonatomic, copy) NSString *vcAnswer;

@end

