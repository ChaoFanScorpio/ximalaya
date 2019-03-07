//
//  FontAndColorMacros.h
//  suishenbaodian
//
//  Created by fire on 2017/7/6.
//  Copyright © 2017年 MY. All rights reserved.
//

#ifndef FontAndColorMacros_h
#define FontAndColorMacros_h

#define kColorWithRGB(r, g, b)  [UIColor colorWithRed:(r) / 255.f green:(g) / 255.f blue:(b) / 255.f alpha:1.f]

#define kNaviTitleColor     kColorWithRGB(91, 82, 181)      //导航字体颜色
#define kSectionIndexColor  kColorWithRGB(82, 69, 208)      //索引字体颜色
#define kTextColor          kColorWithRGB(51, 51, 51)       //文字颜色
#define kLigthTextColor     kColorWithRGB(153, 153, 153)    //浅灰色文字颜色
#define kTextColor_69       kColorWithRGB(69, 69, 69)
#define kTextColor_102      kColorWithRGB(102, 102, 102)
#define kTextColor_136      kColorWithRGB(136, 136, 136)
#define kBoderColor         kColorWithRGB(218, 218, 218)
#define kTextRedColor       kColorWithRGB(248, 64, 64)
//视图背景颜色
#define kBackgroundColor    kColorWithRGB(242, 242, 242)
#define kRedBackgroundColor kColorWithRGB(255, 105, 105)
//tableView背景颜色
#define kTableViewColor     kColorWithRGB(248, 248, 248)
#define kImageViewColor     kColorWithRGB(238, 238, 238)
#define kImageBorderColor   kColorWithRGB(237, 237, 237)
//tableview分割线颜色
#define kTableViewSepColor  kColorWithRGB(214, 214, 218)
#define kBlueBarColor       kColorWithRGB(115, 101, 240)
#define kLineBackColor      kColorWithRGB(230, 230, 230)
//按钮紫色背景图
#define kPurpleBackColor    kColorWithRGB(115, 97, 237)
//遮盖视图颜色
#define kMaskColor          [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]

//富文本链接颜色
#define kLinkAttributes         @{(__bridge NSString *)kCTUnderlineStyleAttributeName : [NSNumber numberWithBool:NO],(NSString *)kCTForegroundColorAttributeName : (__bridge id)kColorWithRGB(64, 147, 198).CGColor}
#define kLinkAttributesActive   @{(NSString *)kCTUnderlineStyleAttributeName : [NSNumber numberWithBool:NO],(NSString *)kCTForegroundColorAttributeName : (__bridge id)[kColorWithRGB(64, 147, 198) CGColor]}

//字体
#define kAdaptFontSize(R)   CHINESE_SYSTEM(kAdaptWidth(R))
//字体
#define BOLDSYSTEMFONT(FONTSIZE)    [UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)        [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)        [UIFont fontWithName:(NAME) size:(FONTSIZE)]

#endif /* FontAndColorMacros_h */
