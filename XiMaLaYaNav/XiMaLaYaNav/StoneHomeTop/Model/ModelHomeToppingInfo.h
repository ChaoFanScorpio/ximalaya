//
//  ModelHomeToppingInfo.h
//  XiMaLaYaNav
//
//  Created by 石显军 on 2019/3/8.
//  Copyright © 2019 zhangdechou. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, HomeToppingJumpMode) {
    HomeToppingJumpModeWeb,
    HomeToppingJumpModeModule,
};

@interface ModelHomeToppingInfo : NSObject

@property (nonatomic, assign) HomeToppingJumpMode jumpMode;

@property (nonatomic, strong) NSString *jumpMine;
@property (nonatomic, strong) NSString *jumpModule;

@property (nonatomic, strong) UIImage *showImage;

@property (nonatomic, strong) UIColor *themeColor;

@end

NS_ASSUME_NONNULL_END
