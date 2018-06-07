//
//  ViewController.m
//  iOS如何在Block中安全调用Super
//
//  Created by 开不了口的猫 on 2018/6/6.
//

#import "ViewController.h"
#import "SZYChildObject.h"

@interface ViewController ()

@property (nonatomic, weak) SZYChildObject *obj;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SZYChildObject *obj = [[SZYChildObject alloc] init];
    obj.customizedBlockHandler();
    self.obj = obj;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", self.obj);
}

@end
