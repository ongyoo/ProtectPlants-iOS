//
//  NSObject+UIImage_Resize.m
//  ProtectPlants
//
//  Created by komsit on 9/23/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import "NSObject+UIImage_Resize.h"

@implementation NSObject (UIImage_Resize)
+ (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
