//
//  User.h
//  Runtime01-Archiver
//
//  Created by libertyAir on 2017/4/20.
//  Copyright © 2017年 libertyAir. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Archiver.h"

@interface User : NSObject

@property (nonatomic,copy)NSString *uid;
@property (nonatomic,copy)NSString *username;
@property (nonatomic,copy)NSString *avatar;
@property (nonatomic,copy)NSString *mobile;
@property (nonatomic,copy)NSString *tag;
@property (nonatomic,copy)NSString *edition;

@end
