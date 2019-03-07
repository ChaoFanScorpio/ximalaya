//
//  UIControllerHome.m
//  XiMaLaYaNav
//
//  Created by 石显军 on 2019/3/7.
//  Copyright © 2019 zhangdechou. All rights reserved.
//

#import "UIControllerHome.h"

@interface UIControllerHome ()

@property (nonatomic, strong) UIView *topBackgroundView;

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


@end
