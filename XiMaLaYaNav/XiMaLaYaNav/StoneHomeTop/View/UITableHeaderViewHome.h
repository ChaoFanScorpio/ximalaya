//
//  UITableHeaderViewHome.h
//  XiMaLaYaNav
//
//  Created by 石显军 on 2019/3/8.
//  Copyright © 2019 zhangdechou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelHomeToppingInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITableHeaderViewHome : UIView

/**
 开启轮播
 */
@property (nonatomic, assign) BOOL turnOnTheCarousel;

@property (nonatomic, strong) NSMutableArray<ModelHomeToppingInfo *> *arrHeaderDatas;

@property (nonatomic, copy) void (^ changeBackgroundColorCallback)(UITableHeaderViewHome *headerHome, UIColor *currColor);

@end

NS_ASSUME_NONNULL_END
