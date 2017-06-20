//
//  TFDictChangeModelViewController.m
//  TFRuntimeDemo
//
//  Created by 张永强 on 17/6/20.
//  Copyright © 2017年 TechFantasy. All rights reserved.
//

#import "TFDictChangeModelViewController.h"
#import "TFChangeModel.h"
#import "TFRuntimeManager.h"

@interface TFDictChangeModelViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *gender;
@property (weak, nonatomic) IBOutlet UITextField *age;
@property (weak, nonatomic) IBOutlet UITextView *showView;

@end

@implementation TFDictChangeModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.titleName;
}

- (IBAction)change:(id)sender {
    NSDictionary *dic = @{@"name":self.name.text ,
                          @"gender":self.gender.text,
                          @"age":self.age.text};
    TFChangeModel *model = [TFRuntimeManager TF_modelWithDict:dic model:[TFChangeModel class]];
    self.showView.text = [self.showView.text stringByAppendingString:[NSString stringWithFormat:@"\nname =%@\ngender = %@\nage = %@\n" , model.name , model.gender , model.age]];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}


@end
