//
//  HomePage.m
//  ProtectPlants
//
//  Created by komsit on 9/6/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import "HomePage.h"
#import "News.h"
#import "cropPage.h"
#import "Habit.h"
#import "WarningNews.h"
#import "WarningWeather.h"
#import "Search.h"
#import "Contact.h"
#import "About.h"
#import "AnsPage.h"
#import "DiagnosticPage.h"
@interface HomePage ()

@end

@implementation HomePage

- (void)viewWillAppear:(BOOL)animated
{
    //---- set BG NAV-----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_Home.png"] forBarMetrics:UIBarMetricsDefault];
    
//    AnsPage *ansPage = [[AnsPage alloc]init];
//    [self.navigationController pushViewController:ansPage animated:YES];
}


#pragma mark Event

-(void)eventButton:(UIButton *)sender
{
    News *news = [[News alloc]init];
    cropPage *CorpPage = [[cropPage alloc]init];
    Habit *habit = [[Habit alloc]init];
    WarningNews *warningNews = [[WarningNews alloc]init];
    WarningWeather *warningWeather = [[WarningWeather alloc]init];
    Search *search = [[Search alloc]init];
    Contact *contact = [[Contact alloc]init];
    About *about = [[About alloc]init];
    DiagnosticPage *diagnosticPage = [[DiagnosticPage alloc]init];
        
    switch (sender.tag) {
        case 1:
            [self.navigationController pushViewController:news animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:CorpPage animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:habit animated:YES];
            break;
        case 4:
           [self.navigationController pushViewController:diagnosticPage animated:YES];
            break;
        case 5:
             [self.navigationController pushViewController:warningWeather animated:YES];
            
            break;
        case 6:
            [self.navigationController pushViewController:warningNews animated:YES];
            break;
        case 7:
            [self.navigationController pushViewController:search animated:YES];
            break;
        case 8:
           [self.navigationController pushViewController:contact animated:YES];
            break;
        case 9:
            [self.navigationController pushViewController:about animated:YES];
            break;
            
            
        default:
            break;
    }
}

