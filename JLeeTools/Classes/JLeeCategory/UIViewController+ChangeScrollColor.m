//
//  UIViewController+Tools.m
//  DemoForTest
//
//  Created by 李杰 on 2017/8/10.
//  Copyright © 2017年 Jack. All rights reserved.
//

#import "UIViewController+ChangeScrollColor.h"
#import <objc/runtime.h>

@interface UIViewController ()<UIScrollViewDelegate>


/** 要渐变的滚动视图 */
@property (nonatomic, strong) UIScrollView *inUseScrollView;
/** 要渐变的视图 */
@property (nonatomic, strong) UIView *inUseView;
/** 初始颜色 */
@property (nonatomic, strong) UIColor *originColor;
/** 最终颜色 */
@property (nonatomic, strong) UIColor *finalColor;
/** 渐变的区域高度 */
@property (nonatomic, assign) CGFloat colorHeightInScrollArea;
/** 颜色block */
@property (nonatomic, copy) ColorBlock colorBlock;
@end


@implementation UIViewController (ChangeScrollColor)

#define kColor(R,G,B,A) [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]
static const void * inUseScrollViewKey = @"inUseScrollViewKey";
static const void * inUseViewKey = @"inUseViewKey";
static const void * originColorKey = @"originColorKey";
static const void * finalColorKey = @"finalColorKey";
static const void * colorHeightInScrollAreaKey = @"colorHeightInScrollAreaKey";
static const void * colorBlockKey = @"colorBlockKey";


static const void * baseNaviColorKey = @"baseNaviColorKey";
static const void * hideNaviLineKey = @"hideNaviLineKey";




- (BOOL)hideNaviLine
{
    
    return [objc_getAssociatedObject(self, hideNaviLineKey) boolValue];
    
}

- (void)setHideNaviLine:(BOOL)hideNaviLine
{
    objc_setAssociatedObject(self, hideNaviLineKey, [NSNumber numberWithBool:hideNaviLine] , OBJC_ASSOCIATION_ASSIGN);
    if (hideNaviLine == YES) {
        
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    }else{
        
        [self.navigationController.navigationBar setShadowImage:nil];
    }
}




- (UIColor *)baseNaviColor
{
    
    return objc_getAssociatedObject(self, baseNaviColorKey);
}

- (void)setBaseNaviColor:(UIColor *)baseNaviColor
{
    objc_setAssociatedObject(self, baseNaviColorKey,baseNaviColor,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self.navigationController.navigationBar setBackgroundImage:
     [self createImageWithColor:baseNaviColor] forBarMetrics:UIBarMetricsDefault];
    self.hideNaviLine = YES;
    
}





- (ColorBlock)colorBlock
{
    return objc_getAssociatedObject(self, colorBlockKey);
}

