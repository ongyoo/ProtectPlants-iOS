//
//  DiagnosisMainSubPage.h
//  ProtectPlants
//
//  Created by komsit on 11/12/2557 BE.
//  Copyright (c) 2557 EaseCode Co.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

@interface DiagnosisMainSubPage : UIViewController
<
    UIScrollViewDelegate
>
@property (nonatomic,strong)NSMutableDictionary *dataPassing;
@property (nonatomic,strong)NSString *strMainID;
@end
