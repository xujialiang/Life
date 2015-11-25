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
    [_statusView.toolbarView setWithLayout:layout];
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
    
    
    _contentLabel = [YYLabel new];
    _contentLabel.left = 74;
    _contentLabel.textColor = kLCellTextNormalColor;
    _contentLabel.width = kScreenWidth-100;
    _contentLabel.textVerticalAlignment = YYTextVerticalAlignmentTop;
    _contentLabel.displaysAsynchronously = YES;
    _contentLabel.ignoreCommonProperties = YES;
    _contentLabel.fadeOnAsynchronouslyDisplay = NO;
    _contentLabel.fadeOnHighlight = NO;
    _contentLabel.highlightTapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        //        if ([weak_self.cell.delegate respondsToSelector:@selector(cell:didClickInLabel:textRange:)]) {
        //            [weak_self.cell.delegate cell:weak_self.cell didClickInLabel:(YYLabel *)containerView textRange:range];
        //        }
    };
    [_contentView addSubview:_contentLabel];
    
    _toolbarView = [LTimelinesToolbarView new];
    _toolbarView.left = 74;
    _toolbarView.width = kScreenWidth-100;
    _toolbarView.dataDTO = self.dataDTO;
    [_contentView addSubview:_toolbarView];
    
    [self addSubview:_contentView];
    return self;
}

- (void)setLayout:(LTimelinesLayout *)layout {
    _layout = layout;
    
    self.height = layout.height;
    _contentView.top = layout.marginTop;
    _contentView.height = layout.height - layout.marginTop - layout.marginBottom;
    
    [_avatarView setImageURL:[NSURL URLWithString:self.dataDTO.user.avatarUrl]];
    _avatarView.left = 20;
    _avatarView.width = 43;
    _avatarView.height = 43;
    _avatarView.top = 0;
    
    CGFloat top = 0;
    _nameLabel.top = top;
    _nameLabel.height = layout.nameHeight;
    _nameLabel.textLayout = layout.nameLayout;
    top += layout.nameHeight;
    
    _contentLabel.top = top;
    _contentLabel.height = layout.textHeight;
    _contentLabel.textLayout = layout.textLayout;
    top += layout.textHeight;
    
    _toolbarView.top = top;
    _toolbarView.height = layout.toolbarHeight;
    [_toolbarView setWithLayout:layout];
}
@end


@implementation LTimelinesToolbarView

-(instancetype)initWithFrame:(CGRect)frame{
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size.width = kScreenWidth-100;
        frame.size.height = 15;
    }
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor clearColor];
    self.exclusiveTouch = YES;
    @weakify(self);
    
    _contentView = [[UIView alloc] init];
    [self addSubview:_contentView];
    
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.top.equalTo(@0);
        make.bottom.equalTo(@0);
        make.width.equalTo(@0);
    }];
    
    _timesago = [YYLabel new];
    _timesago.left = 0;
    _timesago.textColor = UIColorHex(727272);
    _timesago.width = 63;
    _timesago.top=0;
    _timesago.height = 15;
    _timesago.textVerticalAlignment = YYTextVerticalAlignmentTop;
    _timesago.displaysAsynchronously = YES;
    _timesago.ignoreCommonProperties = YES;
    _timesago.fadeOnAsynchronouslyDisplay = NO;
    _timesago.fadeOnHighlight = NO;
    _timesago.highlightTapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        //        if ([weak_self.cell.delegate respondsToSelector:@selector(cell:didClickInLabel:textRange:)]) {
        //            [weak_self.cell.delegate cell:weak_self.cell didClickInLabel:(YYLabel *)containerView textRange:range];
        //        }
    };
    [_contentView addSubview:_timesago];
    
    
    
    
    
    UIButton *btnComment = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnComment setImage:[UIImage imageNamed:@"btnComment"] forState:UIControlStateNormal];
    [btnComment setImage:[UIImage imageNamed:@"btnComment"] forState:UIControlStateHighlighted];
    btnComment.right = 0;
    btnComment.left = self.width-20;
    btnComment.width=20;
    btnComment.height=15;
    btnComment.top = 0;
    [_contentView addSubview:btnComment];
    
    
    
    return self;
}


- (void)setWithLayout:(LTimelinesLayout *)layout{
    _timesago.height=layout.toolbarHeight;
    _timesago.textLayout = layout.dateTimeTextLayout;
}
@end