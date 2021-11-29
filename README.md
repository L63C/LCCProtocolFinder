# LCCProtocolFinder

[![CI Status](https://img.shields.io/travis/lu63chuan@163.com/LCCProtocolFinder.svg?style=flat)](https://travis-ci.org/lu63chuan@163.com/LCCProtocolFinder)
[![Version](https://img.shields.io/cocoapods/v/LCCProtocolFinder.svg?style=flat)](https://cocoapods.org/pods/LCCProtocolFinder)
[![License](https://img.shields.io/cocoapods/l/LCCProtocolFinder.svg?style=flat)](https://cocoapods.org/pods/LCCProtocolFinder)
[![Platform](https://img.shields.io/cocoapods/p/LCCProtocolFinder.svg?style=flat)](https://cocoapods.org/pods/LCCProtocolFinder)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

LCCProtocolFinder is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LCCProtocolFinder'
```

## Use
1. 定义协议
```

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LCCTestProtocol <NSObject>
- (void)test:(NSString *)param;
- (void)test2:(NSString *)param param2:(NSString *)param2;
@end
```
2. 发出通知
```
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
        [obj test2:@"xxx" param2:@"yyy"];
    }
```
3. 接收通知
```
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
```
## Author

lu63chuan@163.com, lu63chuan@163.com

## License

LCCProtocolFinder is available under the MIT license. See the LICENSE file for more info.
