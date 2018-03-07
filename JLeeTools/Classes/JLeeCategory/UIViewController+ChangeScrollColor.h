//
//  UIViewController+Tools.h
//  DemoForTest
//
//  Created by 李杰 on 2017/8/10.
//  Copyright © 2017年 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ColorBlock)(UIColor *color,CGFloat level);
@interface UIViewController (ChangeScrollColor)


/** navigationColor */
@property (nonatomic, strong) UIColor *baseNaviColor;
/** navigationColor */
@property (nonatomic, assign) BOOL hideNaviLine;

//透明渐变色
- (void)bindScrollView:(UIScrollView *)bindScrollView finalColor:(UIColor *)finalColor areaHeight:(CGFloat)areaHeight;
- (void)bindScrollView:(UIScrollView *)bindScrollView finalColor:(UIColor *)finalColor areaHeight:(CGFloat)areaHeight colorBlock:(ColorBlock)colorBlock;



@end
