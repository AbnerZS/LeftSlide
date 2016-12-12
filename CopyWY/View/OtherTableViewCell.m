//
//  OtherTableViewCell.m
//  CopyWY
//
//  Created by abnerzhang on 16/8/30.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "OtherTableViewCell.h"

@implementation OtherTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
