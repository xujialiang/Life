//
//  LTimelinesLayout.m
//  Life
//
//  Created by xujialiang on 15/11/24.
//  Copyright © 2015年 xujialiang. All rights reserved.
//

#import "LTimelinesLayout.h"

@interface LTimelinesLayout()

@property (nonatomic,strong) LBaseDTO *dto;

@end

@implementation LTimelinesLayout

- (instancetype)initWithDTO:(LBaseDTO *)dto{
    if (!dto) return nil;
    self = [super init];
    self.dto = dto;
    [self layout];
    return self;
}

- (void)layout {
    [self _layout];
}

- (void)updateDate {
//    [self _layoutSource];
}

- (void)_layout {
    
    _marginTop = kLCellTopMargin;
    _nameHeight = 0;
    _textHeight = 0;
    _toolbarHeight = kLCellToolbarHeight;
    _marginBottom = kLCellBottomMargin;
    
    
    // 文本排版，计算布局
    [self _layoutName];
//    [self _layoutProfile];
//    [self _layoutRetweet];

    
    
    // 计算高度
    _height = 0;
    _height += _marginTop;
    _height += _nameHeight;
    _height += _textHeight;
    _height += _toolbarHeight;
    _height += _marginBottom;
}


/// 名字
- (void)_layoutName {
    
}

@end



/*
 将每行的 baseline 位置固定下来，不受不同字体的 ascent/descent 影响。
 
 注意，Heiti SC 中，    ascent + descent = font size，
 但是在 PingFang SC 中，ascent + descent > font size。
 所以这里统一用 Heiti SC (0.86 ascent, 0.14 descent) 作为顶部和底部标准，保证不同系统下的显示一致性。
 间距仍然用字体默认
 */
@implementation LTextLinePositionModifier

- (instancetype)init {
    self = [super init];
    
    if (kiOS9Later) {
        _lineHeightMultiple = 1.34;   // for PingFang SC
    } else {
        _lineHeightMultiple = 1.3125; // for Heiti SC
    }
    
    return self;
}

- (void)modifyLines:(NSArray *)lines fromText:(NSAttributedString *)text inContainer:(YYTextContainer *)container {
    //CGFloat ascent = _font.ascender;
    CGFloat ascent = _font.pointSize * 0.86;
    
    CGFloat lineHeight = _font.pointSize * _lineHeightMultiple;
    for (YYTextLine *line in lines) {
        CGPoint position = line.position;
        position.y = _paddingTop + ascent + line.row  * lineHeight;
        line.position = position;
    }
}

- (id)copyWithZone:(NSZone *)zone {
    LTextLinePositionModifier *one = [self.class new];
    one->_font = _font;
    one->_paddingTop = _paddingTop;
    one->_paddingBottom = _paddingBottom;
    one->_lineHeightMultiple = _lineHeightMultiple;
    return one;
}

- (CGFloat)heightForLineCount:(NSUInteger)lineCount {
    if (lineCount == 0) return 0;
    //    CGFloat ascent = _font.ascender;
    //    CGFloat descent = -_font.descender;
    CGFloat ascent = _font.pointSize * 0.86;
    CGFloat descent = _font.pointSize * 0.14;
    CGFloat lineHeight = _font.pointSize * _lineHeightMultiple;
    return _paddingTop + _paddingBottom + ascent + descent + (lineCount - 1) * lineHeight;
}

@end