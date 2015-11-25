//
//  LTimelinesLayout.m
//  Life
//
//  Created by xujialiang on 15/11/24.
//  Copyright © 2015年 xujialiang. All rights reserved.
//

#import "LTimelinesLayout.h"
#import "LTimelinesDTO.h"

@interface LTimelinesLayout()

@property (nonatomic,strong) LTimelinesDTO *dto;

@end

@implementation LTimelinesLayout

- (instancetype)initWithDTO:(LTimelinesDTO *)dto{
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
    _photoHeight = 0;
    _gpsInfoHeight = 0;
    _notifyPersonHeight=0;
    _fwdCardHeight = 0;
    _toolbarHeight = kLCellToolbarHeight;
    _commentsHeight = 0;
    _marginBottom = kLCellBottomMargin;
    
    
    // 文本排版，计算布局
    [self _layoutName];
    [self _layoutText];
    [self _layoutPhotos];
    [self _layoutGPSInfo];
    [self _layoutNotifyPerson];
    [self _layoutToolbar];
    
    
    // 计算高度
    _height = 0;
    _height += _marginTop;
    _height += _nameHeight;
    _height += _textHeight;
    _height += _photoHeight;
    _height += _gpsInfoHeight;
    _height += _notifyPersonHeight;
    _height += _toolbarHeight;
    _height += _marginBottom;
}


/// 名字
- (void)_layoutName {
    _nameHeight = 0;
    _nameLayout = nil;
    
    // 字体
    UIFont *font = [UIFont systemFontOfSize:kLCellNameFontSize];
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:self.dto.user.username];
    text.font = font;
    text.color = kLCellTextNormalColor;
    if (text.length == 0) return;
    
    LTextLinePositionModifier *modifier = [LTextLinePositionModifier new];
    modifier.font = [UIFont fontWithName:@"Heiti SC" size:kLCellNameFontSize];
    modifier.paddingTop = 0;
    modifier.paddingBottom = 0;
    
    YYTextContainer *container = [YYTextContainer new];
    container.size = CGSizeMake(kScreenWidth-100, HUGE);
    container.linePositionModifier = modifier;
    
    _nameLayout = [YYTextLayout layoutWithContainer:container text:text];
    if (!_nameLayout) return;
    
    _nameHeight = [modifier heightForLineCount:_nameLayout.rowCount];
}

/// 正文
- (void)_layoutText {
    _textHeight = 0;
    _textLayout = nil;
    
    // 字体
    UIFont *font = [UIFont systemFontOfSize:kLCellTextFontSize];
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:self.dto.content];
    text.font = font;
    text.color = kLCellTextNormalColor;
    if (text.length == 0) return;
    
    LTextLinePositionModifier *modifier = [LTextLinePositionModifier new];
    modifier.font = [UIFont fontWithName:@"Heiti SC" size:kLCellTextFontSize];
    modifier.paddingTop = 10;
    modifier.paddingBottom = 10;
    
    YYTextContainer *container = [YYTextContainer new];
    container.size = CGSizeMake(kScreenWidth-100, HUGE);
    container.linePositionModifier = modifier;
    
    _textLayout = [YYTextLayout layoutWithContainer:container text:text];
    if (!_textLayout) return;
    
    _textHeight = [modifier heightForLineCount:_textLayout.rowCount];
}

- (void)_layoutToolbar{
    _toolbarHeight = 31;
    
    UIFont *font = [UIFont systemFontOfSize:kLCellToolbarFontSize];

    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:self.dto.dateTimeAgo];
    text.font = font;
    text.color = UIColorHex(727272);
    if (text.length == 0) return;
    
    LTextLinePositionModifier *modifier = [LTextLinePositionModifier new];
    modifier.font = [UIFont fontWithName:@"Heiti SC" size:kLCellToolbarFontSize];
    modifier.paddingTop = 0;
    modifier.paddingBottom = 0;
    
    YYTextContainer *container = [YYTextContainer new];
    container.size = CGSizeMake(63, HUGE);
    container.linePositionModifier = modifier;
    
    _dateTimeTextLayout = [YYTextLayout layoutWithContainer:container text:text];
    if (!_dateTimeTextLayout) return;
    
}

- (void)_layoutPhotos{
    if (self.dto.photoURLs && self.dto.photoURLs.count>0) {
        if (self.dto.photoURLs.count>0 && self.dto.photoURLs.count<=3) {
            _photoHeight = 86+10;
        }else if (self.dto.photoURLs.count>3 && self.dto.photoURLs.count<=6){
            _photoHeight=86*2+5+10;
        }else if (self.dto.photoURLs.count>6 && self.dto.photoURLs.count<=9){
            _photoHeight=86*3+5*2 +10;
        }
    }else{
        _photoHeight = 0;
    }
}

- (void)_layoutGPSInfo{
    if (self.dto.showGPS) {
        UIFont *font = [UIFont systemFontOfSize:12];
        
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:self.dto.showGPS];
        text.font = font;
        text.color = UIColorHex(6b7692);
        if (text.length == 0) return;
        
        LTextLinePositionModifier *modifier = [LTextLinePositionModifier new];
        modifier.font = [UIFont fontWithName:@"Heiti SC" size:12];
        modifier.paddingTop = 10;
        modifier.paddingBottom = 10;
        
        YYTextContainer *container = [YYTextContainer new];
        container.size = CGSizeMake(kScreenWidth-100, HUGE);
        container.linePositionModifier = modifier;
        
        _gpsInfoLayout = [YYTextLayout layoutWithContainer:container text:text];
        if (!_gpsInfoLayout) return;
        
        _gpsInfoHeight = [modifier heightForLineCount:_gpsInfoLayout.rowCount];

    }
}

- (void)_layoutNotifyPerson{
    if (self.dto.notifyPerson && self.dto.notifyPerson.count>0) {
        UIFont *font = [UIFont systemFontOfSize:12];
        
        NSString *result = @"提到了:";
        for (LUserDTO *dto in self.dto.notifyPerson) {
            result = [[result stringByAppendingString:dto.username] stringByAppendingString:@","];
        }
        result = [result substringToIndex:result.length-1];
        
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:result];
        text.font = font;
        text.color = UIColorHex(747474);
        if (text.length == 0) return;
        
        LTextLinePositionModifier *modifier = [LTextLinePositionModifier new];
        modifier.font = [UIFont fontWithName:@"Heiti SC" size:12];
        modifier.paddingTop = 10;
        modifier.paddingBottom = 10;
        
        YYTextContainer *container = [YYTextContainer new];
        container.size = CGSizeMake(kScreenWidth-100, HUGE);
        container.linePositionModifier = modifier;
        
        _notifyPersonLayout = [YYTextLayout layoutWithContainer:container text:text];
        if (!_notifyPersonLayout) return;
        
        _notifyPersonHeight = [modifier heightForLineCount:_notifyPersonLayout.rowCount];
    }
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