//
//  UIControllerHome.m
//  XiMaLaYaNav
//
//  Created by 石显军 on 2019/3/7.
//  Copyright © 2019 zhangdechou. All rights reserved.
//

#import "UIControllerHome.h"
#import "UIViewHomeNav.h"

@interface UIControllerHome ()<UITableViewDataSource>

@property (nonatomic, strong) UIView *topBackgroundView;

@property (nonatomic, strong) UIViewHomeNav *homeNav;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation UIControllerHome

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializationData];
    
    [self initializationView];
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
    }
    
    return _tableView;
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
