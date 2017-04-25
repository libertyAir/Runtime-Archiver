//
//  NSObject+Archiver.m
//  Runtime01-Archiver
//
//  Created by libertyAir on 2017/4/20.
//  Copyright © 2017年 libertyAir. All rights reserved.
//

#import "NSObject+Archiver.h"
#import <objc/message.h>

//NSString * const fileName = @"model.dat";
static NSString * const fileName = @"model.dat";

@implementation NSObject (Archiver)

//解档
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [self init]) {
        //属性的个数
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList([self class], &count);
        for (int i = 0; i < count; i ++) {
            //取出对应的Ivar
            Ivar ivar = ivars[i];
            //取出名称
            const char *name = ivar_getName(ivar);
            //char * 转 OC 字符串
            NSString *key = [NSString stringWithUTF8String:name];
            //解档  利用KVC赋值
            id value = [aDecoder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    //用runtime赋值需要知道3个东西，属性的个数(用于控制循环)，属性的key，属性的值
    //属性的个数
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    //遍历
    for (int i = 0; i < count; i++) {
        //取出对应的Ivar
        Ivar ivar = ivars[i];
        //取出名称
        const char *name = ivar_getName(ivar);
        //char * 转 OC 字符串  归档
        NSString *key = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
}

- (BOOL)saveToFile:(NSString *)path{
    NSString *filePath = path;
    if (!filePath) {
        //default path
        filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:fileName];
    }
    
    return [NSKeyedArchiver archiveRootObject:self toFile:filePath];
}

+ (id)readFromFile:(NSString *)path{
    NSString *filePath = path;
    if (!filePath) {
        //default path
        filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:fileName];
    }
    
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}

+ (BOOL)removeFromFile:(NSString *)path{
    NSString *filePath = path;
    if(!path){
        filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:fileName];
    }
    
    NSFileManager *manager = [[NSFileManager alloc]init];
    return [manager removeItemAtPath:filePath error:nil];
}

@end
