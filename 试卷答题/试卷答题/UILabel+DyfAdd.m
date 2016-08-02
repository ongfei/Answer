//
//  UILabel+DyfAdd.m
//  EPartyConstruction
//
//  Created by df on 16/7/21.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import "UILabel+DyfAdd.h"

@implementation UILabel (DyfAdd)

+ (instancetype)customLablWithFrame:(CGRect)frame andTitle:(NSString *)text andFontNumber:(NSInteger)fontNumber {
    
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    
    label.text = text;
    
    label.font = [UIFont systemFontOfSize:fontNumber];
    
    return label;
}
@end
