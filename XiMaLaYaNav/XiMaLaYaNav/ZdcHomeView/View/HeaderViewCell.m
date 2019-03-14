//
//  HeaderViewCell.m
//  XiMaLaYaNav
//
//  Created by 张得丑 on 2019/3/13.
//  Copyright © 2019 zhangdechou. All rights reserved.
//

#import "HeaderViewCell.h"

@implementation HeaderViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imgView = [[UIImageView alloc] initWithFrame:CGRectMake(12.5, 5, kScreenWidth - 12.5 * 2, 150)];
        [self addSubview:self.imgView];
    }
    return self;
}
@end
