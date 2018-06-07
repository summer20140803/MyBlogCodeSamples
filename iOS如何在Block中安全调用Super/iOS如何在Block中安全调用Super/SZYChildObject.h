//
//  SZYChildObject.h
//  iOS如何在Block中安全调用Super
//
//  Created by 开不了口的猫 on 2018/6/6.
//

#import "SZYParentObject.h"

@interface SZYChildObject : SZYParentObject

@property (nonatomic, copy) void (^customizedBlockHandler)(void);

@end
