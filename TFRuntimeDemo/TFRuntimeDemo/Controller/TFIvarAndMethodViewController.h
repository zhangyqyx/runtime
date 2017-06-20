//
//  TFIvarAndMethodViewController.h
//  TFRuntimeDemo
//
//  Created by 张永强 on 17/6/20.
//  Copyright © 2017年 TechFantasy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFIvarAndMethodViewController : UIViewController
/**标题 */
@property (nonatomic , strong)NSString *titleName;
/**类型  1 属性 2 方法*/
@property (nonatomic , assign)int type;

@end
