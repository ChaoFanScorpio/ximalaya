//
//  ViewController.m
//  XiMaLaYaNav
//
//  Created by 张得丑 on 2019/3/7.
//  Copyright © 2019 zhangdechou. All rights reserved.
//

#import "ViewController.h"
#import "ModelViewController.h"
#import "UIControllerHome.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    self.navigationController.delegate = self;
    
    [self initialSubView];
}

#pragma mark - initialSubViews
- (void)initialSubView{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.rowHeight = 130;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCell.jk_className];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCell.jk_className];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"张";
    }else{
        cell.textLabel.text = @"石";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        
        [self.navigationController pushViewController:[[ModelViewController alloc] init] animated:YES];
        
    }else{
        UIControllerHome *controller = [[UIControllerHome alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}


#pragma mark - UINavigationControllerDelegate
// 将要显示控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
//    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    
//    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}

@end
