//
//  Person.m
//  CopyWY
//
//  Created by abnerzhang on 16/8/30.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize name = _name;

- (void)setName:(NSString *)name {
    if (name) {
        _name = name;
    }
}

- (NSString *)name {
    if (!_name) {
        _name = [NSString new];
    }
    return _name;
}
@end
