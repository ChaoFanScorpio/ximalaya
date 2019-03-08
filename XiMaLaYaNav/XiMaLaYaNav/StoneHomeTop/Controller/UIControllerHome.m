//
//  UIControllerHome.m
//  XiMaLaYaNav
//
//  Created by 石显军 on 2019/3/7.
//  Copyright © 2019 zhangdechou. All rights reserved.
//

#import "UIControllerHome.h"
#import "UIViewHomeNav.h"
#import "UITableHeaderViewHome.h"
#import "ModelHomeToppingInfo.h"

@interface UIControllerHome ()<UITableViewDataSource>

@property (nonatomic, strong) UIView *topBackgroundView;

@property (nonatomic, strong) UIViewHomeNav *homeNav;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UITableHeaderViewHome *homeHeader;

@property (nonatomic, strong) NSMutableArray<ModelHomeToppingInfo *> *arrHeaderDatas;

@end

@implementation UIControllerHome

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializationData];
    
    [self initializationView];
    
    [self loadHeaderData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark - initialization

- (void)initializationData
{
    
}

- (void)initializationView
{
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self.view addSubview:self.topBackgroundView];
    [self.topBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(-100.f);
        make.height.mas_equalTo(500.f);
    }];
    
    [self.view addSubview:self.homeNav];
    [self.homeNav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo([UIApplication sharedApplication].statusBarFrame.size.height);
        make.height.mas_equalTo(44);
    }];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.homeNav.mas_bottom);
        make.left.right.bottom.mas_equalTo(self.view);
    }];
    
    UIView *headerBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    headerBackgroundView.backgroundColor = UIColor.clearColor;
    [headerBackgroundView addSubview:self.homeHeader];
    [self.homeHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(headerBackgroundView);
    }];
    self.tableView.tableHeaderView = headerBackgroundView;
    
    kWeakSelf(self);
    self.homeHeader.changeBackgroundColorCallback = ^(UITableHeaderViewHome * _Nonnull headerHome, UIColor * _Nonnull currColor) {
        weakself.topBackgroundView.backgroundColor = currColor;
    };
}

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
        
        self.arrHeaderDatas = [[NSMutableArray alloc] initWithObjects:info1, info2, info3, info4, info5, nil];
        
        dispatch_async(dispatch_get_main_queue(), ^{
           self.homeHeader.arrHeaderDatas = self.arrHeaderDatas;
        });
    });
    
}


#pragma mark - Setter & Getter
- (UIView *)topBackgroundView
{
    if (_topBackgroundView == nil) {
        _topBackgroundView = [[UIView alloc] init];
        _topBackgroundView.backgroundColor = [UIColor jk_colorWithHex:0x6E6D6D];
        
    }
    return _topBackgroundView;
}

- (UIViewHomeNav *)homeNav
{
    if (_homeNav == nil) {
        _homeNav = [[NSBundle mainBundle] loadNibNamed:UIViewHomeNav.jk_className owner:self options:nil].lastObject;
    }
    return _homeNav;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:UITableViewCell.jk_className];
        _tableView.rowHeight = 100;
        _tableView.backgroundColor = UIColor.clearColor;
    }
    
    return _tableView;
}

- (UITableHeaderViewHome *)homeHeader
{
    if (_homeHeader == nil) {
        _homeHeader = [[NSBundle mainBundle] loadNibNamed:UITableHeaderViewHome.jk_className owner:self options:nil].lastObject;
    }
    return _homeHeader;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCell.jk_className];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}

@end
