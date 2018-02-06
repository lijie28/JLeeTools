//
//  UIViewController+JLeeTools.h
//  cycj-shop
//
//  Created by 李杰 on 2017/6/16.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (JLeeTools)

- (void)noticeWithTextField:(NSString *)strNotice alertBlock:(void (^)(NSString *strText))alertBlock;

- (void)noticeAgain:(NSString *)strNotice alertBlock:(void (^)())alertBlock;

- (void)noticeAgain:(NSString *)strNotice;

- (void)noticeAgain:(NSString *)strNotice title:(NSString *)title;
@end
