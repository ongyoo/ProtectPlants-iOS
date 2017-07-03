//
//  DiagnosisSubPage.m
//  ProtectPlants
//
//  Created by komsit on 11/12/2557 BE.
//  Copyright (c) 2557 EaseCode Co.Ltd. All rights reserved.
//

#import "DiagnosisSubPage.h"
#import "DiagnosisClass.h"
#import "DiagnosisiSuperSubPage.h"

@interface DiagnosisSubPage ()
{
    UILabel *lblTile;
    UIActivityIndicatorView *actView;
}
@end

@implementation DiagnosisSubPage


#pragma mark Event Button menu
- (void)evnetPage:(UIButton *)sender
{
    [actView startAnimating];
    DiagnosisiSuperSubPage *dissPage = [[DiagnosisiSuperSubPage alloc]init];
    DiagnosisClass *diagnosisClass = [[DiagnosisClass alloc]init];
    [diagnosisClass getDiagnosisSub3WhitMainID:_dataPassingSub[@"result"][sender.tag-1][@"plants_key"] completion:^(NSMutableDictionary *completion) {
        
        [actView stopAnimating];
        if([completion[@"result"] count] == 0){
            
            UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"พบข้อผิดพลาด"
                                                              message:@"ไม่พบข้อมูลในระบบ"
                                                             delegate:self
                                                    cancelButtonTitle:@"ปิด"
                                                    otherButtonTitles:nil];
            [alerView show];
        }else{
            
        
            dissPage.dataPassingSuperSub = [[NSMutableDictionary alloc]init];
            [dissPage.dataPassingSuperSub setDictionary:completion];
            dissPage.strTile = _dataPassingSub[@"result"][sender.tag-1][@"title"];
            [self.navigationController pushViewController:dissPage animated:YES];
        }
    }];
    
    NSLog(@"Event");
}

-(void)eventHome{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


-(void)eventBlack
{
    [self.navigationController popViewControllerAnimated:YES];
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
    [lblTile setText:_strTile];
    [lblTile setFont:[UIFont systemFontOfSize:20]];
    y = dotRedView.frame.size.height + dotRedView.frame.origin.y;
    [scv addSubview:lblTile];
    
    for(int idx = 0; [_dataPassingSub[@"result"] count]-1 >= idx; idx++){
        
        //------- BUTTON Menu News ------//
        UIButton *btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
        [btnMenu setFrame:CGRectMake(40, y+24, 238, 30)];
        [btnMenu setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_green.png"]]];
        [btnMenu setTitle:_dataPassingSub[@"result"][idx][@"title"] forState:UIControlStateNormal];
        [btnMenu addTarget:self action:@selector(evnetPage:) forControlEvents:UIControlEventTouchUpInside];
        [btnMenu setTag:idx+1];
        y = btnMenu.frame.size.height + btnMenu.frame.origin.y;
        [scv addSubview:btnMenu];
    }
    
    //----set contean scv---//
    [scv setContentSize:CGSizeMake(sc.width, y+70)];
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
    //NSLog(@"Data :%@",_dataPassingSub[@"result"]);
    //NSLog(@"Data2 :%@",_dataPassingSub[@"result"][@"title"]);
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

