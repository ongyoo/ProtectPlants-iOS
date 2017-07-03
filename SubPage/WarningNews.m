//
//  WarningNews.m
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/8/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import "WarningNews.h"
#import "WarningNewsDetail.h"
#import "NewsClass.h"
@interface WarningNews ()
{
    NSMutableArray *data;
}
@end

@implementation WarningNews

- (void)eventHome{
    

    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)eventBlack
{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    //---- set BG NAV-----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_Warning.png"] forBarMetrics:UIBarMetricsDefault];
}

- (void) LoadData{
    data = [[NSMutableArray alloc]init];
    NewsClass *newsClass = [[NewsClass alloc]init];
    [newsClass getNewsWeekcompletion:^(NSMutableDictionary *completion){
        //NSLog(@"NewsWeek Data :%@",completion[@"result"][0][@"news_title"]);
        data = completion[@"result"];
        NSLog(@"Data :%lo",(unsigned long)[data count]);
        
        [tbView reloadData];
    }];
}

- (void)LoadUI{
    
    CGSize sc = [[UIScreen mainScreen] bounds].size;
    //========== SET BG ===========//
    [self.view setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    
    
    //---- set BG NAV โปร่งใส-----//
    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];
    
    //========== Nav bg โปร่งใส ===========//
    UIImageView  *imgNavigation = [[UIImageView alloc]initWithFrame:CGRectMake(-16, -16, sc.width, 85)];
    [imgNavigation setBackgroundColor:[UIColor clearColor]];
    [imgNavigation setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    
    //========== Nav bg Image ========//
    UIImageView  *ImgHead = [[UIImageView alloc]initWithFrame:CGRectMake(-16, -16,sc.width,94)];
    [ImgHead setBackgroundColor:[UIColor clearColor]];
    [ImgHead setImage:[UIImage imageNamed:@"Nav_Warning.png"]];
    
    
    //=========== Set navigation back Nil ===========//
    [self.navigationItem setLeftBarButtonItem:nil animated:NO];
    
    //============ นำภาพมาซ้อนกัน ==============//
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
  
    
    
    ///------- TableView----//
    tbView = [[UITableView alloc]initWithFrame:CGRectMake(0, 29, sc.width, sc.height-71) style:UITableViewStylePlain];
    [tbView setBackgroundColor:[UIColor clearColor]];
    [tbView setDataSource:self];
    [tbView setDelegate:self];
    [self.view addSubview:tbView];
    
    
    
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



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self LoadData];
    [self LoadUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark TabbleViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}

- (UITableViewCell *)getPost:(NSString *)cellIdentifier
{
    //--***************--//
    //----- Bg Cell ----//
    //--*************--//
    
    //------ImgView----//
    
    UIImageView *displayImgView = [[UIImageView alloc]initWithFrame:CGRectMake(28, 7.5, 40, 40)];
    [displayImgView setBackgroundColor:[UIColor clearColor]];
    [[displayImgView layer]setCornerRadius:2];
    [displayImgView.layer setMasksToBounds:YES];
    [displayImgView setContentMode:UIViewContentModeScaleAspectFill];
    [displayImgView setClipsToBounds:YES];
    displayImgView.userInteractionEnabled = YES;
    [displayImgView setTag:101];
    
    //-----Title----//
    UILabel *lblTile = [[UILabel alloc]initWithFrame:CGRectMake(88, 0, 220, 50)];
    [lblTile setBackgroundColor:[UIColor clearColor]];
    lblTile.lineBreakMode = NSLineBreakByWordWrapping;
    lblTile.numberOfLines = 2;
    [lblTile setTextColor:[UIColor blackColor]];
    lblTile.font = [UIFont fontWithName:@"Helvetica Neue" size:14.0];
    [lblTile setTextAlignment:NSTextAlignmentLeft];
    [lblTile setTag:102];
    
    
    
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:cellIdentifier];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setBackgroundColor:[UIColor clearColor]];
    [cell.contentView addSubview:displayImgView];
    [cell.contentView addSubview:lblTile];
    
    
    
    
    return cell;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [self getPost:CellIdentifier];
        
        
    }
    
    UIImageView *displayImgView =(UIImageView *)[cell viewWithTag:101];
    [displayImgView setImage:[UIImage imageNamed:@"icon-Week.png"]];
    
    
    UILabel *lblTile  =(UILabel *)[cell viewWithTag:102];
    [lblTile setText:data[indexPath.row][@"news_title"]];
    
   
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    WarningNewsDetail * warningNewsDetail = [[WarningNewsDetail alloc]init];
    warningNewsDetail.arrayWarningData = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%lo",(long)index],data[indexPath.row], nil];
    
  
    [self.navigationController  pushViewController:warningNewsDetail animated:NO];
    
    
}


@end
