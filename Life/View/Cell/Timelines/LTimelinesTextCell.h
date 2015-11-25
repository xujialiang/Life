//
//  LTimelinesTextCell.h
//  Life
//
//  Created by xujialiang on 15/11/24.
//  Copyright © 2015年 xujialiang. All rights reserved.
//

#import "LBaseCell.h"
#import "LTimelinesLayout.h"
#import "LUserDTO.h"
#import "LTimelinesDTO.h"

@class LTimelinesView;
@protocol LTimelinesCellDelegate;

@interface LTimelinesTextCell : LBaseCell

@property (nonatomic,strong) LTimelinesDTO *dataDTO;
@property (nonatomic, weak) id<LTimelinesCellDelegate> delegate;
@property (nonatomic, strong) LTimelinesView *statusView;
- (void)setLayout:(LTimelinesLayout *)layout;

@end



@class LTimelinesToolbarView;
@interface LTimelinesView : UIView
@property (nonatomic,strong) LTimelinesDTO *dataDTO;
@property (nonatomic, strong) UIView *contentView;              // 容器
@property (nonatomic, strong) UIImageView *avatarView;          // 头像
@property (nonatomic, strong) YYLabel *nameLabel;               // 昵称
@property (nonatomic, strong) YYLabel *contentLabel;            // 正文
@property (nonatomic, strong) UIView *picContainer;                // 图片 Array<UIImageView>
@property (nonatomic, strong) YYLabel *gpsInfoLabel;            // GPS
@property (nonatomic, strong) YYLabel *notifyPerson;            // 提到了谁


@property (nonatomic, strong) LTimelinesToolbarView *toolbarView; // 工具栏

@property (nonatomic, strong) LTimelinesLayout *layout;
@property (nonatomic, weak) LTimelinesTextCell *cell;

- (instancetype)initWithFrame:(CGRect)frame;

@end


@interface LTimelinesToolbarView : UIView
@property (nonatomic,strong) LTimelinesDTO *dataDTO;
@property (nonatomic, strong) YYLabel *timesago;
@property (nonatomic, strong) UIImageView *isPrivate;
@property (nonatomic, strong) YYLabel *Btndelete;
@property (nonatomic, strong) YYLabel *BtnActions;

@property (nonatomic, strong) UIView *contentView;              // 容器

@property (nonatomic, weak) LTimelinesTextCell *cell;

- (void)setWithLayout:(LTimelinesLayout *)layout;
@end

@protocol LTimelinesCellDelegate <NSObject>
@optional
/// 点击了 Cell
- (void)cellDidClick:(LTimelinesTextCell *)cell;
/// 点击了 Card
- (void)cellDidClickCard:(LTimelinesTextCell *)cell;
/// 点击了转发内容
- (void)cellDidClickRetweet:(LTimelinesTextCell *)cell;
/// 点击了Cell菜单
- (void)cellDidClickMenu:(LTimelinesTextCell *)cell;
/// 点击了关注
- (void)cellDidClickFollow:(LTimelinesTextCell *)cell;
/// 点击了转发
- (void)cellDidClickRepost:(LTimelinesTextCell *)cell;
/// 点击了下方 Tag
- (void)cellDidClickTag:(LTimelinesTextCell *)cell;
/// 点击了评论
- (void)cellDidClickComment:(LTimelinesTextCell *)cell;
/// 点击了赞
- (void)cellDidClickLike:(LTimelinesTextCell *)cell;
/// 点击了用户
- (void)cell:(LTimelinesTextCell *)cell didClickUser:(LUserDTO *)user;
/// 点击了图片
- (void)cell:(LTimelinesTextCell *)cell didClickImageAtIndex:(NSUInteger)index;
/// 点击了 Label 的链接
- (void)cell:(LTimelinesTextCell *)cell didClickInLabel:(YYLabel *)label textRange:(NSRange)textRange;
@end
