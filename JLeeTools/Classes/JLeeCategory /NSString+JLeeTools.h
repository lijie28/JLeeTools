//
//  NSString+JLeeTools.h
//  cycj-shop
//
//  Created by 李杰 on 2017/4/17.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JLeeTools)

//价格nsstring
- (NSAttributedString *)priceWithsize:(CGFloat)size;
- (NSAttributedString *)priceWithFontSize:(CGFloat)fontSize symbolSize:(CGFloat)symbolSize;
//价格nsstring加删格线
- (NSAttributedString *)oldPriceWithSize:(CGFloat)size;
- (BOOL)hasValue;
//计算字体高度
- (CGFloat)stringHeightWithSize:(CGFloat)fontSize;
//计算字体宽度
- (CGFloat)stringWidthWithSize:(CGFloat)fontSize;
////计算字体数字
//- (NSUInteger)countNumOfFonts;
//判断是否为浮点形：
- (BOOL)isPureFloat;
//判断是否为整形：
- (BOOL)isPureInt;
//验证金额的方法如下：
-(BOOL)validateMoney;
//拼接不同颜色 字符串
- (NSAttributedString *)appendString:(NSString *)appendString otherColor:(UIColor *)otherColor;
//时间戳转时间str
- (NSString *)timeStampWithformat:(NSString *)format;
- (NSString *)getWeekDayForDate;
- (NSString *)strmethodComma;

@end
