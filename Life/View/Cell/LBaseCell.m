//
//  LBaseCell.m
//  Life
//
//  Created by xujialiang on 15/11/24.
//  Copyright © 2015年 xujialiang. All rights reserved.
//

#import "LBaseCell.h"
#import <YYKit.h>
#import <Masonry.h>
#import <UIKit/UIKit.h>

@implementation LBaseCell

- (void)awakeFromNib {
    for (UIView *view in self.subviews) {
        if([view isKindOfClass:[UIScrollView class]]) {
            ((UIScrollView *)view).delaysContentTouches = NO; // Remove touch delay for iOS 7
            break;
        }
    }
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundView.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = YES;
 
    if (self.showSeperator) {
        UIView *onePxline = [[UIView alloc] initWithFrame:CGRectZero];
        onePxline.backgroundColor = UIColorHex(f0f0f0);
        [self.contentView addSubview:onePxline];
        [onePxline mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(@0);
            make.trailing.equalTo(@0);
            make.bottom.equalTo(@0);
            make.height.equalTo(@1);
        }];
    }
}

-(void)setCellLayout:(LBaseLayout *)layout{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
