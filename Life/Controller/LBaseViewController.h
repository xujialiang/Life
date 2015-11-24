//
//  LBaseViewController.h
//  Life
//
//  Created by xujialiang on 15/11/24.
//  Copyright © 2015年 xujialiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LBaseViewModel.h"

@interface LBaseViewController : UIViewController

@property (nonatomic,strong) IBOutlet UITableView *tableView;
@property (nonatomic,strong) LBaseViewModel *viewModel;

@end