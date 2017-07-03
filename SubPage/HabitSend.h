//
//  HabitSend.h
//  ProtectPlants
//
//  Created by freezecross on 9/25/2557 BE.
//  Copyright (c) 2557 EaseCode Co.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import	<MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreGraphics/CoreGraphics.h>
@interface HabitSend : UIViewController<UIScrollViewDelegate,MKMapViewDelegate,CLLocationManagerDelegate,UITextFieldDelegate,UIAlertViewDelegate>
{
    MKMapView *mapPro;
    CLLocationManager *locationManager;
}

@property (nonatomic,strong) NSMutableArray *SectionData;

@end
