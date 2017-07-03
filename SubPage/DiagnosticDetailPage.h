//
//  DiagnosticDetailPage.h
//  ProtectPlants
//
//  Created by komsit on 11/13/2557 BE.
//  Copyright (c) 2557 EaseCode Co.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

@interface DiagnosticDetailPage : UIViewController
<
    UIScrollViewDelegate
>
@property (nonatomic,strong)NSMutableDictionary *dataPassingDetail;
@end
