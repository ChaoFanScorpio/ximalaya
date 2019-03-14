//
//  HomeHeaderView.m
//  XiMaLaYaNav
//
//  Created by 张得丑 on 2019/3/13.
//  Copyright © 2019 zhangdechou. All rights reserved.
//

#import "HomeHeaderView.h"
#import "SDCycleScrollView.h"
#import "ModelHomeToppingInfo.h"
#import "HeaderViewCell.h"

@interface HomeHeaderView ()<SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *scrollView;

@end


@implementation HomeHeaderView

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
    [self addSubview:self.scrollView];
    
    kWeakSelf(self)
    [RACObserve(self.scrollView, contentOffsetX) subscribeNext:^(id x) {
        kStrongSelf(self)
        NSLog(@"x = %@", x);
//        UIColor *currColor = [self getColorOfContentOffset:cycleScrollView.contentOffset.x];
    }];
}

- (void)setDataList:(NSMutableArray *)dataList{
    _dataList = dataList;
    NSMutableArray *array = [NSMutableArray array];
    for (ModelHomeToppingInfo *model in _dataList) {
        [array addObject:model.showImage];
    }
    self.scrollView.localizationImageNamesGroup = array;
}

#pragma mark - getter
- (SDCycleScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, 160) delegate:self placeholderImage:[UIImage imageNamed:@""]];
        _scrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _scrollView.backgroundColor = UIColor.clearColor;
        _scrollView.autoScrollTimeInterval = 5;
        _scrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
        _scrollView.pageDotImage = [UIImage imageNamed:@"home_banner_dian_nor"];
        _scrollView.currentPageDotImage = [UIImage imageNamed:@"home_banner_dian_sel"];
    }
    return _scrollView;
}

- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view{
    return [HeaderViewCell class];
}

- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view{
    HeaderViewCell *newCell = (HeaderViewCell *)cell;
    [newCell.imgView setImage:self.scrollView.localizationImageNamesGroup[index]];
}


- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
//    UIColor *currColor = [self getColorOfContentOffset:cycleScrollView.contentOffset.x];
//
//    if (currColor && self.changeBackgroundColorCallback) {
//        self.changeBackgroundColorCallback(self, currColor);
//    }
}


- (UIColor *)getColorOfContentOffset:(CGFloat)offset;
{
    NSInteger leftIndex = (offset) / self.jk_width;
    NSInteger rightIndex = leftIndex + 1;
    
    CGFloat offsetX = offset - self.jk_width * leftIndex;
    double offsetXProportion = offsetX / self.jk_width;
    
    if (leftIndex < 0 || leftIndex >= self.dataList.count) {
        return nil;
    }
    
    if (rightIndex < 0 || rightIndex >= self.dataList.count) {
        return nil;
    }
    
    ModelHomeToppingInfo *leftInof = self.dataList[leftIndex];
    ModelHomeToppingInfo *rightInof = self.dataList[rightIndex];
    
    double leftRed = [self redValueWithColor:leftInof.themeColor];
    double rithtRed = [self redValueWithColor:rightInof.themeColor];
    double red = (rithtRed - leftRed) * offsetXProportion + leftRed;
    
    double leftGreen = [self greenValueWithColor:leftInof.themeColor];
    double rithtGreen = [self greenValueWithColor:rightInof.themeColor];
    double green = (rithtGreen - leftGreen) * offsetXProportion + leftGreen;
    
    double leftBlue = [self blueValueWithColor:leftInof.themeColor];
    double rithtBlue = [self blueValueWithColor:rightInof.themeColor];
    double blue = (rithtBlue - leftBlue) * offsetXProportion + leftBlue;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

- (double)redValueWithColor:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    return components[0];
}

- (double)greenValueWithColor:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    return components[1];
}

- (double)blueValueWithColor:(UIColor *)color
{
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    return components[2];
}

@end
