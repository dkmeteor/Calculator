//
//  ButtonFactory.h
//  Calculator
//
//  Created by DK on 10/22/14.
//  Copyright (c) 2014 DK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ButtonFactory : NSObject
enum ButtonType {grey=0, red=1, black=2};


+ (ButtonFactory *) getInstance;
- (UIButton *) createButton: (NSString *) title buttontype: (enum ButtonType) type;
- (void) setScreendWidth: (int) width ScreenHeight: (int) height;
@end
