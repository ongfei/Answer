//
//  ExamModel.m
//  EPartyConstruction
//
//  Created by df on 16/7/21.
//  Copyright © 2016年 Dyf. All rights reserved.
//

#import "ExamsModel.h"

@implementation ExamsModel


+ (NSDictionary *)objectClassInArray{
    return @{@"objects" : [Exam class]};
}
@end
@implementation Exam

+ (NSDictionary *)objectClassInArray{
    return @{@"choices" : [Choices class]};
}

@end


@implementation Choices

@end


