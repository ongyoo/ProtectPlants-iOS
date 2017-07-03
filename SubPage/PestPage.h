//
//  PestPage.h
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/7/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

@interface PestPage : UIViewController
<UITableViewDataSource,UITableViewDelegate>
{
    
    UITableView *tbView;
    
}

@property (nonatomic ,strong) NSArray * arrayDataMenu;


@end
