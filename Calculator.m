//
//  Calculator.m
//  Calculator
//
//  Created by DK on 10/23/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "Calculator.h"
#define DOUBLE_MAX 99999999999999999999999.0
@interface  Calculator()
@property double preNumber;
@property enum Operator operator;
@property double currentNumber;
@property NSMutableString *operatorString;
@end


@implementation Calculator

- (NSString *) pushNext:(NSString *) string
{
    
    if([string isEqualToString:@"√"])
    {
        if(_operatorString != nil)
        {
            return  _operatorString;
        }
        else if(_preNumber != DOUBLE_MAX)
        {
            return [NSString stringWithFormat:@"%f",_preNumber];
        }
        else
        {
            return @"0";
        }
    }
    else if(self.operatorString == nil)
    {
        _operatorString = [[NSMutableString alloc] init];
    }
    
    if([string isEqualToString:@"+"])
    {
        [self pushNumber];
         _operator=plus;
    }
    else if([string isEqualToString:@"-"])
    {
        [self pushNumber];
        _operator=minus;
    }
    else if([string isEqualToString:@"×"])
    {
        [self pushNumber];
        _operator=multiply;
    }
    else if([string isEqualToString:@"÷"])
    {
        [self pushNumber];
        _operator=divide;
    }
    else if([string isEqualToString:@"="])
    {
        return [self calculate];
    }
    else if([string isEqualToString:@"C"])
    {
        [self clear];
        return @"0";
    }
    else if([string isEqualToString:@"%"])
    {
        if(_preNumber == DOUBLE_MAX)
        {
            double temp = [_operatorString doubleValue];
            temp = temp / 100.0;
            _operatorString = [NSMutableString stringWithFormat:@"%f", temp];
            return _operatorString;
        }
        else
        {
            double temp =_preNumber;
            temp = temp / 100.0;
            _preNumber = temp;
            NSMutableString * result = [NSMutableString stringWithFormat:@"%f", _preNumber];
            return result;
        }
    }
    else if([string isEqualToString:@"±"])
    {
        if(_preNumber == DOUBLE_MAX)
        {
            double temp = [_operatorString doubleValue];
            if(temp != 0)
                temp = -temp;
            _operatorString = [NSMutableString stringWithFormat:@"%f", temp];
            return _operatorString;
        }
        else
        {
            double temp =_preNumber;
            if(temp != 0)
                temp = -temp;
            _preNumber = temp;
            NSMutableString * result = [NSMutableString stringWithFormat:@"%f", _preNumber];
            return result;
        }
    }
    
    if(self.operatorString  != nil)
    {
        [self.operatorString appendString:string];
        return self.operatorString;
    }
    else
    {
        return [NSString stringWithFormat:@"%f", _preNumber];
    }
}

- (void) pushOperator:(enum Operator)operator
{
    switch (operator) {
        case plus:
            break;
        case minus:
            break;
        case multiply:
            break;
        case divide:
            break;
        default:
            break;
    }
}

- (void) pushNumber
{
    if(_preNumber == DOUBLE_MAX )
    {
        _preNumber= [_operatorString doubleValue];
    }
    else if([_operatorString length] > 0)
    {
        [self calculate];
    }
    _operatorString = nil;

}

- (NSString *) calculate
{
    _currentNumber= [_operatorString doubleValue];
    _operatorString=nil;
    switch(_operator)
    {
        case plus:
        {
            double result = _preNumber + _currentNumber;
            _preNumber=result;
            _operatorString=nil;
            return [NSString stringWithFormat:@"%f", result];
        }
            break;
        case minus:
        {
            double result = _preNumber - _currentNumber;
            _preNumber=result;
            _operatorString=nil;
            return [NSString stringWithFormat:@"%f", result];
        }
            break;
        case multiply:
        {
            double result = _preNumber * _currentNumber;
            _preNumber=result;
            _operatorString=nil;
            return [NSString stringWithFormat:@"%f", result];
        }
            break;
        case divide:
        {
            if(_currentNumber != 0)
            {
                double result = _preNumber / _currentNumber;
                _preNumber=result;
                _operatorString=nil;
                return [NSString stringWithFormat:@"%f", result];
            }
            else
            {
                _preNumber=DOUBLE_MAX;
                _operatorString=nil;
                return @"INFINITY";
                
            }
        }
            break;
    }
}

- (void) clear
{
    _preNumber = DOUBLE_MAX;
    _currentNumber = DOUBLE_MAX;
    _operatorString=nil;
    _operator= -1;
}

+ (NSString *) formatNumber:(NSString *)number
{
    NSArray *array = [number componentsSeparatedByString:@"."];
    if([array count]>1)
    {
        NSString *pre = [array objectAtIndex:0];
        NSString *next = [array objectAtIndex:1];
        int index;
        for(index = [next length] - 1; index >= 0; index--)
        {
            unichar n = [next characterAtIndex:index];
            if(n != '0')
            {
                break;
            }
        }
        if(index >= 0)
        {
            next = [next substringToIndex:index + 1];
            NSMutableString *result = [[NSMutableString alloc] initWithString:pre];
            [result appendString:@"."];
            [result appendString:next];
            return result;
        }
        else
        {
            return pre;
        }
    }
    else
    {
        return number;
    }
}

@end
