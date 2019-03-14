//
//  HomeBackGroundView.m
//  XiMaLaYaNav
//
//  Created by 张得丑 on 2019/3/13.
//  Copyright © 2019 zhangdechou. All rights reserved.
//

#import "HomeBackGroundView.h"

@implementation HomeBackGroundView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.redColor;
        
        [self aaa];
    }
    return self;
}

- (void)aaa{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, self.jk_height - 40, kScreenWidth, 40)];
    UIImage *image = [UIImage imageNamed:@"shouye_bg"];
    imageView.image = image;
    [self addSubview:imageView];
}
@end
