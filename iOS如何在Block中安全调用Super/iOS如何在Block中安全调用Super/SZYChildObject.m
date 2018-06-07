//
//  SZYChildObject.m
//  iOS如何在Block中安全调用Super
//
//  Created by 开不了口的猫 on 2018/6/6.
//

#import "SZYChildObject.h"
#import <objc/objc.h>
#import <objc/message.h>

@interface SZYChildObject ()

@end

@implementation SZYChildObject

//====================================
//      这是会导致循环引用的错误示例
//====================================
//- (instancetype)init {
//    self = [super init];
//    if (self) {
//        _customizedBlockHandler = ^{
//            // 假如这里我就是想要调用父类的方法
//            [super superMethod];
//        };
//    }
//    return self;
//}

//====================================
// 这才是在block中安全调用super方法的姿势
//====================================
- (instancetype)init {
    self = [super init];
    if (self) {
        __weak __typeof(self) weak_self = self;
        _customizedBlockHandler = ^{
            struct objc_super superInfo = {
                .receiver = weak_self,
                .super_class = class_getSuperclass(NSClassFromString(@"SZYChildObject"))
            };
            void (*msgSendSuperFunction)(struct objc_super *, SEL) = (__typeof__(msgSendSuperFunction))objc_msgSendSuper;
            msgSendSuperFunction(&superInfo, @selector(superMethod));
        };
    }
    return self;
}

#pragma mark - override method
- (void)superMethod {
    NSLog(@"子类自己的code实现");
}

@end
