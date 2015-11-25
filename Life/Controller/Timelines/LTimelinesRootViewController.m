//
//  LTimelinesRootViewController.m
//  Life
//
//  Created by xujialiang on 15/11/24.
//  Copyright © 2015年 xujialiang. All rights reserved.
//

#import "LTimelinesRootViewController.h"
#import "LTimelinesRootViewModel.h"
#import "LTimelinesTextCell.h"
#import <YYKit.h>
#import "LTimelinesLayout.h"

@interface LTimelinesRootViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIView *header;
@property (weak, nonatomic) IBOutlet UIImageView *headerBg;
@property (weak, nonatomic) IBOutlet UIView *avatarContainer;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;

@property (nonatomic,strong) NSMutableArray *layouts;
@end

@implementation LTimelinesRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[LTimelinesRootViewModel alloc] init];
    
    [self.avatar setImageURL:[NSURL URLWithString:@"https://github.com/logo.png"]];
    
    [self loadData];
}

-(void)loadData{
    self.layouts = [[NSMutableArray alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (LBaseDTO *dto in self.viewModel.showData) {
            LTimelinesLayout *layout = [[LTimelinesLayout alloc] initWithDTO:dto];
            [self.layouts addObject:layout];
        }
                
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    });
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewModel.showData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LTimelinesTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid" forIndexPath:indexPath];
    cell.dataDTO = self.viewModel.showData[indexPath.row];
    [cell setLayout:self.layouts[indexPath.row]];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat h = (self.layouts!=nil && self.layouts.count>0)?((LTimelinesLayout *)self.layouts[indexPath.row]).height:0;
    return h;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.header;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 280;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
