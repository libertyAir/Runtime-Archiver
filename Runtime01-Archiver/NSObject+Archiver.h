//
//  NSObject+Archiver.h
//  Runtime01-Archiver
//
//  Created by libertyAir on 2017/4/20.
//  Copyright © 2017年 libertyAir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Archiver) <NSCoding>

- (BOOL)saveToFile:(NSString *)path;

+ (id)readFromFile:(NSString *)path;

+ (BOOL)removeFromFile:(NSString *)path;

@end
