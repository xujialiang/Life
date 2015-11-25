//
//  LTimelinesRootViewModel.m
//  Life
//
//  Created by xujialiang on 15/11/24.
//  Copyright © 2015年 xujialiang. All rights reserved.
//

#import "LTimelinesRootViewModel.h"
#import "LTimelinesDTO.h"

@implementation LTimelinesRootViewModel

-(instancetype)init{
    if (self=[super init]) {
        
#warning 测试数据
        LTimelinesDTO *dto = [[LTimelinesDTO alloc] init];
        dto.user = [[LUserDTO alloc] init];
        dto.user.userid = @"001";
        dto.user.username = @"一口盐汽水喷死你";
        dto.user.isAdmin = YES;
        dto.user.isVip = YES;
        dto.user.avatarUrl = @"https://github.com/logo.png";
        dto.user.email = @"mail@xujialiang.net";
        
        dto.content = @"test123";
        dto.dateTime = [NSDate date];
        dto.dateTimeAgo = @"1小时前";
        
        dto.photoURLs = @[@"https://github.com/logo.png1",@"https://github.com/logo.png",@"https://github.com/logo.png2"];
        
        LCommentDTO *commentdto = [[LCommentDTO alloc] init];
        commentdto.user = dto.user;
        commentdto.commentText = @"这是一个评论";
        commentdto.createTime = [NSDate date];
        
        dto.showGPS = @"上海.正大乐城";
        
        
        self.showData = @[dto];
        
    }
    return self;
}

@end
