//
//  ModelViewController.m
//  XiMaLaYaNav
//
//  Created by 张得丑 on 2019/3/7.
//  Copyright © 2019 zhangdechou. All rights reserved.
//

#import "ModelViewController.h"
#import "HomeNavView.h"
#import "HomeHeaderView.h"
#import "HomeBackGroundView.h"
#import "ModelHomeToppingInfo.h"

static const CGFloat KHeaderViewHeight = 236;

@interface ModelViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) HomeNavView *homeNavView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) HomeHeaderView *headerView;

@property (nonatomic, strong) HomeBackGroundView *homeBackGroundView;

@property (nonatomic, strong) NSMutableArray *dataList;

@end

@implementation ModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self.view addSubview:self.homeBackGroundView];
    
    [self initialTableView];
    
    [self initialHomeHeaderView];
    
    [self loadHeaderData];
    
    [self handleEventAction];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


#pragma mark - initialSubView
- (void)initialHomeHeaderView{
    [self.view addSubview:self.homeNavView];
    self.tableView.tableHeaderView = self.headerView;
}

- (void)initialTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNaviBarHeight, kScreenWidth, kScreenHeight - kNaviBarHeight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = UIColor.clearColor;
    self.tableView.rowHeight = 140;
    [self.view addSubview:self.tableView];
}

- (void)handleEventAction{
    kWeakSelf(self)
    [RACObserve(self.headerView, currColor) subscribeNext:^(UIColor *color) {
        kStrongSelf(self)
        self.homeNavView.backgroundColor = color;
        self.homeBackGroundView.backgroundColor = color;
    }];
}

#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UITableViewCell new];
}

#pragma mark - TableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - request
- (void)loadHeaderData
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        ModelHomeToppingInfo *info1 = [[ModelHomeToppingInfo alloc] init];
        info1.jumpMode = HomeToppingJumpModeWeb;
        info1.jumpMine = @"https://www.baidu.com/";
        info1.showImage = [UIImage imageNamed:@"image_1"];
        info1.themeColor = [UIColor jk_colorWithHex:0x000000];
        
        ModelHomeToppingInfo *info2 = [[ModelHomeToppingInfo alloc] init];
        info2.jumpMode = HomeToppingJumpModeWeb;
        info2.jumpMine = @"https://www.baidu.com/";
        info2.showImage = [UIImage imageNamed:@"image_2"];
        info2.themeColor = [UIColor jk_colorWithHex:0xBF6238];
        
        ModelHomeToppingInfo *info3 = [[ModelHomeToppingInfo alloc] init];
        info3.jumpMode = HomeToppingJumpModeWeb;
        info3.jumpMine = @"https://www.baidu.com/";
        info3.showImage = [UIImage imageNamed:@"image_3"];
        info3.themeColor = [UIColor jk_colorWithHex:0x92AEC1];
        
        ModelHomeToppingInfo *info4 = [[ModelHomeToppingInfo alloc] init];
        info4.jumpMode = HomeToppingJumpModeWeb;
        info4.jumpMine = @"https://www.baidu.com/";
        info4.showImage = [UIImage imageNamed:@"image_4"];
        info4.themeColor = [UIColor jk_colorWithHex:0x4A7A2E];
        
        ModelHomeToppingInfo *info5 = [[ModelHomeToppingInfo alloc] init];
        info5.jumpMode = HomeToppingJumpModeWeb;
        info5.jumpMine = @"https://www.baidu.com/";
        info5.showImage = [UIImage imageNamed:@"image_5"];
        info5.themeColor = [UIColor jk_colorWithHex:0xF1EDEF];
        
        self.dataList = [[NSMutableArray alloc] initWithObjects:info1, info2, info3, info4, info5, nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.headerView.dataList = self.dataList;
            self.homeNavView.backgroundColor = info1.themeColor;
            self.homeBackGroundView.backgroundColor = info1.themeColor;
//            self.homeHeader.turnOnTheCarousel = YES;
        });
    });
    
}


#pragma mark - getter
- (HomeNavView *)homeNavView{
    if (!_homeNavView) {
        _homeNavView = [[NSBundle mainBundle] loadNibNamed:HomeNavView.jk_className owner:self options:nil].lastObject;
        _homeNavView.frame = CGRectMake(0, 0, kScreenWidth, kNaviBarHeight);
    }
    return _homeNavView;
}

- (HomeHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[HomeHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, KHeaderViewHeight + kNaviBarHeight)];
        [self.view addSubview:_headerView];
    }
    return _headerView;
}

- (HomeBackGroundView *)homeBackGroundView{
    if (!_homeBackGroundView) {
        _homeBackGroundView = [[HomeBackGroundView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 98 + kNaviBarHeight)];
        [self.view addSubview:_homeBackGroundView];
    }
    return _homeBackGroundView;
}
@end
