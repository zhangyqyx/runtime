//
//  TFExchangeViewController.h
//  TFRuntimeDemo
//
//  Created by 张永强 on 17/6/20.
//  Copyright © 2017年 TechFantasy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFExchangeViewController : UIViewController
/**标题 */
@property (nonatomic , strong)NSString *titleName;
/**类型  1 交换  2 替换*/
@property (nonatomic , assign)int type;
@end
