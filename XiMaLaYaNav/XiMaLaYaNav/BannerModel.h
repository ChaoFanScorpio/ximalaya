//
//  BannerModel.h
//  suishenbaodian
//
//  Created by 张超范 on 16/1/8.
//  Copyright © 2016年 MY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BannerModel : NSObject

@property (nonatomic, copy) NSString *whereBanner;

@property (nonatomic, strong)NSString *advcode;

@property (nonatomic, strong)NSString *advname;

@property (nonatomic, strong)NSString *desurl;

@property (nonatomic, strong)NSString *picurl;

@property (nonatomic, strong)NSString *isshow;

@property (nonatomic, strong)NSString *bannertype;

//@property (nonatomic, strong)NSString *mypointsurlNew;

/**
 *  打开资讯
 */
@property (nonatomic, strong)NSString *inforid;

/**
 *  资讯分享图片
 */
@property (nonatomic, strong) NSString *sharepic;

@property (nonatomic, strong) NSString *needlogin;

/**
 *  跳转所需参数
 */
@property (nonatomic, strong) NSString *value;

/**
 *  分享用的字段
 */
@property (nonatomic, strong) NSString *isShare;
@property (nonatomic, strong) NSString *sharevalue;

@property (nonatomic, copy) NSString *code;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *nodename;

@property (nonatomic, copy) NSString *nodepic;


/**
 是否显示红点
 */
@property (nonatomic, copy) NSString *shownewpoint;

/**
 团队名称
 */
@property (nonatomic, copy) NSString *teamname;

@property (nonatomic, copy) NSString *nodecolor;

@property (nonatomic, assign) BOOL isAdmin;

//@property (nonatomic, strong)NSString *titlepic;


/****************************  课程分类  *******************************/

@property (nonatomic, copy) NSString *activeid;

@property (nonatomic, copy) NSString *orderby;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *starttime;

@property (nonatomic, copy) NSString *endtime;

- (void)setDesurl:(NSString *)desurl jointUserid:(BOOL)jointUserid;

@end
