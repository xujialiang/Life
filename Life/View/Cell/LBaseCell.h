//
//  LBaseCell.h
//  Life
//
//  Created by xujialiang on 15/11/24.
//  Copyright © 2015年 xujialiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBaseLayout.h"

@interface LBaseCell : UITableViewCell

@property (nonatomic,assign) BOOL showSeperator;

-(void)setCellLayout:(LBaseLayout *)layout;
@end
