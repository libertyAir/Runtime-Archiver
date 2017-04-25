//
//  ViewController.m
//  Runtime01-Archiver
//
//  Created by libertyAir on 2017/4/20.
//  Copyright © 2017年 libertyAir. All rights reserved.
//

#import "ViewController.h"
#import "User.h"

@interface ViewController ()
@property(nonatomic,strong)User *user;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    User *user = [[User alloc]init];
    //随意写点测试数据
    user.uid = @"123456";
    user.username = @"name";
    user.avatar = @"http://192.168.1.1/avatar";
    user.mobile = @"188888888888";
    user.tag = @"1";
    user.edition = @"1";
    
    self.user = user;
    
}

- (IBAction)save:(id)sender {
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"user.dat"];
    NSLog(@"%@",path);
    [self.user saveToFile:path];
}

- (IBAction)read:(id)sender {
    User *user = [User readFromFile:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"user.dat"]];
    NSLog(@"%@,%@,%@,%@,%@,%@",user.uid,user.username,user.avatar,user.mobile,user.tag,user.edition);
}

- (IBAction)delete:(id)sender {
    [User removeFromFile:[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"user.dat"]];
}


@end
