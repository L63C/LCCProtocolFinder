//
//  LCCVie2Controller.m
//  LCCProtocolFinder_Example
//
//  Created by L63 on 2021/11/29.
//  Copyright © 2021 lu63chuan@163.com. All rights reserved.
//

#import "LCCVie2Controller.h"
#import "ProtocolFinder.h"
#import "LCCTestProtocol.h"

@interface LCCVie2Controller ()

@end

@implementation LCCVie2Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    /// 发出通知
    // 只有一个参数时
    [[ProtocolFinder defaultFinder] execute:@protocol(LCCTestProtocol) selector:@selector(test:) withObj:@"xxxx"];
    /// 有多个参数时
    [[ProtocolFinder defaultFinder] execute:@protocol(LCCTestProtocol) selector:@selector(test2:param2:) run:^(id  _Nonnull obj) {
        [obj test2:@"xxx" param2:@"yyy"];
    }];
    //OR
    NSArray * objs = [[ProtocolFinder defaultFinder] findObjForProtocol:@protocol(LCCTestProtocol)];
    for (id<LCCTestProtocol> obj in objs) {
        if(obj respondsToSelector:@selector(test2:param2:)){
            [obj test2:@"xxx" param2:@"yyy"];
        }
        
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
