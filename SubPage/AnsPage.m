//
//  AnsPage.m
//  ProtectPlants
//
//  Created by komsit on 9/24/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import "AnsPage.h"
#import "WeatherClass.h"
//----------------------------------------------
//@interface CSPointAnnotation : MKPointAnnotation
//@property (nonatomic) int tag;
//@end
//@implementation CSPointAnnotation
//@end
//----------------------------------------------
@interface AnsPage ()

@end

@implementation AnsPage

-(void)eventHome{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)eventBlack
{
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)viewWillDisappear:(BOOL)animated
{
    //---- set BG NAV-----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_Warning.png"] forBarMetrics:UIBarMetricsDefault];
    
}

-(void)loadUI
{
    
    CGSize sc = [[UIScreen mainScreen] bounds].size;
    int y =0;
    
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
    
    
    UIImageView  *ImgHeads = [[UIImageView alloc]initWithFrame:CGRectMake(sc.width-85, 0,60,75)];
    [ImgHeads setBackgroundColor:[UIColor clearColor]];
    [ImgHeads setImage:[UIImage imageNamed:@"icon_pest.png"]];
    
    
    
    
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
    [view addSubview:ImgHeads];
    [view addSubview:btnBack];
    UIBarButtonItem* itemAboutUs =[[UIBarButtonItem alloc]initWithCustomView:view];
    [self.navigationItem setLeftBarButtonItem:itemAboutUs];
    
  
    
    
    //--------- BgView -------//
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(30, 100, sc.width-50, sc.height-120)];
    [bgView setBackgroundColor:[UIColor colorWithRed:0.898 green:0.843 blue:0.333 alpha:0.8]];
    [[bgView layer]setBorderWidth:5];
    [[bgView layer]setBorderColor:[UIColor colorWithRed:0.427 green:0.501 blue:0.329 alpha:0.8].CGColor];
    [[bgView layer]setCornerRadius:20];
    
    //--------- Label Title ---------//
    UILabel *Title = [[UILabel alloc]initWithFrame:CGRectMake(-14, 14, sc.width-20, 25)];
    [Title setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20]];
    [Title setText:@"สาเหตุเบื้องต้นที่พบคือ"];
    [Title setTextColor:[UIColor colorWithRed:0.639 green:0.121 blue:0.172 alpha:0.8]];
    [Title setTextAlignment:NSTextAlignmentCenter];
    [bgView addSubview:Title];
    
    //--------- BgPic ----------//
    UIView *bgPic = [[UIView alloc]initWithFrame:CGRectMake(0, 45, 250, 140)];
    [bgPic setBackgroundColor:[UIColor colorWithRed:0.968 green:0.968 blue:0.835 alpha:0.8]];
    
    
    //-----ImageView ------//
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 0, bgPic.frame.size.width-4, bgPic.frame.size.height)];
    [imgView setBackgroundColor:[UIColor clearColor]];
    [imgView setImage:[UIImage imageNamed:_StrPic]];
    [imgView setAutoresizingMask:UIViewAutoresizingNone];
    [bgPic addSubview:imgView];
    [bgView addSubview:bgPic];
    
    y = bgPic.frame.size.height + bgPic.frame.origin.y;
    
    
    //---------- Label Head ---------//
    UILabel *LabelHead = [[UILabel alloc]initWithFrame:CGRectMake(-14, 14, sc.width-20, 25)];
    [LabelHead setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:20]];
    [LabelHead setText:@"สาเหตุเบื้องต้นที่พบคือ"];
    [LabelHead setTextColor:[UIColor colorWithRed:0.639 green:0.121 blue:0.172 alpha:0.8]];
    [LabelHead setTextAlignment:NSTextAlignmentCenter];
    [bgView addSubview:LabelHead];
    
    
    
    //--------  MKMAP -----------//
    MKMapView *mapView = [[MKMapView alloc]initWithFrame:CGRectMake(10, y+20, bgPic.frame.size.width-4, bgPic.frame.size.height-10)];
    [mapView setShowsUserLocation:YES];
    
    MKUserLocation *userLocation = mapView.userLocation;
    MKCoordinateRegion region =
    MKCoordinateRegionMakeWithDistance(userLocation.location.coordinate,
                                       20000, 20000);
    [mapView setRegion:region animated:NO];
    [mapView setDelegate:self];

    [[mapView layer]setCornerRadius:10];
    [bgView addSubview:mapView];
    
    
    
    //----  Main Subview -----//
    
    [self.view addSubview:bgView];
    

    
}

-(void)loadData
{
    NSLog(@"Data :%@",_dataANS);
    NSLog(@"DataPic :%@",_StrPic);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
    [self loadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