-(void)loadUI
{
    

    int y =10;
    CGSize sc = [[UIScreen mainScreen] bounds].size;
    
    //----- set BG------//
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-menu.png"]]];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_menu.png"]]];
    
    //---- set BG NAV-----//
     [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_Home.png"] forBarMetrics:UIBarMetricsDefault];
    


    
    //-------Menu-----//
    UIScrollView *scv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, sc.width, sc.height)];
    [scv setDelegate:self];
    [scv setScrollEnabled:YES];
    [scv setBackgroundColor:[UIColor clearColor]];
    
    
    //------- BUTTON Menu News ------//
    UIButton *btnNews = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnNews setFrame:CGRectMake(0, y+16, 124, 120)];
    [btnNews setBackgroundColor:[UIColor clearColor]];
    [btnNews setImage:[UIImage imageNamed:@"icon-news.png"] forState:UIControlStateNormal];
    [btnNews addTarget:self action:@selector(eventButton:) forControlEvents:UIControlEventTouchUpInside];
    [btnNews setTag:1];
    [scv addSubview:btnNews];
    
    
    //------- BUTTON Menu อารักขา ------//
    UIButton *btnIcon2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnIcon2 setFrame:CGRectMake(98, y+20, 124, 120)];
    [btnIcon2 setBackgroundColor:[UIColor clearColor]];
    [btnIcon2 setImage:[UIImage imageNamed:@"icon-2-2.png"] forState:UIControlStateNormal];
    [btnIcon2 addTarget:self action:@selector(eventButton:) forControlEvents:UIControlEventTouchUpInside];
    [btnIcon2 setTag:2];
    [scv addSubview:btnIcon2];
 
    
    //------- BUTTON Menu วินิฉัยเบื้องต้น ------//
    UIButton *btnHabit = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnHabit setFrame:CGRectMake(195, y+20, 124, 120)];
    [btnHabit setBackgroundColor:[UIColor clearColor]];
    [btnHabit setImage:[UIImage imageNamed:@"icon-habits.png"] forState:UIControlStateNormal];
    [btnHabit addTarget:self action:@selector(eventButton:) forControlEvents:UIControlEventTouchUpInside];
    [btnHabit setTag:3];
    [scv addSubview:btnHabit];
    y = btnHabit.frame.size.height + btnHabit.frame.origin.y;
    
    //---------------Line 2---------//
    
    //------- BUTTON Menu วินิฉัยพืช ------//
    UIButton *btnHabit2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnHabit2 setFrame:CGRectMake(0, y+18, 124, 120)];
    [btnHabit2 setBackgroundColor:[UIColor clearColor]];
    [btnHabit2 setImage:[UIImage imageNamed:@"icon-habit-2.png"] forState:UIControlStateNormal];
    [btnHabit2 addTarget:self action:@selector(eventButton:) forControlEvents:UIControlEventTouchUpInside];
    [btnHabit2 setTag:4];
    [scv addSubview:btnHabit2];
    
    
    
    //------- BUTTON Menu วินิฉัยเบื้องต้น ------//
    UIButton *btnWarning = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnWarning setFrame:CGRectMake(98, y+18, 124, 120)];
    [btnWarning setBackgroundColor:[UIColor clearColor]];
    [btnWarning setImage:[UIImage imageNamed:@"icon-warning.png"] forState:UIControlStateNormal];
    [btnWarning addTarget:self action:@selector(eventButton:) forControlEvents:UIControlEventTouchUpInside];
    [btnWarning setTag:6];
    [scv addSubview:btnWarning];
    
    
    //------- BUTTON Menu อารักขา ------//
    
    UIButton *btnWeather = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnWeather setFrame:CGRectMake(195, y+18, 124, 120)];
    [btnWeather setBackgroundColor:[UIColor clearColor]];
    [btnWeather setImage:[UIImage imageNamed:@"icon-weather.png"] forState:UIControlStateNormal];
    [btnWeather addTarget:self action:@selector(eventButton:) forControlEvents:UIControlEventTouchUpInside];
    [btnWeather setTag:5];
    y = btnWeather.frame.size.height + btnWeather.frame.origin.y;
    [scv addSubview:btnWeather];
    
    
    
    //---------------Line 3---------//
    
    //------- BUTTON Menu ค้นหา ------//
    UIButton *btnSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnSearch setFrame:CGRectMake(0, y+20, 124, 120)];
    [btnSearch setBackgroundColor:[UIColor clearColor]];
    [btnSearch setImage:[UIImage imageNamed:@"icon-search.png"] forState:UIControlStateNormal];
    [btnSearch addTarget:self action:@selector(eventButton:) forControlEvents:UIControlEventTouchUpInside];
    [btnSearch setTag:7];
    [scv addSubview:btnSearch];
    
    //------- BUTTON Menu ติดต่อเรา ------//
    UIButton *btnContact = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnContact setFrame:CGRectMake(98, y+20, 124, 120)];
    [btnContact setBackgroundColor:[UIColor clearColor]];
    [btnContact setImage:[UIImage imageNamed:@"icon-contact.png"] forState:UIControlStateNormal];
    [btnContact addTarget:self action:@selector(eventButton:) forControlEvents:UIControlEventTouchUpInside];
    [btnContact setTag:8];
    [scv addSubview:btnContact];
     
    //------- BUTTON Menu เกี่ยวกับเรา ------//
    UIButton *btnAbout = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnAbout setFrame:CGRectMake(195, y+20, 124, 120)];
    [btnAbout setBackgroundColor:[UIColor clearColor]];
    [btnAbout setImage:[UIImage imageNamed:@"icon-about.png"] forState:UIControlStateNormal];
    [btnAbout addTarget:self action:@selector(eventButton:) forControlEvents:UIControlEventTouchUpInside];
    [btnAbout setTag:9];
    [scv addSubview:btnAbout];
    y = btnAbout.frame.size.height + btnAbout.frame.origin.y;
    
    
    //----set contean scv---//
    [scv setContentSize:CGSizeMake(sc.width, y+50)];
    [self.view addSubview:scv];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadUI];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}



@end
