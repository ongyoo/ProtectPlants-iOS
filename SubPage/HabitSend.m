//
//  HabitSend.m
//  ProtectPlants
//
//  Created by freezecross on 9/25/2557 BE.
//  Copyright (c) 2557 EaseCode Co.Ltd. All rights reserved.
//

#import "HabitSend.h"
#import "UserClass.h"
#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
//----------------------------------------------
@interface CSPointAnnotation : MKPointAnnotation
@property (nonatomic) int tag;
@end
@implementation CSPointAnnotation
@end
//----------------------------------------------
@interface HabitSend ()
{
    UIScrollView *scv;
    UIScrollView *scvPic;
    UIImageView *titleImgView;
    UILabel *LabelDetail;
    
    //----- Map
    CLLocation *startLocation;
    
    //-----TextFiled
    UITextField *txtName;
    UITextField *txtTel;
    
    //----Data
    NSString *addressData;
    NSString *Lat;
    NSString *Lng;
    NSString *Level;
    NSString * strDetail;
    UILabel *labelTitle;
}
@end

@implementation HabitSend

#pragma mark Event Button
- (void)buttonSend
{
    if ([txtTel text].length > 5) {
        UserClass *userClass = [[UserClass alloc]init];
        [userClass setDiagnosisWhitTel:[txtTel text]
                          WhitProvince:addressData
                               WhitLat:Lat
                               WhitLng:Lng
                             WhitLevel:Level
                              WhitName:[LabelDetail text]
                            completion:^(BOOL completion) {
                                
                                if(completion){
                                    
                                    UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"การแจ้งเตือน"
                                                                                      message:@"ส่งข้อมูลสำเร็จ"
                                                                                     delegate:self
                                                                            cancelButtonTitle:nil
                                                                            otherButtonTitles:@"ตกลง",nil];
                                    [alerView show];
                                }
                            }];
    } else {
        UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"ผิดพลาด"
                                                          message:@"กรุณาใส่เบอร์ติดต่อกลับ"
                                                         delegate:self
                                                cancelButtonTitle:nil
                                                otherButtonTitles:@"ตกลง",nil];
        [alerView show];
    }
    
}

-(void)eventHome{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


-(void)eventBlack
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    
    //---- set BG NAV-----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_Diagnosis.png"] forBarMetrics:UIBarMetricsDefault];
    
}



