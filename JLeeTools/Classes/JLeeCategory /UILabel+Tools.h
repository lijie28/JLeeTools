//
//  UILabel+Tools.h
//  cycj-shop
//
//  Created by 李杰 on 2017/6/15.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Tools)

/**
 改变行间距
 */
- (void)changeLineSpace:(CGFloat)space;


/**
 根据label宽度让label里的字自动调节成最大
 */
- (void)sizeFitFrameWidth;


/**
 暂时不清楚是干嘛的

 @return <#return value description#>
 */
- (NSUInteger )getActualLines;

/**
 带框框的改变文字颜色的UILable分类

 @param text text内容
 @param color 框框和text的颜色
 @param fontSize 字体大小
 @param frame frame
 @return 返回自己
 */
- (UILabel *)describeLabelWithText:(NSString *)text color:(UIColor *)color fontSize:(CGFloat)fontSize frame:(CGRect)frame;
@end
