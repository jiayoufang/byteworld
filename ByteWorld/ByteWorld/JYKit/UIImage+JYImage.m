//
//  UIImage+JYImage.m
//  ByteWorld
//
//  Created by 方 on 15/4/10.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "UIImage+JYImage.h"

@implementation UIImage (JYImage)

+(UIImage*)imageFromColor:(UIColor *)color andSize:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0,size.width,size.height);
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

-(UIImage *)makeThumbnailWithSize:(CGSize)size withCornerRadius:(float)radius
{
    //    CGSize originalSize = self.size;
    
    //    按照原图压缩  3.5M图片  按照宽度比例转为了87kb    widthdemo240
    
    
    CGRect projectRect;
    
    float tagRate = 0;
    if (size.width>=self.size.width && size.height>=self.size.height) {
        return self;
    }else{
        float widthRate = self.size.width/size.width;
        float heighRate = self.size.height/size.height;
        
        tagRate = widthRate < heighRate ? widthRate:heighRate ;
    }
    
    
    //    projectRect.size.width=widthDemo;
    //    projectRect.size.height=realHeight;
    
    projectRect.size.width= self.size.width/tagRate;
    projectRect.size.height= self.size.height/tagRate;
    projectRect.origin.x=0;
    projectRect.origin.y=0;
    
    //    NSLog(@"ratio2===%f",ratio2);
    //
//    NSLog(@"原来的图===width==%f  ===height==%f",self.size.width,self.size.height);
//    
//    NSLog(@"被截的图===width=%f==heig=%f",projectRect.size.width,projectRect.size.height);
    
    //    原来的图===width==639.000000  ===height==960.000000
    //    被截的图===width=320.000000==heig=960
    
    
    
    UIImageView *aimageview=[[UIImageView alloc]initWithFrame:projectRect];
    aimageview.backgroundColor=[UIColor blackColor];
    aimageview.contentMode = UIViewContentModeScaleToFill;
    aimageview.clipsToBounds=YES;
    aimageview.image=self;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(projectRect.size.width, projectRect.size.height), NO, 1.0);  //更改图片的质量2.0质量高一些  1.0质量很差
    //    UIGraphicsBeginImageContext(CGSizeMake(projectRect.size.width, projectRect.size.height));
    [aimageview.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*parentImage=UIGraphicsGetImageFromCurrentImageContext();
    CGImageRef imageRef = parentImage.CGImage;
    CGRect myImageRect=projectRect;
    CGImageRef subImageRef = CGImageCreateWithImageInRect(imageRef, myImageRect);
    CGSize size2=CGSizeMake(projectRect.size.width, projectRect.size.height);
    
    
    UIGraphicsBeginImageContext(size2);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, myImageRect, subImageRef);
    UIImage* image = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    
    
    CGImageRelease(imageRef);
    UIGraphicsEndImageContext();
    
//    NSLog(@"ssdfsdf===%@",CGSizeCreateDictionaryRepresentation(image.size));
    return image;
    
}

@end
