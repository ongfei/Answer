//
//  ExamCell.h
//  EPartyConstruction
//
//  Created by df on 16/7/21.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExamsModel.h"

@interface ExamCell : UICollectionViewCell

@property (nonatomic, strong) Exam *examModel;

@property (nonatomic, assign) BOOL type;

@property (nonatomic, strong) NSArray *answer;

@property (nonatomic, copy) void (^ExamBlock)(NSDictionary *dic);
@end
