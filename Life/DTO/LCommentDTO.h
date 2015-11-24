//
//  LCommentDTO.h
//  Life
//
//  Created by xujialiang on 15/11/24.
//  Copyright © 2015年 xujialiang. All rights reserved.
//

#import "LBaseDTO.h"
#import "LUserDTO.h"

@interface LCommentDTO : LBaseDTO

@property (nonatomic,strong) LUserDTO *user;

@property (nonatomic,strong) NSString *commentText;

@property (nonatomic) NSDate   * createTime;
@end
