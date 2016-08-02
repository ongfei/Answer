//
//  AnswerCell.m
//  EPartyConstruction
//
//  Created by df on 16/7/21.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import "AnswerCell.h"
#import "DyfTool.h"

@interface AnswerCell ()

@end
@implementation AnswerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self prepareLayout];
    }
    return self;
}

- (void)prepareLayout {

    
    self.choseBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    
    self.choseBtn.frame = CGRectMake(20, 5, 30, 30);
    
    [self.choseBtn setImage:[UIImage imageNamed:@"unselect"] forState:(UIControlStateNormal)];
    [self.choseBtn setImage:[UIImage imageNamed:@"select"] forState:(UIControlStateSelected)];
    
//    self.choseBtn.enabled = NO;
    
    [self.contentView addSubview:self.choseBtn];
    
    self.contentL = [UILabel customLablWithFrame:CGRectMake(self.choseBtn.right, 5, ScreenWidth - 60, 30) andTitle:@"" andFontNumber:15];
    
    [self.contentView addSubview:self.contentL];
    
    
}

- (void)setChoicesM:(Choices *)choicesM {
    if (_choicesM != choicesM) {
        _choicesM = nil;
        _choicesM = choicesM;
        
        self.contentL.text = choicesM.vcAnswer;
    }
    
    self.choseBtn.selected = choicesM.isSelect;
}

- (void)selectBtnClickWithRow:(NSInteger)row andModel:(Exam *)exam andType:(BOOL)type  andFirst:(BOOL)first block:(void(^)())block {
    if (!type) {
        for (Choices *choice in exam.choices) {
            choice.isSelect = NO;
        }
    }
    if (first) {
        for (Choices *choice in exam.choices) {
            choice.isSelect = NO;
        }

    }
    
    exam.choices[row].isSelect = !exam.choices[row].isSelect;
    
    block();
    
}
@end
