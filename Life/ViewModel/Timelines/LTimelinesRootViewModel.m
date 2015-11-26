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
        self.showData = [[NSMutableArray alloc] init];
        #warning 测试数据
        for (int i =0 ; i<100; i++) {
            LTimelinesDTO *dto = [self mockdata];
            if (i%3==0) {
                dto.photoURLs=nil;
            }
            if (i%2==0) {
                dto.notifyPerson=nil;
            }
            
            if (i%4==0) {
                dto.showGPS=nil;
            }
            [self.showData addObject:dto];
        }
    }
    return self;
}

- (LTimelinesDTO *)mockdata{
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
    
    dto.notifyPerson = @[dto.user,dto.user,dto.user];
    
    dto.cardType = LTimelinesCardType_WebSite;
    dto.cardDesc = @"这是一条描述这是一条描述这是一条描述这是一条描述这是一条描述这是一条描述这是一条描述这是一条描述这是一条描述";
    dto.cardImageURL = @"https://github.com/logo.png";
    dto.cardLinkURL = @"http://baidu.com";
    
    LCommentDTO *commentdto = [[LCommentDTO alloc] init];
    commentdto.user = dto.user;
    commentdto.commentText = @"这是一个评论";
    commentdto.createTime = [NSDate date];
    
    dto.showGPS = @"上海.正大乐城";
    
    return dto;
}

@end