- (void)LoadUI{
    
    CGSize sc = [[UIScreen mainScreen] bounds].size;
    
    //========== SET BG ===========//
    [self.view setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    
    
    
    //---- set BG NAV-----//
    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];
    
    
    //========== ShowHead Navigation
    UIImageView  *imgNavigation = [[UIImageView alloc]initWithFrame:CGRectMake(-16, -16, sc.width, 85)];
    [imgNavigation setBackgroundColor:[UIColor clearColor]];
    [imgNavigation setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    
    
    //========== Image & Label Head
    UIImageView  *ImgHead = [[UIImageView alloc]initWithFrame:CGRectMake(-16, -16,sc.width,94)];
    [ImgHead setBackgroundColor:[UIColor clearColor]];
    [ImgHead setImage:[UIImage imageNamed:@"Nav_Diagnosis.png"]];
    
    
    
    
    [self.navigationItem setLeftBarButtonItem:nil animated:NO];
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    [view setBackgroundColor:[UIColor clearColor]];
    
    UIButton* btnBack = [UIButton buttonWithType: UIButtonTypeCustom];
    [btnBack setFrame:CGRectMake(5, -2, 44, 36)];
    [btnBack setBackgroundColor:[UIColor clearColor]];
    [btnBack setImage:[UIImage imageNamed:@"Button-back.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(eventBlack) forControlEvents:UIControlEventTouchDown];
    [view addSubview:imgNavigation];
    [view addSubview:ImgHead];
    [view addSubview:btnBack];
    UIBarButtonItem* itemAboutUs =[[UIBarButtonItem alloc]initWithCustomView:view];
    [self.navigationItem setLeftBarButtonItem:itemAboutUs];
    
    
    int y =30;
    //=========Scrollview
    scv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 35, sc.width, sc.height-50)];
    [scv setDelegate:self];
    [scv setScrollEnabled:YES];
    [scv setBackgroundColor:[UIColor clearColor]];
    
    //------- Lable Tilie--------//
    UILabel *lblTile = [[UILabel alloc]initWithFrame:CGRectMake(40, y, 100, 20)];
    [lblTile setBackgroundColor:[UIColor clearColor]];
    [lblTile setText:@"สาเหตุเบื่องต้นที่พบคือ"];
    [lblTile setTextColor:[UIColor redColor]];
    [lblTile setFont:[UIFont systemFontOfSize:22]];
    [lblTile sizeToFit];
    //--------- bgImagView  yellow --------//
    UIView *bgImgView =[[UIView alloc]initWithFrame:CGRectMake(20, y-5, sc.width-40, 800)];
    [bgImgView setBackgroundColor:[UIColor colorWithRed:0.878 green:0.807 blue:0.208 alpha:0.80]];
    [[bgImgView layer]setCornerRadius:25];
    [[bgImgView layer] setBorderColor:[UIColor colorWithRed:0.427 green:0.501 blue:0.329 alpha:0.8].CGColor];
    [[bgImgView layer]setBorderWidth:6];
    
    //--------- ImgLabel --------//
    UIImageView *bgImLabel = [[UIImageView alloc]initWithFrame:CGRectMake(22, 25, 235, 35)];
    [bgImLabel setImage:[UIImage imageNamed:@"text_cause.png"]];
    y = bgImLabel.frame.size.height+bgImLabel.frame.origin.y;
    
   
    
    //--------- Label Title ---------//
    NSString *StrSend = [NSString stringWithFormat:@"Send_%li",(long)[_SectionData[0] integerValue]];
    labelTitle = [[UILabel alloc]initWithFrame:CGRectMake(60, y+25, 160, 90)];
    [labelTitle setFont:[UIFont fontWithName:@"ArialHebrew" size:20]];
    [labelTitle setLineBreakMode:NSLineBreakByWordWrapping];
    [labelTitle setNumberOfLines:4];
    [labelTitle setText:_SectionData[1][@"dataSend"][StrSend]];
    [labelTitle setTextAlignment:NSTextAlignmentCenter];
    y = labelTitle.frame.size.height + labelTitle.frame.origin.y;

  
 
    

        
    
        NSString *Strimge = [NSString stringWithFormat:@"Picture_%li",(long)[_SectionData[0] integerValue]];
        NSString *StrLabel = [NSString stringWithFormat:@"Picture_Detail_%li",(long)[_SectionData[0] integerValue]];
    
    int ys=0;
    //=========Scrollview
    scvPic = [[UIScrollView alloc]initWithFrame:CGRectMake(60, y+10, sc.width-120, 270)];
    [scvPic setDelegate:self];
    [scvPic setScrollEnabled:YES];
    [scvPic setBackgroundColor:[UIColor clearColor]];
    
        //-------- Picture Image --------//
        for (int idpic = 1; [_SectionData[1][@"Picture"][Strimge] count] >= idpic; idpic++) {
            
            NSString *StrPic = [NSString stringWithFormat:@"Pic%i",idpic];
            NSLog(@"%@",_SectionData[1][@"Picture"][Strimge][StrPic]);
     
            if ([_SectionData[1][@"Picture"][Strimge][StrPic] length] != 0) {
                
                //=============== Image Scale =============//
                titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake(ys, 0, 200, 230)];
                [titleImgView setBackgroundColor:[UIColor clearColor]];
                [titleImgView setImage:[UIImage imageNamed:_SectionData[1][@"Picture"][Strimge][StrPic]]];
                [[titleImgView layer]setCornerRadius:4];
                [[titleImgView layer]setMasksToBounds:YES];
                [scvPic addSubview:titleImgView];
             

                
                //---------- Label Detail-----------//
                NSString *StrImgDetail = [NSString stringWithFormat:@"PicDetail%i",idpic];
                LabelDetail = [[UILabel alloc]initWithFrame:CGRectMake(ys, titleImgView.frame.size.height+titleImgView.frame.origin.y, 200, 20)];
                [LabelDetail setBackgroundColor:[UIColor clearColor]];
                [LabelDetail setTextColor:[UIColor grayColor]];
                [LabelDetail setLineBreakMode:NSLineBreakByWordWrapping];
                [LabelDetail setNumberOfLines:2];
                [LabelDetail setFont:[UIFont fontWithName:@"Helvetica Neue" size:12.0]];
                [LabelDetail setText:_SectionData[1][@"Picture_Detail"][StrLabel][StrImgDetail]];
                [LabelDetail setTextAlignment:NSTextAlignmentCenter];
                [scvPic addSubview:LabelDetail];
                
                y = titleImgView.frame.size.width + titleImgView.frame.origin.x;
                
                y = scvPic.frame.size.width + scvPic.frame.origin.x+140;
                
                }
            
            
            
        }
    [scvPic setContentSize:CGSizeMake(ys, 270)];
    
  
    //--------- bgViewPic --------//
    UIImageView *bgViewPic =[[UIImageView alloc]initWithFrame:CGRectMake(0, bgImLabel.frame.size.height+bgImLabel.frame.origin.y+15, bgImgView.frame.size.width, y)];
    [bgViewPic setBackgroundColor:[UIColor colorWithRed:0.929 green:0.882 blue:0.603 alpha:0.80]];
    
    NSArray *itemArray = [NSArray arrayWithObjects: @"น้อย", @"ปานกลาง", @"มาก", nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmentedControl.frame = CGRectMake(40, y+30, 200, 50);
    //segmentedControl.segmentedControlStyle = UISegmentedControlStylePlain;
    [segmentedControl addTarget:self action:@selector(MySegmentControlAction:) forControlEvents: UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 1;
    

    //-------- Label แจ้งพิกัด --------//
    UILabel *labelPoint = [[UILabel alloc]initWithFrame:CGRectMake(20, bgViewPic.frame.size.height+bgViewPic.frame.origin.y-10, 160, 90)];
    [labelPoint setFont:[UIFont fontWithName:@"ArialHebrew" size:14]];
    [labelPoint setText:@"แจ้งพิกัดที่ท่านอยู่"];
    [labelPoint setTextAlignment:NSTextAlignmentLeft];
    y = labelPoint.frame.size.height + labelPoint.frame.origin.y;
   
    
    //--------- bgMap --------//
    UIImageView *bgMap =[[UIImageView alloc]initWithFrame:CGRectMake(15,labelPoint.frame.size.height+labelPoint.frame.origin.y-25,bgViewPic.frame.size.width-30, 150)];
    [bgMap setBackgroundColor:[UIColor colorWithRed:0.290 green:0.647 blue:0.239 alpha:0.9]];
    y = bgMap.frame.size.height + bgMap.frame.origin.y;

    //---------- Map ------------//
    mapPro = [[MKMapView alloc]initWithFrame:CGRectMake(4, 4, bgMap.frame.size.width-8, bgMap.frame.size.height-8)];
    [mapPro setShowsUserLocation:YES];
    
    MKUserLocation *userLocation = mapPro.userLocation;
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate,
                                       20000, 20000);
    [mapPro setRegion:region animated:NO];
    [mapPro setDelegate:self];
    
   
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    #ifdef __IPHONE_8_0
    if(IS_OS_8_OR_LATER) {
        // Use one or the other, not both. Depending on what you put in info.plist
        [locationManager requestWhenInUseAuthorization];
        [locationManager requestAlwaysAuthorization];
    }
    #endif
    [locationManager startUpdatingLocation];
    
    //---Label Name
    UILabel *labelName = [[UILabel alloc]initWithFrame:CGRectMake(60, y+14, 100, 28)];
    [labelName setFont:[UIFont fontWithName:@"ArialHebrew" size:14]];
    [labelName setText:@"ชื่อ"];
    [labelName setTextAlignment:NSTextAlignmentLeft];
    
    //------ TextFilde ------//
    txtName = [[UITextField alloc]initWithFrame:CGRectMake(100, y+14, 140, 28)];
    [txtName setBackgroundColor:[UIColor whiteColor]];
    [txtName setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [txtName setBorderStyle:UITextBorderStyleRoundedRect];
    [txtName setReturnKeyType:UIReturnKeyDone];
    [txtName setDelegate:self];
    //y = txtName.frame.size.height + txtName.frame.origin.y;
    
    
    //---Label Name
    UILabel *labelTel = [[UILabel alloc]initWithFrame:CGRectMake(20, y+14, 100, 28)];
    [labelTel setFont:[UIFont fontWithName:@"ArialHebrew" size:14]];
    [labelTel setText:@"เบอร์ติดต่อ"];
    [labelTel setTextAlignment:NSTextAlignmentLeft];
    txtTel = [[UITextField alloc]initWithFrame:CGRectMake(100, y+14, 140, 28)];
    [txtTel setBackgroundColor:[UIColor whiteColor]];
    [txtTel setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [txtTel setBorderStyle:UITextBorderStyleRoundedRect];
    [txtTel setReturnKeyType:UIReturnKeyDone];
    [txtTel setDelegate:self];
    y = txtTel.frame.size.height + txtTel.frame.origin.y;
    
    //============ Button
    UIButton *btnSend = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect frame1 = CGRectMake(sc.width-160, y+4, 80, 28);
    [btnSend setFrame: frame1];
    [btnSend setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_submit.png"]]];
    [[btnSend layer]setCornerRadius:2];
    [[btnSend layer]setMasksToBounds:YES];
    [btnSend setContentMode:UIViewContentModeScaleAspectFill];
    [btnSend setTag:100111];
    [btnSend addTarget:self action:@selector(buttonSend) forControlEvents:UIControlEventTouchUpInside];
    
    
    [bgImgView addSubview:lblTile];
    [bgImgView addSubview:bgViewPic];
    [bgImgView addSubview:segmentedControl];
    [bgImgView addSubview:bgImLabel];
    [bgImgView addSubview:labelTitle];
    [bgImgView addSubview:labelPoint];
    [bgImgView addSubview:bgMap];
    //[bgImgView addSubview:labelName];
    //[bgImgView addSubview:txtName];
    [bgImgView addSubview:labelTel];
    [bgImgView addSubview:txtTel];
    [bgImgView addSubview:btnSend];
    [bgMap addSubview:mapPro];
    
    
    [scv addSubview:bgImgView];
    
    [scv addSubview:scvPic];
    y=bgImgView.frame.size.height+bgImgView.frame.origin.y;
    
    [scv setContentSize:CGSizeMake(sc.width, y+50)];
    [self.view addSubview:scv];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];

}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    //NSLog(@"OldLocation %f %f", oldLocation.coordinate.latitude, oldLocation.coordinate.longitude);
    //NSLog(@"NewLocation %f %f", newLocation.coordinate.latitude, newLocation.coordinate.longitude);
    Lat = [NSString stringWithFormat:@"%f",newLocation.coordinate.latitude];
    Lng = [NSString stringWithFormat:@"%f",newLocation.coordinate.longitude];
    
    
    strDetail = [NSString stringWithFormat:@"%@",_SectionData[1][@"Picture_Detail"][@"Picture_Detail_1"][@"PicDetail1"]];
    //NSLog(@"LabelDetail :%@",[]);
    
    //------- แปลง เพื่อหาที่อยู่ ---------//
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:newLocation.coordinate.latitude longitude:newLocation.coordinate.longitude];
    [self reverseGeocode:loc];
    
    [self zoomInToMyLocationWhitlatitude:[NSString stringWithFormat:@"%f",newLocation.coordinate.latitude]
                           whitlongitude:[NSString stringWithFormat:@"%f",newLocation.coordinate.longitude]];
}
// Map Manager
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    //NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}




//  Zoom Map
-(void)zoomInToMyLocationWhitlatitude:(NSString *)latitude
                        whitlongitude:(NSString *)longitude
{
    MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
    region.center.latitude = [latitude floatValue];
    region.center.longitude = [longitude floatValue];
    region.span.longitudeDelta = 0.300f;
    region.span.latitudeDelta = 0.300f;
    [mapPro setRegion:region animated:YES];
    
}




- (void)LoadData{
    //NSLog(@"%@",_SectionData[0]);
    //NSLog(@"%@",_SectionData[1][@"dataSend"]);
    //-- กำหนด zoom แผนที่ให้อยู่ในวงที่มีการปัดหมุด
   
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self LoadData];
    [self LoadUI];
    
    //NSLog(@"%@",_SectionData);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
 }

#pragma mark textField
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

-(void)dismissKeyboard
{
    [txtName resignFirstResponder];
    [txtTel resignFirstResponder];

}


-(void)reverseGeocode:(CLLocation *)location{
    //------ get ชื่อ ถนน ที่อยู่ปัจจุบัน ----//
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        if(error) {
            NSLog(@"Error");
            return;
        }
        if(placemarks) {
            CLPlacemark *placemark = placemarks [0];
            NSArray *lines = placemark.addressDictionary[ @"FormattedAddressLines"];
            NSString *addressString = [lines componentsJoinedByString:@"\n"];
            NSLog(@"Address: %@", addressString);
            addressData = addressString;
        }
    }];}


- (void)MySegmentControlAction:(UISegmentedControl *)segment
{
    Level = [NSString stringWithFormat:@"%li",(long)segment.selectedSegmentIndex];
    if(segment.selectedSegmentIndex == 0)
    {
        // code for the first button
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self.navigationController.navigationController dismissViewControllerAnimated:YES completion:nil];
}
@end
