//
//  WarningWeatherDetail.h
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/8/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WarningWeatherDetail : UIViewController
<UIScrollViewDelegate>
{
    UIActivityIndicatorView *actView;
}
    @property (nonatomic ,strong) NSMutableArray * arrayWarningWeaterData;

@end
