//
//  AnswerCell.h
//  EPartyConstruction
//
//  Created by df on 16/7/21.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExamsModel.h"

@interface AnswerCell : UITableViewCell

@property (nonatomic, strong) UIButton *choseBtn;

@property (nonatomic, strong) UILabel *contentL;

@property (nonatomic, strong) Choices *choicesM;
/**
 *  @param row  点击的行数
 *  @param exam 试题demo
 *  @param type 单选为no
 *  @param first  yes 第一次点击 重置多选按钮
 */
- (void)selectBtnClickWithRow:(NSInteger)row andModel:(Exam *)exam andType:(BOOL)type andFirst:(BOOL)first block:(void(^)())block;
@end
