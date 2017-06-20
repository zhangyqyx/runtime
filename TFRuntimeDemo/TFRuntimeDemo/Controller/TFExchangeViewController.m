//
//  TFExchangeViewController.m
//  TFRuntimeDemo
//
//  Created by 张永强 on 17/6/20.
//  Copyright © 2017年 TechFantasy. All rights reserved.
//

#import "TFExchangeViewController.h"
#import "TFRuntimeManager.h"

@interface TFExchangeViewController ()

@end

@implementation TFExchangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.titleName;
}
- (IBAction)exchange:(id)sender {
    if (self.type == 1) {
        
      [TFRuntimeManager TF_exchangeMethodSourceClass:[UIButton class] sourceSel:@selector(setTitle:forState:) targetClass:[self class] targetSel:@selector(setTitleName: withState:)];
    }
}

- (IBAction)replace:(id)sender {
    if (self.type == 2) {
        [TFRuntimeManager TF_replaceMethodSourceClass:[UIButton class] sourceSel:@selector(setTitle:forState:)  targetClass:[self class] targetSel:@selector(setTitleName: withState:)];
    }
    
}
- (void)setTitleName:(NSString *)titleName withState:(UIControlState)state {
    NSLog(@"调用或者替换这个方法设置，titleName = %@" , titleName);
}


- (IBAction)use:(id)sender {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"设置的字" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 100, 20);
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
}



@end
