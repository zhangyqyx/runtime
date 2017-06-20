//
//  TFArchiveViewController.m
//  TFRuntimeDemo
//
//  Created by 张永强 on 17/6/20.
//  Copyright © 2017年 TechFantasy. All rights reserved.
//

#import "TFArchiveViewController.h"
#import "TFChangeModel.h"
#import "TFRuntimeManager.h"

@interface TFArchiveViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *gender;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UITextView *showView;
/**filePath */
@property (nonatomic , strong)NSString *filePath;
@end

@implementation TFArchiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title   = self.titleName;
    //创建路径
    NSString *documentPath      = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES)lastObject];
    NSString *filePath          = [documentPath stringByAppendingPathComponent:@"TFChangeModel.plist"];
    self.filePath               = filePath;
}

- (IBAction)archive:(id)sender {
    TFChangeModel *model        = [[TFChangeModel alloc] init];
    model.name                  = self.name.text;
    model.gender                = self.gender.text;
    model.age                   = self.age.text;
    
    BOOL result = [TFRuntimeManager TF_archive:[model class] model:model filePath:self.filePath];
    if (result) {
        NSLog(@"归档成功:%@",self.filePath);
    }else{
        NSLog(@"归档失败");
    }
}
- (IBAction)unarchive:(id)sender {
    TFChangeModel *model  = [TFRuntimeManager TF_unarchive:[TFChangeModel class] filePath:self.filePath];
    self.showView.text = [self.showView.text stringByAppendingString:[NSString stringWithFormat:@"\nname =%@\ngender = %@\nage = %@\n" , model.name , model.gender , model.age]];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
