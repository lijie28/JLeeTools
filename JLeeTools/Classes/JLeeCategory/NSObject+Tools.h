//
//  NSObject+Tools.h
//  cycj-shop
//
//  Created by 李杰 on 2017/2/8.
//  Copyright © 2017年 李杰. All rights reserved.
//


//@end
#import <Foundation/Foundation.h>

@interface NSObject (Tools)


//UIColor 转UIImage
- (UIImage *)createImageWithColor: (UIColor*) color;

- (NSAttributedString *)dealWithPrice:(NSString *)price size:(CGFloat)size;

- (NSString *)iphoneType;

//将图片转成二进制文件 并获取对应名字
- (NSArray<UIImage *> *)getImages:(NSArray<UIImage *> *)images Detail:(void(^)(NSArray *arrImgName,NSArray *arrImgData))block;

//获取json文件数据
- (id)getJson:(NSString *)jsonName;


- (NSString *)timeWithTimeStamp:(NSString *)timeStamp format:(NSString *)format;


- (NSString *)getNowTimeStamp;

- (NSData *)toJSONData:(id)theData;
- (NSString *)toJSONString:(id)theData;
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
@end
