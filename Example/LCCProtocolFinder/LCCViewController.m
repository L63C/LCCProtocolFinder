//
//  LCCViewController.m
//  LCCProtocolFinder
//
//  Created by lu63chuan@163.com on 11/29/2021.
//  Copyright (c) 2021 lu63chuan@163.com. All rights reserved.
//

#import "LCCViewController.h"
#import "ProtocolFinder.h"
#import "LCCTestProtocol.h"
@interface LCCViewController ()<LCCTestProtocol>

@end

@implementation LCCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	//注册监听
    [[ProtocolFinder defaultFinder] registerObj:self forProtocols:@[@protocol(LCCTestProtocol)]];
}

- (void)test:(NSString *)param{
    NSLog(@"%s",__func__);
}
- (void)test2:(NSString *)param param2:(NSString *)param2{
    NSLog(@"%s",__func__);
}
@end
