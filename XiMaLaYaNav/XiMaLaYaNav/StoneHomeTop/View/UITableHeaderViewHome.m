//
//  UITableHeaderViewHome.m
//  XiMaLaYaNav
//
//  Created by 石显军 on 2019/3/8.
//  Copyright © 2019 zhangdechou. All rights reserved.
//

#import "UITableHeaderViewHome.h"
#import "UICellHomeHeaderItem.h"

#define kIntervalNumber (3)

@interface UITableHeaderViewHome ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation UITableHeaderViewHome

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self initializationData];
    [self initializationView];
}

- (void)initializationData
{
    
}

- (void)initializationView
{
    [self.collectionView registerNib:UICellHomeHeaderItem.jk_loadNib
          forCellWithReuseIdentifier:UICellHomeHeaderItem.jk_className];
}

- (UIColor *)getColorOfContentOffset
{
    NSInteger leftIndex = (self.collectionView.contentOffset.x) / self.jk_width;
    NSInteger rightIndex = leftIndex + 1;
    
    CGFloat offsetX = self.collectionView.contentOffset.x - self.jk_width * leftIndex;
    double offsetXProportion = offsetX / self.jk_width;
    
    if (leftIndex < 0 || leftIndex >= self.arrHeaderDatas.count) {
        return nil;
    }
    
    if (rightIndex < 0 || rightIndex >= self.arrHeaderDatas.count) {
        return nil;
    }
    
    ModelHomeToppingInfo *leftInof = self.arrHeaderDatas[leftIndex];
    ModelHomeToppingInfo *rightInof = self.arrHeaderDatas[rightIndex];
    
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

#pragma mark - Getter & Setter
- (void)setArrHeaderDatas:(NSMutableArray<ModelHomeToppingInfo *> *)arrHeaderDatas
{
    if (_arrHeaderDatas != arrHeaderDatas) {
        _arrHeaderDatas = arrHeaderDatas;
    }
    
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.arrHeaderDatas.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICellHomeHeaderItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:UICellHomeHeaderItem.jk_className forIndexPath:indexPath];
    cell.toppingInfo = self.arrHeaderDatas[indexPath.row];
    return cell;
}

int numberOfTriggers = 0;

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    numberOfTriggers++;
    
    if (numberOfTriggers % kIntervalNumber != 0) {
        return;
    }
    
    if (numberOfTriggers >= 10000) {
        numberOfTriggers = 0;
    }
    
    UIColor *currColor = [self getColorOfContentOffset];
    
    if (currColor && self.changeBackgroundColorCallback) {
        self.changeBackgroundColorCallback(self, currColor);
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.jk_size;
}

@end