- (void)setColorBlock:(ColorBlock)colorBlock
{
    objc_setAssociatedObject(self, colorBlockKey, colorBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}



- (CGFloat)colorHeightInScrollArea {
    return [objc_getAssociatedObject(self, colorHeightInScrollAreaKey) floatValue];
}

- (void)setColorHeightInScrollArea:(CGFloat)colorHeightInScrollArea
{
    objc_setAssociatedObject(self, colorHeightInScrollAreaKey, [NSNumber numberWithFloat:colorHeightInScrollArea] , OBJC_ASSOCIATION_COPY_NONATOMIC);
}


// 给scv属性提供getter和setter方法
- (UIScrollView *)inUseScrollView{
    return objc_getAssociatedObject(self, inUseScrollViewKey);
}

- (void)setInUseScrollView:(UIScrollView *)inUseScrollView
{
   objc_setAssociatedObject(self, inUseScrollViewKey, inUseScrollView,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.inUseScrollView.delegate = self;
    
}


- (UIView *)inUseView
{
    return objc_getAssociatedObject(self, &inUseViewKey);
}

- (void)setInUseView:(UIView *)inUseView
{
    objc_setAssociatedObject(self, &inUseViewKey,inUseView,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}



- (UIColor *)originColor
{
    return objc_getAssociatedObject(self, originColorKey);
}

- (void)setOriginColor:(UIColor *)originColor
{
    objc_setAssociatedObject(self, originColorKey,originColor,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)finalColor
{
    return objc_getAssociatedObject(self, finalColorKey);
}

- (void)setFinalColor:(UIColor *)finalColor
{
    objc_setAssociatedObject(self, finalColorKey,finalColor,OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


#pragma mark - void

- (void)bindScrollView:(UIScrollView *)bindScrollView finalColor:(UIColor *)finalColor areaHeight:(CGFloat)areaHeight
{
    [self.navigationController.navigationBar setBackgroundImage:
     [self createImageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
//    self.navigationController.navigationBar.backgroundColor = kColor(0, 0, 0, 0);
    
    self.inUseScrollView = bindScrollView;
    self.originColor = [UIColor clearColor];
    self.finalColor = finalColor;
    self.colorHeightInScrollArea = areaHeight;
    __weak typeof (self) weakSelf = self;
    self.colorBlock = ^(UIColor *color, CGFloat level){
        [weakSelf.navigationController.navigationBar setBackgroundImage:
         [weakSelf createImageWithColor:color] forBarMetrics:UIBarMetricsDefault];
    };
    
}

- (void)bindScrollView:(UIScrollView *)bindScrollView finalColor:(UIColor *)finalColor areaHeight:(CGFloat)areaHeight colorBlock:(ColorBlock)colorBlock
{
    [self.navigationController.navigationBar setBackgroundImage:
     [self createImageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
//    self.navigationController.navigationBar.backgroundColor = kColor(0, 0, 0, 0);
    
    self.inUseScrollView = bindScrollView;
    self.originColor = [UIColor clearColor];
    self.finalColor = finalColor;
    self.colorHeightInScrollArea = areaHeight;
    __weak typeof (self) weakSelf = self;
    self.colorBlock = ^(UIColor *color, CGFloat level){
        [weakSelf.navigationController.navigationBar setBackgroundImage:
         [weakSelf createImageWithColor:color] forBarMetrics:UIBarMetricsDefault];
        colorBlock(color,level);
    };
}




#pragma mark - 私有方法
- (UIImage *) createImageWithColor: (UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


- (NSDictionary *)getRGBDictionaryByColor:(UIColor *)originColor
{
    CGFloat r=0,g=0,b=0,a=0;
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [originColor getRed:&r green:&g blue:&b alpha:&a];
    }
    else {
        const CGFloat *components = CGColorGetComponents(originColor.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    
    return @{@"R":@(r),
             @"G":@(g),
             @"B":@(b),
             @"A":@(a)};
}

- (void)dealWithScrollView:(UIScrollView *)scrollView
{
    
    if (self.inUseScrollView == nil) return;
    if (self.finalColor == nil) return;
    if (self.originColor == nil) [self setOriginColor: kColor(0, 0, 0, 0)];
    
    CGFloat newContentOffsetY = scrollView.contentOffset.y;
    if (self.automaticallyAdjustsScrollViewInsets == YES) {
        newContentOffsetY = newContentOffsetY +64;
    }
    
    UIColor *color ;
    CGFloat level = 0;
    if (newContentOffsetY <= 0 ) {
        color = self.originColor;
        level = 0;
    }else if (newContentOffsetY > self.colorHeightInScrollArea ){
        color = self.finalColor;
        level = 1;
    }else{
        level = newContentOffsetY/self.colorHeightInScrollArea;
        
        NSDictionary *dicCoLorFn = [self getRGBDictionaryByColor:self.finalColor];
        
        
        CGFloat R = [dicCoLorFn[@"R"]floatValue] ;
        CGFloat G = [dicCoLorFn[@"G"]floatValue] ;
        CGFloat B = [dicCoLorFn[@"B"]floatValue] ;
        
        color = [UIColor colorWithRed:R green:G blue:B alpha:level];
    }
    
    
    if (self.colorBlock) {
        self.colorBlock(color,level);
    }
    
    if (self.inUseView) self.inUseView.backgroundColor = color;
    
    
//    LOG_DEBUG(@" 变化程度：%f ",level);
//    NSLog(@"y点：%f",newContentOffsetY);
    

}

#pragma mark - scollerView 代理事件


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self dealWithScrollView:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    [self dealWithScrollView:scrollView];
}



@end
