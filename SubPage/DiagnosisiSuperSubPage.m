//
//  DiagnosisiSuperSubPage.m
//  ProtectPlants
//
//  Created by komsit on 11/13/2557 BE.
//  Copyright (c) 2557 EaseCode Co.Ltd. All rights reserved.
//

#import "DiagnosisiSuperSubPage.h"
#import "DiagnosticDetailPage.h"

@interface DiagnosisiSuperSubPage ()
{
    UILabel *lblTile;
    UIActivityIndicatorView *actView;
    UITextView *textDetailView;
}
@end

@implementation DiagnosisiSuperSubPage

#pragma mark Event Button menu
- (void)evnetPage:(UIButton *)sender
{
    //[actView startAnimating];
    DiagnosticDetailPage *diagnosticDetailPage = [[DiagnosticDetailPage alloc]init];
    diagnosticDetailPage.dataPassingDetail = [[NSMutableDictionary alloc]init];
    [diagnosticDetailPage.dataPassingDetail setDictionary:_dataPassingSuperSub[@"result"][0][[NSString stringWithFormat:@"%li",(long)sender.tag]]];
    [self.navigationController pushViewController:diagnosticDetailPage animated:YES];
    //NSLog(@"Event :%@",_dataPassingSuperSub[@"result"][0][[NSString stringWithFormat:@"%i",sender.tag]]);
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
    lblTile = [[UILabel alloc]initWithFrame:CGRectMake(70, y+4, 100, 22)];
    [lblTile setBackgroundColor:[UIColor clearColor]];
    [lblTile setText:_strTile];
    [lblTile setFont:[UIFont systemFontOfSize:20]];
    y = dotRedView.frame.size.height + dotRedView.frame.origin.y;
    [scv addSubview:lblTile];
    
    //------ Lable Tile----//
    UILabel*lblSubTile = [[UILabel alloc]initWithFrame:CGRectMake(70, y+4, 100, 22)];
    [lblSubTile setBackgroundColor:[UIColor clearColor]];
    [lblSubTile setText:@":: เลือกลักษณะอาการที่เกิดขึ้น ::"];
    [lblSubTile setFont:[UIFont systemFontOfSize:16]];
    [lblSubTile sizeToFit];
    y = lblSubTile.frame.size.height + lblSubTile.frame.origin.y;
    [scv addSubview:lblSubTile];
    
    for(int idx = 0; [_dataPassingSuperSub[@"result"][0] count]-1 >= idx; idx++){
        
        if([_dataPassingSuperSub[@"result"][0][[NSString stringWithFormat:@"%i",idx+1]][@"plants_detail_1"] length] > 10){
            textDetailView = [[UITextView alloc]initWithFrame:CGRectMake(20, y+24, sc.width-40, 100)];
            [textDetailView setBackgroundColor:[UIColor colorWithRed:0.929 green:0.929 blue:0.701 alpha:0.8]];
            [textDetailView setScrollEnabled:NO];
            [textDetailView setFont:[UIFont systemFontOfSize:16]];
            [textDetailView setTextColor:[UIColor blackColor]];
            [[textDetailView layer] setCornerRadius:20];
            [textDetailView setText:_dataPassingSuperSub[@"result"][0][[NSString stringWithFormat:@"%i",idx+1]][@"plants_title"]];
            [textDetailView sizeToFit];
            
    
            //------- BUTTON Menu News ------//
            UIButton *btnMenu = [UIButton buttonWithType:UIButtonTypeCustom];
            [btnMenu setFrame:CGRectMake(0, 0, textDetailView.frame.size.width, textDetailView.frame.size.height)];
            [btnMenu setBackgroundColor:[UIColor clearColor]];
            //        [btnMenu setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_green.png"]]];
            //        [btnMenu setTitle:_dataPassingSuperSub[@"result"][idx][@"title"] forState:UIControlStateNormal];
            [btnMenu addTarget:self action:@selector(evnetPage:) forControlEvents:UIControlEventTouchUpInside];
            [btnMenu setTag:idx+1];
            y = textDetailView.frame.size.height + textDetailView.frame.origin.y;
            [textDetailView addSubview:btnMenu];
            
        }
        [scv addSubview:textDetailView];
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
    NSLog(@"Super Data :%@",_dataPassingSuperSub[@"result"][0]);
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
