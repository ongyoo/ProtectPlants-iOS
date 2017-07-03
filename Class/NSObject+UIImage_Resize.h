//
//  NSObject+UIImage_Resize.h
//  ProtectPlants
//
//  Created by komsit on 9/23/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (UIImage_Resize)
+ (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;

@end
