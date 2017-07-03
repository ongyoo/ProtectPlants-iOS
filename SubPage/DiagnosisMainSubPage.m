//
//  DiagnosisMainSubPage.m
//  ProtectPlants
//
//  Created by komsit on 11/12/2557 BE.
//  Copyright (c) 2557 EaseCode Co.Ltd. All rights reserved.
//

#import "DiagnosisMainSubPage.h"
#import "DiagnosisSubPage.h"
#import "DiagnosisClass.h"

@interface DiagnosisMainSubPage ()
{
    UILabel *lblTile;
    UIActivityIndicatorView *actView;
}
@end

@implementation DiagnosisMainSubPage

#pragma mark Event Button menu
- (void)evnetPage:(UIButton *)sender
{
    [actView startAnimating];
    DiagnosisSubPage *diagnosisSubPage = [[DiagnosisSubPage alloc]init];
    DiagnosisClass *diagnosisClass = [[DiagnosisClass alloc]init];
    [diagnosisClass getDiagnosisSubWhitMainID:_strMainID
                                   whitMenuID:[NSString stringWithFormat:@"%li",(long)sender.tag]
                                   completion:^(NSMutableDictionary *completion) {
                                       
                                       [actView stopAnimating];
                                       if([completion[@"result"] count] == 0){
                                           
                                           UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"พบข้อผิดพลาด"
                                                                                             message:@"ไม่พบข้อมูลในระบบ"
                                                                                            delegate:self
                                                                                   cancelButtonTitle:@"ปิด"
                                                                                   otherButtonTitles:nil];
                                           [alerView show];
                                       }else{
                                           NSLog(@"Event :%@",completion);
                                           
                                           
                                           diagnosisSubPage.dataPassingSub = [[NSMutableDictionary alloc]init];
                                           diagnosisSubPage.strID = [NSString stringWithFormat:@"%li",(long)sender.tag];
                                           diagnosisSubPage.strTile = [lblTile text];
                                           [diagnosisSubPage.dataPassingSub setDictionary:completion];
                                           [self.navigationController pushViewController:diagnosisSubPage animated:YES];
                                       }
                                       
                                       
    }];
    
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
    
    //-----Dot Red -----//
    UIImageView *dotRedView = [[UIImageView alloc]initWithFrame:CGRectMake(40, y, 30, 30)];
    [dotRedView setBackgroundColor:[UIColor clearColor]];
    [dotRedView setImage:[UIImage imageNamed:@"btn_red.png"]];
    [scv addSubview:dotRedView];
    
    //------ Lable Tile----//
    lblTile = [[UILabel alloc]initWithFrame:CGRectMake(70, y+4, 200, 22)];
    [lblTile setBackgroundColor:[UIColor clearColor]];
    [lblTile setText:@"พืช"];
    [lblTile setFont:[UIFont systemFontOfSize:20]];
    y = dotRedView.frame.size.height + dotRedView.frame.origin.y;
    [scv addSubview:lblTile];
    
    for(int idx = 0; [_dataPassing[@"result"] count]-1 >= idx; idx++){
        
        NSLog(@"IDX :%i",idx);
        //------- BUTTON Menu News ------//
        UIButton *btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnMenu setFrame:CGRectMake(40, y+24, 238, 30)];
        [btnMenu setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_green.png"]]];
        [btnMenu setTitle:_dataPassing[@"result"][idx][@"plants_name"] forState:UIControlStateNormal];
        [btnMenu addTarget:self action:@selector(evnetPage:) forControlEvents:UIControlEventTouchUpInside];
        [btnMenu setTag:[_dataPassing[@"result"][idx][@"plants_id"] integerValue]];
        y = btnMenu.frame.size.height + btnMenu.frame.origin.y;
        [scv addSubview:btnMenu];
    }
    
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

- (void)loadData
{
    NSLog(@"Data :%@",_dataPassing[@"result"]);
    NSLog(@"Data Count :%lu",(unsigned long)[_dataPassing[@"result"] count]);
    switch ([_dataPassing[@"result"][0][@"plants_head_menu"]integerValue]) {
        case 1:
            [lblTile setText:@"ข้าว-พืชไร่"];
            break;
            
        case 2:
            [lblTile setText:@"ไม้ดอก-ไม้ประดับ"];
            break;
        case 3:
            [lblTile setText:@"ไม้ผล-ไม้ยืนต้น"];
            break;
        case 4:
            [lblTile setText:@"ผัก"];
            break;
            
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self LoadUI];
    [self loadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
