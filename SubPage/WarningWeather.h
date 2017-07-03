//
//  WarningWeather.h
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/8/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WarningWeather : UIViewController
<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *tbView;
    UIActivityIndicatorView *actView;
    int currenPage; 
}
@end
