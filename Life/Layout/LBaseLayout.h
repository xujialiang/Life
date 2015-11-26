//
//  LBaseLayout.h
//  Life
//
//  Created by xujialiang on 15/11/24.
//  Copyright © 2015年 xujialiang. All rights reserved.
//

#import <Foundation/Foundation.h>

// 宽高
#define kLCellTopMargin 15      // cell 顶部灰色留白
#define kLCellBottomMargin 15      // cell 顶部灰色留白

#define kLCellToolbarHeight 15

#define kLCellNameFontSize 15
#define kLCellTextFontSize 16
#define kLCellToolbarFontSize 13
#define kLCellCardFontSize 14


#define kLCellContentTextFontSize 17
#define kLCellCardDescFontSize 16 // 卡片描述文本字体大小

#define kLCellTextNormalColor UIColorHex(333333) // 一般文本色
#define kLCellTextSubTitleColor UIColorHex(5d5d5d) // 次要文本色
#define kLCellTextHighlightColor UIColorHex(527ead) // Link 文本色
#define kLCellTextHighlightBackgroundColor UIColorHex(bfdffe) // Link 点击背景色
#define kLCellNameNormalColor UIColorHex(333333) // 名字颜色

#define kLCellInnerViewColor UIColorHex(f7f7f7)   // Cell内部卡片灰色
#define kLCellLineColor [UIColor colorWithWhite:0.000 alpha:0.09] //线条颜色

@interface LBaseLayout : NSObject

@end
