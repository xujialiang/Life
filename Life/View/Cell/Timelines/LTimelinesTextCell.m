//
//  LTimelinesTextCell.m
//  Life
//
//  Created by xujialiang on 15/11/24.
//  Copyright © 2015年 xujialiang. All rights reserved.
//

#import "LTimelinesTextCell.h"
#import <Masonry.h>

@implementation LTimelinesTextCell

-(void)awakeFromNib{
    self.showSeperator=YES;
    [super awakeFromNib];
    
    _statusView = [[LTimelinesView alloc] initWithFrame:CGRectZero];
    _statusView.cell = self;
//    _statusView.backgroundColor = [UIColor blueColor];
    _statusView.toolbarView.cell = self;
    
    [self.contentView addSubview:_statusView];
}

-(void)setDataDTO:(LTimelinesDTO *)dataDTO{
    _dataDTO = dataDTO;
    _statusView.dataDTO = dataDTO;

}

- (void)setLayout:(LTimelinesLayout *)layout {
    self.height = layout.height;
    self.contentView.height = layout.height;
    _statusView.layout = layout;
}
@end


@implementation LTimelinesView

- (instancetype)initWithFrame:(CGRect)frame{
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size.width = kScreenWidth;
        frame.size.height = 1;
    }
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor clearColor];
    self.exclusiveTouch = YES;
    @weakify(self);
    
    _contentView = [UIView new];
    _contentView.width = kScreenWidth;
    _contentView.height = 1;
    
    _avatarView = [[UIImageView alloc] init];
    _avatarView.backgroundColor = [UIColor blackColor];
    [_contentView addSubview:_avatarView];
    
    _nameLabel = [YYLabel new];
    _nameLabel.left = 74;
    _nameLabel.textColor = kLCellTextHighlightColor;
    _nameLabel.width = kScreenWidth-100;
    _nameLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
    _nameLabel.displaysAsynchronously = YES;
    _nameLabel.ignoreCommonProperties = YES;
    _nameLabel.fadeOnAsynchronouslyDisplay = NO;
    _nameLabel.fadeOnHighlight = NO;
    _nameLabel.highlightTapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
//        if ([weak_self.cell.delegate respondsToSelector:@selector(cell:didClickInLabel:textRange:)]) {
//            [weak_self.cell.delegate cell:weak_self.cell didClickInLabel:(YYLabel *)containerView textRange:range];
//        }
    };
    [_contentView addSubview:_nameLabel];
    
    [self addSubview:_contentView];
    return self;
}

- (void)setLayout:(LTimelinesLayout *)layout {
    _layout = layout;
    
    self.height = layout.height;
    _contentView.top = layout.marginTop;
    _contentView.height = layout.height - layout.marginTop - layout.marginBottom;
    
    CGFloat top = 0;
    _nameLabel.top = top;
    _nameLabel.height = layout.nameHeight;
    _nameLabel.textLayout = layout.nameLayout;
    top += layout.nameHeight;
    
    [_avatarView setImageURL:[NSURL URLWithString:self.dataDTO.user.avatarUrl]];
    _avatarView.left = 20;
    _avatarView.width = 43;
    _avatarView.height = 43;
    _avatarView.top = 0;
}
@end


@implementation LTimelinesToolbarView


- (void)setWithLayout:(LTimelinesLayout *)layout{

}
@end