//
//  ButtonFactory.m
//  Calculator
//
//  Created by DK on 10/22/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import "ButtonFactory.h"

@interface ButtonFactory ()
@property int screenWidth;
@property int screenHeight;
@end

@implementation ButtonFactory



UIImage *buttonImageBlack;
UIImage *buttonImageBlackPressed;
UIImage *buttonImageGrey;
UIImage *buttonImageGreyPressed;
UIImage *buttonImageRed;
UIImage *buttonImageRedPressed;
static ButtonFactory *factory;

+ (ButtonFactory *) getInstance
{
    if(factory == nil)
    {
        factory=[[ButtonFactory alloc] init];
        //init all images
        buttonImageBlack = [UIImage imageNamed:@"btnBlack.png"];
        buttonImageBlackPressed = [UIImage imageNamed:@"btnBlackPressed.png"];
        buttonImageGrey = [UIImage imageNamed: @"btnGrey.png"];
        buttonImageGrey = [UIImage imageNamed: @"btnGreyPressed.png"];
        buttonImageRed = [UIImage imageNamed: @"btnRed.png"];
        buttonImageRedPressed = [UIImage imageNamed: @"btnRedPressed.png"];
    }
    return factory;
}

- (UIButton *) createButton:(NSString *)title buttontype:(enum ButtonType)type
{
    UIButton *button = [[UIButton alloc] init];
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle: title forState: UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize: 30.0];
    [button setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button.titleLabel setShadowOffset:CGSizeMake(2, 2)];
    switch (type) {
        case black:
            [button setBackgroundImage:buttonImageBlack forState:UIControlStateNormal];
            [button setBackgroundImage:buttonImageBlackPressed forState:UIControlStateHighlighted];
            break;
        case grey:
            [button setBackgroundImage:buttonImageGrey forState:UIControlStateNormal];
            [button setBackgroundImage:buttonImageGreyPressed forState:UIControlStateHighlighted];
            break;
        case red:
            [button setBackgroundImage:buttonImageRed forState:UIControlStateNormal];
            [button setBackgroundImage:buttonImageRedPressed forState:UIControlStateHighlighted];
            break;
        default:
            break;
    }
   return button;
}

- (void) setScreendWidth:(int)width ScreenHeight:(int)height
{
    [self setScreenWidth:width];
    [self setScreenHeight:height];
}
@end
