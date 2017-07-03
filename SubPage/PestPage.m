//
//  PestPage.m
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/7/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import "PestPage.h"
#import "PestPicture.h"
#import "CropClass.h"

@interface PestPage ()
{
    NSMutableDictionary *tbData;
}
@end

@implementation PestPage

- (void)eventHome{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)eventBlack
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    //---- set BG NAV-----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_Pest.png"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void) LoadData{
    
    tbData = [[NSMutableDictionary alloc]init];
    CropClass *cropClass = [[CropClass  alloc]init];
    [cropClass getFeedCatID:[NSString stringWithFormat:@"%@",_arrayDataMenu[0]]
                   WhitPage:1
                 completion:^(NSMutableDictionary *completion) {
                     
                     tbData = completion;
                    // NSLog(@"completion :%@",completion[@"result"]);
                     [tbView reloadData];
        
    }];
    
}

-(void)loadUI
{
    
    CGSize sc = [[UIScreen mainScreen] bounds].size;
    //========== SET BG ===========//
    [self.view setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
    
    //---- set BG NAV-----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_Pest.png"] forBarMetrics:UIBarMetricsDefault];
    
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
    
    
    
    ///------- TableView----//
    tbView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, sc.width, sc.height-42) style:UITableViewStylePlain];
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
    [self loadUI];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TabbleViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tbData[@"result"] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)getPost:(NSString *)cellIdentifier
{
    //--***************--//
    //----- Bg Cell ----//
    //--*************--//
    
    //------ImgView----//
    
    UIImageView *displayImgView = [[UIImageView alloc]initWithFrame:CGRectMake(35, 8, 80, 80)];
    [displayImgView setBackgroundColor:[UIColor clearColor]];
    [[displayImgView layer]setCornerRadius:displayImgView.frame.size.height/2];
    [displayImgView.layer setMasksToBounds:YES];
    [displayImgView setContentMode:UIViewContentModeScaleAspectFill];
    [displayImgView setClipsToBounds:YES];
    //displayImgView.layer.shadowColor = [UIColor blackColor].CGColor;
    //displayImgView.layer.shadowOffset = CGSizeMake(4, 4);
    displayImgView.userInteractionEnabled = YES;
    [displayImgView setTag:101];
    
    
    //-----Title----//
    UILabel *lblTile = [[UILabel alloc]initWithFrame:CGRectMake(120, 34, 200, 80)];
    [lblTile setBackgroundColor:[UIColor clearColor]];
    [lblTile setTextColor:[UIColor blackColor]];
    [lblTile setFont:[UIFont fontWithName:@"Helvetica Neue" size:14]];
    [lblTile setTextAlignment:NSTextAlignmentCenter];
    [lblTile setLineBreakMode:NSLineBreakByWordWrapping];
    [lblTile setNumberOfLines:7];
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
    
    CropClass *cropClass = [[CropClass  alloc]init];
    UIImageView *displayImgView =(UIImageView *)[cell viewWithTag:101];
    [cropClass loadImage:[NSURL URLWithString:[NSString stringWithFormat:@"%@",tbData[@"result"][indexPath.row][@"content_pic1"]]] completion:^(UIImage *image){
        
        //[displayImgView setImage:image];
        [displayImgView setImage:image];
    }];
    
    
    
    
    
    UILabel *lblTile  =(UILabel *)[cell viewWithTag:102];
    [lblTile setText:tbData[@"result"][indexPath.row][@"content_name"]];
    //[lblTile sizeToFit];

    
   
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = indexPath.row;
    PestPicture * PestPictureData = [[PestPicture alloc]init];
    PestPictureData.arrayPestData = [[NSMutableDictionary alloc]init];
    [PestPictureData.arrayPestData setObject:[NSString stringWithFormat:@"%lo",(long)index] forKey:@"IDPage"];
    [PestPictureData.arrayPestData setObject:tbData[@"result"][indexPath.row] forKey:@"result"];
    
    [self.navigationController  pushViewController:PestPictureData animated:YES];
    
    
}

@end
