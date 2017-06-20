//
//  TFIvarAndMethodViewController.m
//  TFRuntimeDemo
//
//  Created by 张永强 on 17/6/20.
//  Copyright © 2017年 TechFantasy. All rights reserved.
//

#import "TFIvarAndMethodViewController.h"
#import "TFRuntimeManager.h"

@interface TFIvarAndMethodViewController ()
@property (weak, nonatomic) IBOutlet UITextField *className;
@property (weak, nonatomic) IBOutlet UITextView *showView;

@end

@implementation TFIvarAndMethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.titleName;
}

- (IBAction)get:(id)sender {
    self.showView.text = @"";
    NSArray *list;
    if ([self.className.text isEqualToString:@""] || self.className.text.length == 0) {
        NSLog(@"输入不能为空");
        return;
    }
    if (self.type == 1) {
        list = [TFRuntimeManager TF_getAllIvarWithClass:NSClassFromString(self.className.text)];
    }else if (self.type == 2) {
        list = [TFRuntimeManager TF_getAllMethodWithClass:NSClassFromString(self.className.text)];
    }
    for (NSString *name in list) {
        self.showView.text = [self.showView.text stringByAppendingString:[NSString stringWithFormat:@"%@\n" , name]];
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
