//
//  LUserDTO.h
//  Life
//
//  Created by xujialiang on 15/11/24.
//  Copyright © 2015年 xujialiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LUserDTO : NSObject

@property (nonatomic,strong) NSString *userid;
@property (nonatomic,strong) NSString *username;
@property (nonatomic,assign) BOOL     isAdmin;
@property (nonatomic,assign) BOOL     isVip;
@property (nonatomic,strong) NSString *avatarUrl;
@property (nonatomic,strong) NSString *email;

@end
