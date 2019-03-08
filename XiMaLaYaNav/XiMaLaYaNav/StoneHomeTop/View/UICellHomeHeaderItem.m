//
//  UICellHomeHeaderItem.m
//  XiMaLaYaNav
//
//  Created by 石显军 on 2019/3/8.
//  Copyright © 2019 zhangdechou. All rights reserved.
//

#import "UICellHomeHeaderItem.h"

@implementation UICellHomeHeaderItem

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.imgContent.layer.masksToBounds = YES;
    self.imgContent.layer.cornerRadius = 4;
    // Initialization code
}

- (void)setToppingInfo:(ModelHomeToppingInfo *)toppingInfo
{
    if (_toppingInfo != toppingInfo) {
        _toppingInfo = toppingInfo;
    }
    
    self.imgContent.image = toppingInfo.showImage;
}

@end
