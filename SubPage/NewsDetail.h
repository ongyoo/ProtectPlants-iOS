//
//  NewsDetail.h
//  Work
//
//  Created by Shotiwan Wattanalarpz on 9/5/14.
//  Copyright (c) 2014 easecode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface NewsDetail : UIViewController<UIScrollViewDelegate,MFMailComposeViewControllerDelegate>

@property (nonatomic ,strong) NSMutableArray * arrayNewsDetailData;

@end
