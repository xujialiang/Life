//
//  LTimelinesDTO.h
//  Life
//
//  Created by xujialiang on 15/11/24.
//  Copyright © 2015年 xujialiang. All rights reserved.
//

#import "LBaseDTO.h"
#import "LUserDTO.h"
#import "LCommentDTO.h"
#import <CoreLocation/CoreLocation.h>

typedef enum LTimelinesType{
    LTimelinesType_Text,
    LTimelinesType_Forward
}LTimelinesType;

@interface LTimelinesDTO : LBaseDTO

@property (nonatomic,strong) LUserDTO *user;

@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSDate *dateTime;
@property (nonatomic,strong) NSString *dateTimeAgo;

@property (nonatomic,strong) NSArray<NSString *> *photoURLs;

@property (nonatomic,strong) NSArray<LCommentDTO *> *comments;

@property (nonatomic,strong) CLLocation *gpsInfo;
@property (nonatomic,strong) NSString *showGPS;

@end
