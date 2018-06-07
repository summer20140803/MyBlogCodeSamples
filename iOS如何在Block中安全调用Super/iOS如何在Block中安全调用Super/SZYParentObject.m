//
//  SZYParentObject.m
//  iOS如何在Block中安全调用Super
//
//  Created by 开不了口的猫 on 2018/6/6.
//

#import "SZYParentObject.h"

@implementation SZYParentObject

- (void)superMethod {
    NSLog(@"%@, %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

@end
