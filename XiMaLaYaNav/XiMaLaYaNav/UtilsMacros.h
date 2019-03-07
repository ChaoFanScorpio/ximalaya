//
//  UtilsMacros.h
//  suishenbaodian
//
//  Created by fire on 2017/7/6.
//  Copyright © 2017年 MY. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h

//获取系统对象
#define kApplication        [UIApplication sharedApplication]
#define kKeyWindow          [UIApplication sharedApplication].delegate.window
#define kAppDelegate        [AppDelegate shareAppDelegate]
#define kRootViewController [UIApplication sharedApplication].delegate.window.rootViewController
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

//判断设备类型
#define kDevice_Is_iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
//#define kDevice_Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kDevice_Is_iPhoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

//屏幕尺寸及适配
#define kPaddingLeftWidth   15.0
#define kHomeIndicatorHeight 34.f
#define kNaviBarHeight      (kDevice_Is_iPhoneX ? 88.f : 64.f)
#define kStatusBarHeight    (kDevice_Is_iPhoneX ? 44.f : 20.f)
#define kTabBarHeight       (kDevice_Is_iPhoneX ? 83.f : 49.f)
#define kScreen_Bounds      [UIScreen mainScreen].bounds
#define kScreenHeight       [UIScreen mainScreen].bounds.size.height
#define kScreenWidth        [UIScreen mainScreen].bounds.size.width
#define kAdaptScreen(size)  (kDevice_Is_iPhoneX ? size : ceilf(size / 667 * kScreenHeight))
#define kAdaptWidth(size)   ceilf(size / 375 * kScreenWidth)
#define CHINESE_SYSTEM(size) [UIFont systemFontOfSize:(size)]
#define kLineHeight         1.0f / [UIScreen mainScreen].scale

// 唯一识别码
#define kIdentifier [[UIDevice currentDevice].identifierForVendor UUIDString]
// 时间戳
#define kOptionTime [NSString stringWithFormat:@"%.0f", [[NSDate dateWithTimeIntervalSinceNow:0] timeIntervalSince1970] *1000]

// 当前系统版本
#define kVersion    [[UIDevice currentDevice].systemVersion floatValue]

//Debug输出
#define DebugLog(s, ...) NSLog(@"%s(%d): %@", __FUNCTION__, __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])

#define kTipAlert(_S_, ...)     [[[UIAlertView alloc] initWithTitle:@"提示" message:[NSString stringWithFormat:(_S_), ##__VA_ARGS__] delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil] show]

// 判断设备系统
#define  NLSystemVersionGreaterOrEqualThan(version) ([[[UIDevice currentDevice] systemVersion] floatValue] >= version)

//按钮高亮背景图
#define kHighlightedBG(button)  [button setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.2]] forState:UIControlStateHighlighted];

/** scrollView适配iOS11 */
#define  adjustsScrollViewInsets(scrollView)\
do {\
_Pragma("clang diagnostic push")\
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"")\
if ([scrollView respondsToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
    NSMethodSignature *signature = [UIScrollView instanceMethodSignatureForSelector:@selector(setContentInsetAdjustmentBehavior:)];\
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];\
    NSInteger argument = 2;\
    invocation.target = scrollView;\
    invocation.selector = @selector(setContentInsetAdjustmentBehavior:);\
    [invocation setArgument:&argument atIndex:2];\
    [invocation retainArguments];\
    [invocation invoke];\
}\
_Pragma("clang diagnostic pop")\
} while (0)

//GCD
#define kDISPATCH_ASYNC_BLOCK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define kDISPATCH_MAIN_BLOCK(block) dispatch_async(dispatch_get_main_queue(),block)
//GCD - 一次性执行
#define kDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);

//发送通知
#define KPostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];

//强弱引用
#define kWeakSelf(type)  __weak typeof(type) weak##type = type;
#define kStrongSelf(type) __strong typeof(type) type = weak##type;

#define ESWeak(var, weakVar) __weak __typeof(&*var) weakVar = var
#define ESStrong_DoNotCheckNil(weakVar, _var) __typeof(&*weakVar) _var = weakVar
#define ESStrong(weakVar, _var) ESStrong_DoNotCheckNil(weakVar, _var); if (!_var) return;

#define ESWeak_(var) ESWeak(var, weak_##var);
#define ESStrong_(var) ESStrong(weak_##var, _##var);

/** defines a weak `self` named `__weakSelf` */
#define ESWeakSelf      ESWeak(self, __weakSelf);
/** defines a strong `self` named `_self` from `__weakSelf` */
#define ESStrongSelf    ESStrong(__weakSelf, _self);

#endif /* UtilsMacros_h */
