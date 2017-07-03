//
//  AnsPage.h
//  ProtectPlants
//
//  Created by komsit on 9/24/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import <MapKit/MapKit.h>

@interface AnsPage : UIViewController
<UIScrollViewDelegate,MKMapViewDelegate>

@property (nonatomic,strong)NSDictionary *dataANS;
@property (nonatomic,strong)NSString *StrPic;

@end
