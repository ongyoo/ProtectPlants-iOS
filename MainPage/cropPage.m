//
//  cropPage.m
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/7/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import "cropPage.h"
#import "PestPage.h"



@interface cropPage ()

@end

@implementation cropPage

- (void)eventHome{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)eventBlack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    //---- set BG NAV-----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_Default.png"] forBarMetrics:UIBarMetricsDefault];
}

-(void)evnetPage:(UIButton *)sender
{

    NSInteger index = sender.tag;
    PestPage *pestPage = [[PestPage alloc]init];
    pestPage.arrayDataMenu = [[NSArray alloc]initWithObjects:[NSString stringWithFormat:@"%lo",(long)index], nil];
    [self.navigationController pushViewController:pestPage animated:YES];
}


-(void)loadUI
{
    CGSize sc = [[UIScreen mainScreen] bounds].size;
    int y =5;
    
    //========== SET BG ===========//
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-menu.png"]]];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_menu.png"]]];
    
    //---- set BG NAV-----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_Default.png"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationItem setLeftBarButtonItem:nil animated:NO];
    
    
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
    
    
    
    
    
    
    //---------End NAV----------//
    
    //-------Menu-----//
    UIScrollView *scv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, sc.width, sc.height)];
    [scv setDelegate:self];
    [scv setScrollEnabled:YES];
    [scv setBackgroundColor:[UIColor clearColor]];
    
    //----Tile
    UIImageView *titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake(35, y+20, 250, 100)];
    [titleImgView setBackgroundColor:[UIColor clearColor]];
    [titleImgView setImage:[UIImage imageNamed:@"Font.png"]];
    [scv addSubview:titleImgView];
    y = titleImgView.frame.size.height + titleImgView.frame.origin.y;
    
    //------- BUTTON Menu News ------//
    UIButton *btnNews = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnNews setFrame:CGRectMake(-5, y+24, 124, 120)];
    [btnNews setBackgroundColor:[UIColor clearColor]];
    [btnNews setImage:[UIImage imageNamed:@"btn-1.png"] forState:UIControlStateNormal];
    [btnNews addTarget:self action:@selector(evnetPage:) forControlEvents:UIControlEventTouchUpInside];
    [btnNews setTag:1];
    [scv addSubview:btnNews];
    
    
    //------- BUTTON Menu อารักขา ------//
    UIButton *btnIcon2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnIcon2 setFrame:CGRectMake(97.5, y+24, 124, 120)];
    [btnIcon2 setBackgroundColor:[UIColor clearColor]];
    [btnIcon2 setImage:[UIImage imageNamed:@"btn-2.png"] forState:UIControlStateNormal];
    [btnIcon2 addTarget:self action:@selector(evnetPage:) forControlEvents:UIControlEventTouchUpInside];
    [btnIcon2 setTag:2];
    [scv addSubview:btnIcon2];
    
    //------- BUTTON Menu วินิฉัยเบื้องต้น ------//
    UIButton *btnHabit = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnHabit setFrame:CGRectMake(200, y+24, 124, 120)];
    [btnHabit setBackgroundColor:[UIColor clearColor]];
    [btnHabit setImage:[UIImage imageNamed:@"btn-3.png"] forState:UIControlStateNormal];
    [btnHabit addTarget:self action:@selector(evnetPage:) forControlEvents:UIControlEventTouchUpInside];
    [btnHabit setTag:3];
    [scv addSubview:btnHabit];
    y = btnHabit.frame.size.height + btnHabit.frame.origin.y;

    //---------------Line 2---------//
    
    //------- BUTTON Menu วินิฉัยพืช ------//
    UIButton *btnHabit2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnHabit2 setFrame:CGRectMake(-5, y+10, 124, 120)];
    [btnHabit2 setBackgroundColor:[UIColor clearColor]];
    [btnHabit2 setImage:[UIImage imageNamed:@"btn-4.png"] forState:UIControlStateNormal];
    [btnHabit2 addTarget:self action:@selector(evnetPage:) forControlEvents:UIControlEventTouchUpInside];
    [btnHabit2 setTag:4];
    [scv addSubview:btnHabit2];
    
    
    //------- BUTTON Menu อารักขา ------//
    UIButton *btnWeather = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnWeather setFrame:CGRectMake(97.5, y+10, 124, 120)];
    [btnWeather setBackgroundColor:[UIColor clearColor]];
    [btnWeather setImage:[UIImage imageNamed:@"btn-5.png"] forState:UIControlStateNormal];
    [btnWeather addTarget:self action:@selector(evnetPage:) forControlEvents:UIControlEventTouchUpInside];
    [btnWeather setTag:5];
    [scv addSubview:btnWeather];
    
    
    //------- BUTTON Menu วินิฉัยเบื้องต้น ------//
    UIButton *btnWarning = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnWarning setFrame:CGRectMake(200, y+10, 124, 120)];
    [btnWarning setBackgroundColor:[UIColor clearColor]];
    [btnWarning setImage:[UIImage imageNamed:@"btn-6.png"] forState:UIControlStateNormal];
    [btnWarning addTarget:self action:@selector(evnetPage:) forControlEvents:UIControlEventTouchUpInside];
    [btnWarning setTag:6];
    [scv addSubview:btnWarning];
    y = btnWarning.frame.size.height + btnWarning.frame.origin.y;
    
    
    
    //----set contean scv---//
    [scv setContentSize:CGSizeMake(sc.width, y+50)];
    [self.view addSubview:scv];
    
    
    
    
    
    
    
    
    //------- TABBAR HOME ---------//
    
    UIImageView *tabView = [[UIImageView alloc]initWithFrame:CGRectMake(0, sc.height-58, sc.width, 58)];
    [tabView setBackgroundColor:[UIColor clearColor]];
    [tabView setImage:[UIImage  imageNamed:@"tabbar.png"]];
    [self.view addSubview:tabView];
    
    UIButton *btnHome = [[UIButton alloc]initWithFrame:CGRectMake((sc.width-53)/2, sc.height-65, 60, 60)];
    [btnHome setBackgroundColor:[UIColor clearColor]];
    [btnHome setImage:[UIImage imageNamed:@"icon-home.png"] forState:UIControlStateNormal];
    [btnHome addTarget:self action:@selector(eventHome) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnHome];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadUI];
    
    
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
