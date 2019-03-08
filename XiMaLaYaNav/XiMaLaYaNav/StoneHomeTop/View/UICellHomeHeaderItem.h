//
//  UICellHomeHeaderItem.h
//  XiMaLaYaNav
//
//  Created by 石显军 on 2019/3/8.
//  Copyright © 2019 zhangdechou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModelHomeToppingInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface UICellHomeHeaderItem : UICollectionViewCell

@property (nonatomic, strong) ModelHomeToppingInfo *toppingInfo;

@property (weak, nonatomic) IBOutlet UIImageView *imgContent;

@end

NS_ASSUME_NONNULL_END
