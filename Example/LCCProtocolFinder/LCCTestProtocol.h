//
//  LCCTestProtocol.h
//  LCCProtocolFinder_Example
//
//  Created by L63 on 2021/11/29.
//  Copyright © 2021 lu63chuan@163.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LCCTestProtocol <NSObject>
- (void)test:(NSString *)param;
- (void)test2:(NSString *)param param2:(NSString *)param2;
@end

NS_ASSUME_NONNULL_END
