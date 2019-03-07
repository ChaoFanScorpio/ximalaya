//
//  CycleScrollView.h
//  suishenbaodian
//
//  Created by 张得丑 on 2018/10/23.
//  Copyright © 2018年 MY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BannerModel.h"

@interface CycleScrollView : UIView

@property (nonatomic, strong) NSArray *imgArray;


@property (nonatomic, copy) void(^clickThePictureBlock)(BannerModel *banneModel);

@end
