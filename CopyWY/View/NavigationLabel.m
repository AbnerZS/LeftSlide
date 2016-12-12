//
//  NavigationLabel.m
//  CopyWY
//
//  Created by abnerzhang on 16/8/29.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "NavigationLabel.h"

#define Red 0.4
#define Green 0.6
#define Blue 0.7

@implementation NavigationLabel


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.font = [UIFont systemFontOfSize:14];
        
        self.backgroundColor = [UIColor clearColor];
        
        self.textAlignment = NSTextAlignmentCenter;
        
        self.userInteractionEnabled = YES;
        
        self.textColor = [UIColor colorWithRed:Red green:Green blue:Blue alpha:1.0];
        
    }
    return self;
}


/**
 *  设计lable的颜色渐变和大小缩放
 */
- (void)setScale:(CGFloat)scale {
    
    _scale = scale;
    
    // 默认: 0.4 0.6 0.7
    // 红色: 1.0  0   0
    
    // 颜色渐变
    CGFloat red = Red + (1 - Red) * scale;
    CGFloat green = Green + (0 - Green) * scale;
    CGFloat blue = Blue + (0 - Blue) * scale;
    
    self.textColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    // 大小缩放比例
    CGFloat transformScale = 1 + (scale * 0.3);
    self.transform = CGAffineTransformMakeScale(transformScale, transformScale);
}

@end
