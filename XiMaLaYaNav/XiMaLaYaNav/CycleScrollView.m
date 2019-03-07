//
//  CycleScrollView.m
//  suishenbaodian
//
//  Created by 张得丑 on 2018/10/23.
//  Copyright © 2018年 MY. All rights reserved.
//

#import "CycleScrollView.h"
#import "SDCycleScrollView.h"

@interface CycleScrollView () <SDCycleScrollViewDelegate>

@property (nonatomic, strong)SDCycleScrollView *imageViewDisplay;

@property (nonatomic, strong) NSMutableArray *imageUrlArray;


@end

@implementation CycleScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatSubViews];
    }
    return self;
}

- (NSMutableArray *)imageUrlArray{
    if (!_imageUrlArray) {
        _imageUrlArray = NSMutableArray.array;
    }
    return _imageUrlArray;
}

- (void)setImgArray:(NSArray *)imgArray{
    _imgArray = imgArray;
    
    if (self.imageUrlArray.count) {
        [self.imageUrlArray removeAllObjects];
    }
    for (BannerModel *model in _imgArray) {
        if (model.picurl.length) {
            [self.imageUrlArray addObject:model.picurl];
        }
    }
    
    _imageViewDisplay.imageURLStringsGroup = self.imageUrlArray;
}

- (void)creatSubViews
{
    // 滚动banner
    self.imageViewDisplay = [SDCycleScrollView cycleScrollViewWithFrame:self.bounds delegate:self placeholderImage:[UIImage imageNamed:@"home_banner_default"]];
    self.imageViewDisplay.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.imageViewDisplay.backgroundColor = UIColor.whiteColor;
    self.imageViewDisplay.autoScrollTimeInterval = 5;
    self.imageViewDisplay.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    self.imageViewDisplay.pageDotImage = [UIImage imageNamed:@"home_banner_dian_nor"];
    self.imageViewDisplay.currentPageDotImage = [UIImage imageNamed:@"home_banner_dian_sel"];
    [self addSubview:_imageViewDisplay];
}


- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    BannerModel *mdeol = self.imgArray[index];

    [self clickBannerWithBannerModel:mdeol];
}

- (void)clickBannerWithBannerModel:(BannerModel *)model{
    if (self.clickThePictureBlock) {
        self.clickThePictureBlock(model);
    }
}


@end
