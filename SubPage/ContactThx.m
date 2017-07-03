//
//  ContactThx.m
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/15/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import "ContactThx.h"

@interface ContactThx ()

@end

@implementation ContactThx


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
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_Contact.png"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void) LoadData{
    
}

- (void) LoadUI{
    
    CGSize sc = [[UIScreen mainScreen] bounds].size;
    
    //----- set BG------//
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_about.png"]]];
    
    //---- set BG NAV-----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_Contact.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    [view setBackgroundColor:[UIColor clearColor]];
    
    UIButton* btnBack = [UIButton buttonWithType: UIButtonTypeCustom];
    [btnBack setFrame:CGRectMake(0, 0, 44, 36)];
    [btnBack setBackgroundColor:[UIColor clearColor]];
    [btnBack setImage:[UIImage imageNamed:@"Button-back.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(eventBlack) forControlEvents:UIControlEventTouchDown];
    [view addSubview:btnBack];
    
    UIBarButtonItem* itemAboutUs =[[UIBarButtonItem alloc]initWithCustomView:view];
    [self.navigationItem setLeftBarButtonItem:itemAboutUs];
    
    
    
    
    //------- TABBAR HOME ---------//
    
    //======== Image Tabbar========//
    UIImageView *tabView = [[UIImageView alloc]initWithFrame:CGRectMake(0, sc.height-58, sc.width, 58)];
    [tabView setBackgroundColor:[UIColor clearColor]];
    [tabView setImage:[UIImage  imageNamed:@"tabbar.png"]];
    [self.view addSubview:tabView];
    //======== Image icon Home ========//
    UIButton *btnHome = [[UIButton alloc]initWithFrame:CGRectMake((sc.width-53)/2, sc.height-65, 60, 60)];
    [btnHome setBackgroundColor:[UIColor clearColor]];
    [btnHome setImage:[UIImage imageNamed:@"icon-home.png"] forState:UIControlStateNormal];
    [btnHome addTarget:self action:@selector(eventHome) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnHome];
    
    
    
    
}

- (void)addScrollView{
    
    CGSize sc = [[UIScreen mainScreen]bounds].size;
    
    UIScrollView *scv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, sc.width, sc.height-42)];
    [scv setDelegate:self];
    [scv setScrollEnabled:YES];
    [scv setBackgroundColor:[UIColor clearColor]];
    int y =45;
    
    
    

    //============== Image Thx
    UIImageView *ImageThx = [[UIImageView alloc]initWithFrame:CGRectMake(68, y+15, 184 ,65)];
    [ImageThx setImage:[UIImage imageNamed:@"text_thank.png"]];
    [scv addSubview:ImageThx];
    y = ImageThx.frame.size.height + ImageThx.frame.origin.y;
    
    
    
    
    
    
    //============== Image Logo
    UIImageView *ImageLogo = [[UIImageView alloc]initWithFrame:CGRectMake(100, y+20, 120 ,120)];
    [ImageLogo setImage:[UIImage imageNamed:@"icon-agriculture.png"]];
    [scv addSubview:ImageLogo];
    y = ImageLogo.frame.size.height + ImageLogo.frame.origin.y;
    
    
    // ================== Label Detail
    UILabel *Label6 = [[UILabel alloc]initWithFrame:CGRectMake(40, y+25, 240, 100)];
    [Label6 setBackgroundColor:[UIColor clearColor]];
    [Label6 setTextColor:[UIColor blackColor]];
    Label6.lineBreakMode = NSLineBreakByWordWrapping;
    Label6.numberOfLines = 8;
    [Label6 setText:@"กลุ่มสงเสริมการขาย  ส่วนส่งเสริมและเผยแพร่  สำนักพัฒนาการถ่ายทอดเทคโนโลยีการเกษตรกรมส่งเสริมการเกษตร 2143/1 ถนน พหลโยธิน  เขตจตุจักร กรุงเทพมาหนคร 10000 \nโทร. 02 XXX XXXXX แฟกซ์ 02 XXX XXXXX "];
    Label6.font = [UIFont fontWithName:@"Helvetica Neue" size:12.0];
    [Label6 setTextAlignment:NSTextAlignmentCenter];
    [scv addSubview:Label6];
    y = Label6.frame.size.height + Label6.frame.origin.y;
    
    
    
    
    
    
    [scv setContentSize:CGSizeMake(sc.width, y+40)];
    [self.view addSubview:scv];
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self LoadData];
    [self addScrollView];
    [self LoadUI];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
