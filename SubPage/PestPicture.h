//
//  PestPicture.h
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/7/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface PestPicture : UIViewController<UIScrollViewDelegate,MFMailComposeViewControllerDelegate>

@property (nonatomic ,strong) NSMutableDictionary * arrayPestData;

@end
