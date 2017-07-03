//
//  DiagnosticPage.m
//  ProtectPlants
//
//  Created by komsit on 11/9/2557 BE.
//  Copyright (c) 2557 EaseCode Co.Ltd. All rights reserved.
//

#import "DiagnosticPage.h"
#import "DiagnosisMainSubPage.h"
#import "DiagnosisClass.h"

@interface DiagnosticPage ()

@end

@implementation DiagnosticPage

#pragma mark Event Button menu
- (void)evnetPage:(UIButton *)sender
{
    [actView startAnimating];
    DiagnosisMainSubPage *dmsPage = [[DiagnosisMainSubPage alloc]init];
    DiagnosisClass *diagnosisClass = [[DiagnosisClass alloc]init];
    [diagnosisClass getDiagnosisWhitID:[NSString stringWithFormat:@"%li",(long)sender.tag] completion:^(NSMutableDictionary *completion) {
        
        NSLog(@"result :%@",completion[@"result"]);
        [actView stopAnimating];
        if([completion[@"result"] count] == 0){
            
            UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"พบข้อผิดพลาด"
                                                              message:@"ไม่พบข้อมูลในระบบ"
                                                             delegate:self
                                                    cancelButtonTitle:@"ปิด"
                                                    otherButtonTitles:nil];
            [alerView show];
        }else{
            dmsPage.dataPassing = [[NSMutableDictionary alloc]init];
            [dmsPage.dataPassing setDictionary:completion];
            dmsPage.strMainID = [NSString stringWithFormat:@"%li",(long)sender.tag];
            [self.navigationController pushViewController:dmsPage animated:YES];
        
        }
    }];
    //NSLog(@"Event");
}

-(void)eventHome{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


-(void)eventBlack
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    
    //---- set BG NAV-----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg-nav-Diagnosis.png"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)LoadUI{
    
    CGSize sc = [[UIScreen mainScreen] bounds].size;
    
    //========== SET BG ===========//
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_menu.png"]]];
    
    
    
    //---- set BG NAV-----//
    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];
    
    
    //========== ShowHead Navigation
    UIImageView  *imgNavigation = [[UIImageView alloc]initWithFrame:CGRectMake(-16, -16, sc.width, 85)];
    [imgNavigation setBackgroundColor:[UIColor clearColor]];
    [imgNavigation setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    
    
    //========== Image & Label Head
    UIImageView  *ImgHead = [[UIImageView alloc]initWithFrame:CGRectMake(-16, -16,sc.width,94)];
    [ImgHead setBackgroundColor:[UIColor clearColor]];
    [ImgHead setImage:[UIImage imageNamed:@"bg-nav-Diagnosis.png"]];
    
    
    
    
    [self.navigationItem setLeftBarButtonItem:nil animated:NO];
    
    
    int y =40;
    
    
    //---------End NAV----------//
    
    //-------Menu-----//
    UIScrollView *scv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, sc.width, sc.height)];
    [scv setDelegate:self];
    [scv setScrollEnabled:YES];
    [scv setBackgroundColor:[UIColor clearColor]];
    
    
    //------- BUTTON Menu News ------//
    UIButton *btnNews = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnNews setFrame:CGRectMake(20, y+24, 124, 120)];
    [btnNews setBackgroundColor:[UIColor clearColor]];
    [btnNews setImage:[UIImage imageNamed:@"btnplants1.png"] forState:UIControlStateNormal];
    [btnNews addTarget:self action:@selector(evnetPage:) forControlEvents:UIControlEventTouchUpInside];
    [btnNews setTag:1];
    [scv addSubview:btnNews];
    
    
    
    
    //------- BUTTON Menu วินิฉัยเบื้องต้น ------//
    UIButton *btnHabit = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnHabit setFrame:CGRectMake(180, y+24, 124, 120)];
    [btnHabit setBackgroundColor:[UIColor clearColor]];
    [btnHabit setImage:[UIImage imageNamed:@"btnplants2.png"] forState:UIControlStateNormal];
    [btnHabit addTarget:self action:@selector(evnetPage:) forControlEvents:UIControlEventTouchUpInside];
    [btnHabit setTag:2];
    [scv addSubview:btnHabit];
    y = btnHabit.frame.size.height + btnHabit.frame.origin.y;
    
    //---------------Line 2---------//
    
    //------- BUTTON Menu วินิฉัยพืช ------//
    UIButton *btnHabit2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnHabit2 setFrame:CGRectMake(20, y+20, 124, 120)];
    [btnHabit2 setBackgroundColor:[UIColor clearColor]];
    [btnHabit2 setImage:[UIImage imageNamed:@"btnplants3.png"] forState:UIControlStateNormal];
    [btnHabit2 addTarget:self action:@selector(evnetPage:) forControlEvents:UIControlEventTouchUpInside];
    [btnHabit2 setTag:3];
    [scv addSubview:btnHabit2];
    
    
    
    
    
    //------- BUTTON Menu วินิฉัยเบื้องต้น ------//
    UIButton *btnWarning = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnWarning setFrame:CGRectMake(180, y+20, 124, 120)];
    [btnWarning setBackgroundColor:[UIColor clearColor]];
    [btnWarning setImage:[UIImage imageNamed:@"btnplants4.png"] forState:UIControlStateNormal];
    [btnWarning addTarget:self action:@selector(evnetPage:) forControlEvents:UIControlEventTouchUpInside];
    [btnWarning setTag:4];
    [scv addSubview:btnWarning];
    y = btnWarning.frame.size.height + btnWarning.frame.origin.y;
    
    
    
    //----set contean scv---//
    [scv setContentSize:CGSizeMake(sc.width, y+50)];
    [self.view addSubview:scv];
    
    
    
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
    
    
    //-- ******* --//
    //-- LOADING --//
    //-- ******* --//
    actView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake((sc.width-50)/2,
                                                                        (sc.height-50)/2,
                                                                        50,
                                                                        50)];
    [actView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
    [actView setBackgroundColor:[UIColor blackColor]];
    [actView.layer setCornerRadius:3];
    //[actView startAnimating];
    [actView setAlpha:0.6];
    [self.view addSubview:actView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self LoadUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
