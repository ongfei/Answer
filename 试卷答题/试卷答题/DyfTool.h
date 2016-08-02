//
//  DyfTool.h
//  MyTool
//
//  Created by df on 16/6/12.
//  Copyright © 2016年 Dyf. All rights reserved.
//


#ifndef DyfTool_h
#define DyfTool_h

#import "UILabel+DyfAdd.h"
#import "UIView+DyfAdd.h"

#endif /* DyfTool_h */
//日志输出
#ifdef DEBUG
#define DLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define DLog(format, ...)
#endif
//详细日志输出
#ifdef DEBUG
# define DDLog(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define DDLog(...);
#endif

// 屏幕宽高
#define ScreenWidth ([[UIScreen mainScreen] bounds].size.width)
#define ScreenHeight ([[UIScreen mainScreen] bounds].size.height)

// 设置颜色值
#define RgbColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

// RGB色值
#define COLOR_RGB(rgbValue) [UIColor colorWith\
Red     :(rgbValue & 0xFF0000)     / (float)0xFF0000 \
green   :(rgbValue & 0xFF00)       / (float)0xFF00 \
blue    :(rgbValue & 0xFF)         / (float)0xFF \
alpha   :1.0]

// 字体设置
#define FontBold(x)     [UIFont boldSystemFontOfSize:x]
#define FontSystem(x)   [UIFont systemFontOfSize:x]

#define LabelBgColor [UIColor colorWithRed:0.88 green:0.88 blue:0.88 alpha:1.0];


#import <MJExtension/MJExtension.h>





