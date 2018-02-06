//
//  UIViewController+JLeeTools.m
//  cycj-shop
//
//  Created by 李杰 on 2017/6/16.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import "UIViewController+JLeeTools.h"

@implementation UIViewController (JLeeTools)

#pragma mark - 私有方法

- (void)noticeWithTextField:(NSString *)strNotice alertBlock:(void (^)(NSString *strText))alertBlock
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:strNotice preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        LOG_DEBUG(@"点击取消");
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *tf = alertController.textFields[0];
//        LOG_DEBUG(@"点击确认,%@",tf.text);
        if (alertBlock) {
            alertBlock(tf.text);
        }

        
    }]];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        // 可以在这里对textfield进行定制
    }];
    
    // 由于它是一个控制器 直接modal出来就好了
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)noticeAgain:(NSString *)strNotice
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:strNotice preferredStyle:UIAlertControllerStyleAlert];
    

    
    [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
//        LOG_DEBUG(@"点击确认");
        
    }]];
    
    
    // 由于它是一个控制器 直接modal出来就好了
    [self presentViewController:alertController animated:YES completion:nil];
}








- (void)noticeAgain:(NSString *)strNotice title:(NSString *)title
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:strNotice preferredStyle:UIAlertControllerStyleAlert];
    
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
//        LOG_DEBUG(@"点击确认");
        
    }]];
    
    
    // 由于它是一个控制器 直接modal出来就好了
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void)noticeAgain:(NSString *)strNotice alertBlock:(void (^)())alertBlock
{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:strNotice preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
//        LOG_DEBUG(@"点击取消");
        
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
//        LOG_DEBUG(@"点击确认");
        if (alertBlock) alertBlock();
        
    }]];
    
    
    // 由于它是一个控制器 直接modal出来就好了
    [self presentViewController:alertController animated:YES completion:nil];
    
}


@end
