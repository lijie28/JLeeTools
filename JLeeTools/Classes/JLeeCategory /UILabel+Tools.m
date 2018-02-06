//
//  UILabel+Tools.m
//  cycj-shop
//
//  Created by 李杰 on 2017/6/15.
//  Copyright © 2017年 李杰. All rights reserved.
//

#import "UILabel+Tools.h"
#import <CoreText/CoreText.h>

@implementation UILabel (Tools)

- (UILabel *)describeLabelWithText:(NSString *)text color:(UIColor *)color fontSize:(CGFloat)fontSize frame:(CGRect)frame
{
    CGFloat rate = fontSize/15;
    self.frame = frame;
    self.text = text ;
    self.textColor = color;
    self.font = [UIFont systemFontOfSize:fontSize];
    self.textAlignment = NSTextAlignmentCenter;
    [self sizeToFit];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width +5, self.frame.size.height +5);
    
    [[self layer] setCornerRadius:3];
    [[self layer] setBorderWidth:1*rate];
    [[self layer] setBorderColor:color.CGColor];
    
    return self;
}

- (void)sizeFitFrameWidth
{
    NSUInteger textLength = [self.text length];
    CGFloat fontSize = self.frame.size.width;

    while (textLength*fontSize > self.frame.size.width) {
        fontSize = fontSize -1;
//        break;
    }
    
    self.font = [UIFont systemFontOfSize:fontSize];
}



- (void)changeLineSpace:(CGFloat)space
{
    CGRect rect = self.frame;
    NSTextAlignment ali = self.textAlignment;
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
    [self sizeToFit];
    self.frame = rect;
    self.textAlignment = ali;
}


- (NSUInteger )getActualLines
{
    return [self getSeparatedLinesFromLabel].count;
}

#pragma mark - private


-(NSArray *)getSeparatedLinesFromLabel {
    NSString *text = [self text];
    UIFont *font = [self font];
    CGRect rect = [self frame];
    
    CTFontRef myFont = CTFontCreateWithName((__bridge CFStringRef)([font fontName]), [font pointSize], NULL);
    
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:text];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)myFont range:NSMakeRange(0, attStr.length)];
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)attStr);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,rect.size.width,100000));
    
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    
    NSArray *lines = (__bridge NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    
    for (id line in lines)
    {
        CTLineRef lineRef = (__bridge CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        
        NSString *lineString = [text substringWithRange:range];
        [linesArray addObject:lineString];
    }
    return (NSArray *)linesArray;
}



@end
