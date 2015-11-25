//
//  LTimelinesLayout.h
//  Life
//
//  Created by xujialiang on 15/11/24.
//  Copyright © 2015年 xujialiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBaseLayout.h"
#import "LBaseDTO.h"
#import <YYKit.h>

@interface LTimelinesLayout : LBaseLayout

- (instancetype)initWithDTO:(LBaseDTO *)dto;
- (void)layout; ///< 计算布局
- (void)updateDate; ///< 更新时间字符串

// 顶部留白
@property (nonatomic, assign) CGFloat marginTop; //顶部灰色留白
// 下边留白
@property (nonatomic, assign) CGFloat marginBottom; //下边留白

// 昵称
@property (nonatomic, assign) CGFloat nameHeight; //文本高度(包括下方留白)
@property (nonatomic, strong) YYTextLayout *nameLayout; //文本

// 文本
@property (nonatomic, assign) CGFloat textHeight; //文本高度(包括下方留白)
@property (nonatomic, strong) YYTextLayout *textLayout; //文本

// 照片
@property (nonatomic, assign) CGFloat photoHeight; //图片高度

// Card
@property (nonatomic, assign) CGFloat fwdCardHeight; //卡片高度

// GPS
@property (nonatomic, assign) CGFloat gpsInfoHeight; //文本高度(包括下方留白)
@property (nonatomic, strong) YYTextLayout *gpsInfoLayout; //文本

// 工具栏
@property (nonatomic, assign) CGFloat toolbarHeight; // 工具栏
@property (nonatomic, strong) YYTextLayout *dateTimeTextLayout;
@property (nonatomic, strong) YYTextLayout *deleteTextLayout;
@property (nonatomic,strong)  UIImageView *commentBtnLayout;

@property (nonatomic, assign) CGFloat dateTimeTextWidth;
@property (nonatomic, assign) CGFloat deleteTextWidth;
@property (nonatomic, assign) CGFloat commentBtnWidth;

//评论高度
@property (nonatomic, assign) CGFloat commentsHeight;
@property (nonatomic, strong) NSArray<YYTextLayout*> *commentsLayout;

// 总高度
@property (nonatomic, assign) CGFloat height;
@end


/**
 文本 Line 位置修改
 将每行文本的高度和位置固定下来，不受中英文/Emoji字体的 ascent/descent 影响
 */
@interface LTextLinePositionModifier : NSObject <YYTextLinePositionModifier>
@property (nonatomic, strong) UIFont *font; // 基准字体 (例如 Heiti SC/PingFang SC)
@property (nonatomic, assign) CGFloat paddingTop; //文本顶部留白
@property (nonatomic, assign) CGFloat paddingBottom; //文本底部留白
@property (nonatomic, assign) CGFloat lineHeightMultiple; //行距倍数
- (CGFloat)heightForLineCount:(NSUInteger)lineCount;
@end