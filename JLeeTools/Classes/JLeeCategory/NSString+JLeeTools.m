//
//  NSString+JLeeTools.m
//  cycj-shop
//
//  Created by 李杰 on 2017/4/17.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import "NSString+JLeeTools.h"

@implementation NSString (JLeeTools)


//计算字体数字
- (NSUInteger)countNumOfFonts
{
    NSUInteger length = [self length];
    
    return length;
}



- (NSAttributedString *)priceWithsize:(CGFloat)size
{
    
    NSString *oldPrice = self;
    NSUInteger length = [oldPrice length];
    NSString *showPrice = [NSString stringWithFormat:@"¥%@",oldPrice] ;
    
    NSMutableAttributedString *attGoodsPrice = [[NSMutableAttributedString alloc]initWithString:showPrice ];
    
    [attGoodsPrice addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:(size - 2)] range:NSMakeRange( 0, 1 )];
    
    [attGoodsPrice addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:size] range:NSMakeRange( 1, length )];
    
    return attGoodsPrice;
}


- (NSAttributedString *)priceWithFontSize:(CGFloat)fontSize symbolSize:(CGFloat)symbolSize
{
    
    NSString *oldPrice = self;
    NSUInteger length = [oldPrice length];
    NSString *showPrice = [NSString stringWithFormat:@"¥%@",oldPrice] ;
    
    NSMutableAttributedString *attGoodsPrice = [[NSMutableAttributedString alloc]initWithString:showPrice ];
    
    [attGoodsPrice addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:(symbolSize)] range:NSMakeRange( 0, 1 )];
    
    [attGoodsPrice addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:NSMakeRange( 1, length )];
    
    return attGoodsPrice;
}


- (NSAttributedString *)oldPriceWithSize:(CGFloat)size
{
    NSString *oldPrice = self;
    NSUInteger length = [oldPrice length];
    NSString *showPrice = [NSString stringWithFormat:@"¥%@",oldPrice] ;
    
    NSMutableAttributedString *goodsMarketPrice = [[NSMutableAttributedString alloc]initWithString:showPrice ];
    
    //¥字体大小
    [goodsMarketPrice addAttribute:NSFontAttributeName
                             value:[UIFont systemFontOfSize:(size - 2)]
                             range:NSMakeRange(0, 1 )];
    
    //删除价格字体大小
    [goodsMarketPrice addAttribute:NSFontAttributeName
                             value:[UIFont systemFontOfSize:(size )]
                             range:NSMakeRange(1, length )];
    //删除线
    [goodsMarketPrice addAttribute:NSStrikethroughStyleAttributeName
                             value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle)
                             range:NSMakeRange(1, length )];
    
    //10.3系统要加以下
    //删除线
    [goodsMarketPrice addAttribute:NSBaselineOffsetAttributeName
                             value:@(0)
                             range:NSMakeRange(1, length )];
    
    
    
    
    return goodsMarketPrice;

}


- (BOOL)hasValue
{
    if (self == nil) return NO;
    if ([self isEqualToString:@""]) return NO;
    return YES;
}



- (CGFloat)stringHeightWithSize:(CGFloat)fontSize
{
    CGSize size =[self sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
    return size.height;
}


- (CGFloat)stringWidthWithSize:(CGFloat)fontSize
{
    CGSize size =[self sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}];
    return size.width;
}

//判断是否为浮点形：
- (BOOL)isPureFloat
{
    NSScanner *scan = [NSScanner scannerWithString:self];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}


//判断是否为整形：
- (BOOL)isPureInt
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}


//验证金额的方法如下：
-(BOOL)validateMoney
{
    NSString *phoneRegex = @"^[0-9]+(\\.[0-9]{1,2})?$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}



//拼接不同颜色 字符串
- (NSAttributedString *)appendString:(NSString *)appendString otherColor:(UIColor *)otherColor
{
    if ([appendString hasValue]) {
        NSUInteger selfCount = [self length];
        NSUInteger appendCount = [appendString length];
        NSString *totalStr = [self stringByAppendingString:appendString];
        NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:totalStr ];
        [attString addAttribute:NSForegroundColorAttributeName value:otherColor range:NSMakeRange(selfCount, appendCount )];
        
        return attString;
    }else{
        return nil;
    }
    
}


//时间戳转时间str
- (NSString *)timeStampWithformat:(NSString *)format
{
    
    if (![format hasValue]) format = @"yyyy-MM-dd HH:mm:ss";
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[self doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}



- (NSString *)getWeekDayForDate
{
    NSArray *weekday = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSDate *newDate = [NSDate dateWithTimeIntervalSince1970:[self doubleValue]];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSURLGenerationIdentifierKey];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:newDate];
    
    NSString *weekStr = [weekday objectAtIndex:components.weekday];
    return weekStr;
}

- (NSString *)strmethodComma
{
    
    NSString *intStr;
    
    NSString *floStr;
    
    if ([self containsString:@"."]) {
        
        NSRange range = [self rangeOfString:@"."];
        
        floStr = [self substringFromIndex:range.location];
        
        intStr = [self substringToIndex:range.location];
        
    }else{
        
        floStr = @"";
        
        intStr = self;
        
    }
    
    if (intStr.length <=3) {
        
        return [intStr stringByAppendingString:floStr];
        
    }else{
        
        NSInteger length = intStr.length;
        
        NSInteger count = length/3;
        
        NSInteger y = length%3;
        
        
        NSString *tit = [intStr substringToIndex:y] ;
        
        NSMutableString *det = [[intStr substringFromIndex:y] mutableCopy];
        
        
        for (int i =0; i < count; i ++) {
            
            NSInteger index = i + i *3;
            
            [det insertString:@","atIndex:index];
            
        }
        
        if (y ==0) {
            
            det = [[det substringFromIndex:1]mutableCopy];
            
        }
        
        intStr = [tit stringByAppendingString:det];
        
        return [intStr stringByAppendingString:floStr];
        
    }
}

@end
