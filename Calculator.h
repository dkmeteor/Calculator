//
//  Calculator.h
//  Calculator
//
//  Created by DK on 10/23/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

enum Operator {plus = 0, minus = 1, multiply = 2, divide = 3};

- (NSString *) pushNext: (NSString *) string;
- (void) pushOperator: (enum Operator) operator;
- (void) clear;
+ (NSString *) formatNumber: (NSString *) number;
@end
