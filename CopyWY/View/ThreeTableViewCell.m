//
//  ThreeTableViewCell.m
//  CopyWY
//
//  Created by abnerzhang on 16/8/30.
//  Copyright © 2016年 abnerzhang. All rights reserved.
//

#import "ThreeTableViewCell.h"

@interface ThreeTableViewCell ()
@property (nonatomic, strong) UIButton *cheakView;
@end

@implementation ThreeTableViewCell

- (UIButton *)cheakView
{
    if (_cheakView == nil) {
        
        _cheakView = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _cheakView.userInteractionEnabled = NO;
        
        [_cheakView setImage:[UIImage imageNamed:@"unSelect"] forState:UIControlStateNormal];
        
        [_cheakView setImage:[UIImage imageNamed:@"select"] forState:UIControlStateSelected];
        
        [_cheakView sizeToFit];
        
        self.accessoryView = _cheakView;
    }
    return _cheakView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.cheakView.hidden = NO;
    }
    return self;
}
- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    
    self.cheakView.selected = isSelected;
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
