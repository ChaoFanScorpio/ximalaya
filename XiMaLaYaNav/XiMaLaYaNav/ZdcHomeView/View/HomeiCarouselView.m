//
//  HomeiCarouselView.m
//  XiMaLaYaNav
//
//  Created by 张得丑 on 2019/3/14.
//  Copyright © 2019 zhangdechou. All rights reserved.
//

#import "HomeiCarouselView.h"
#import <iCarousel/iCarousel.h>

@interface HomeiCarouselView ()<iCarouselDelegate, iCarouselDataSource>

@property (nonatomic, strong) iCarousel *carouselView;

@end

@implementation HomeiCarouselView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        
        [self initialSubView];
    }
    return self;
}

#pragma mark - initialSubView
- (void)initialSubView{
    
}

- (void)setDataList:(NSMutableArray *)dataList{
    _dataList = dataList;
    
}

#pragma mark - getter
- (iCarousel *)carouselView {
    if (!_carouselView) {
        _carouselView = [[iCarousel alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 160)];
        _carouselView.dataSource = self;
        _carouselView.delegate = self;
        _carouselView.bounces = NO;
        _carouselView.pagingEnabled = YES;
        _carouselView.type = iCarouselTypeCustom;
    }
    return _carouselView;
}

@end
