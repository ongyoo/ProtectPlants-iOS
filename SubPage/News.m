//
//  News.m
//  Work
//
//  Created by Shotiwan Wattanalarpz on 9/5/14.
//  Copyright (c) 2014 easecode. All rights reserved.
//

#import "News.h"
#import "NewsDetail.h"
#import "NewsClass.h"



@interface News ()
{
    NSMutableArray *data;
    NSMutableArray *dataPicture;
    UITableView *tbView;

}
@end

@implementation News

- (void)eventHome{

    [self.navigationController popToRootViewControllerAnimated:NO];
}

-(void)eventBlack
{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    //---- set BG NAV-----//
    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];
}

- (void)LoadData{

    
    currenPage =1;
    
    //============ Json
    // @"http://agri-media.com/api_feed/news?page=1"
    
    //----get News json data
    NSMutableArray *longData = [[NSMutableArray alloc]init];
    
    [actView startAnimating];
    NewsClass *newsClass = [[NewsClass alloc]init];
    [newsClass getNewsWhitPage:currenPage completion:^(NSMutableDictionary *completion) {
        if([completion[@"result"] count] != 0){
            data = [[NSMutableArray alloc]init];
            [data addObject:completion[@"result"]];
            [longData addObject:data[0]];
            
            [data removeAllObjects];
            [data addObjectsFromArray:longData[0]];
            //NSLog(@"Data :%@",data);
            //NSLog(@"Data :%@",data[0][3][@"news_title"]);
            //NSLog(@"Data count:%lo",[data count]);
            [tbView reloadData];
        }
        
    }];
    //NSLog(@"get Data :%@",data);
    [actView stopAnimating];
    
    

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
    [ImgHead setImage:[UIImage imageNamed:@"Nav_new.png"]];
    
    
    
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
    
    
    
    //======= TableView Cell =========//
    tbView = [[UITableView alloc]initWithFrame:CGRectMake(0,35, sc.width, (sc.height-76)) style:UITableViewStylePlain];
    [tbView setBackgroundColor:[UIColor whiteColor]];
    [tbView setSeparatorColor:[UIColor colorWithRed:0.50 green:(0.90) blue:(0.0) alpha:(1.0)]];
    [tbView setDataSource:self];
    [tbView setDelegate:self];
    [tbView setShowsVerticalScrollIndicator:YES];
    [tbView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
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


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self LoadData];
    [self LoadUI];
    

 
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



#pragma mark TabbleViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [data count];
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 175.0;
}


- (UITableViewCell *)getPost:(NSString *)cellIdentifier
{
    //--***************--//
    //----- Bg Cell ----//
    //--*************--//
    
    //------ImgView----//
    
    //-------- Picture icon News
    UIImageView *displayicon = [[UIImageView alloc]initWithFrame:CGRectMake(17, 7, 50, 50)];
    [displayicon setBackgroundColor:[UIColor clearColor]];
    [[displayicon layer]setCornerRadius:2];
    [[displayicon layer]setMasksToBounds:YES];
    [displayicon setContentMode:UIViewContentModeScaleAspectFill];
    [displayicon setTag:101];
    
    //-------- Picture Image
    UIImageView *displayView = [[UIImageView alloc]initWithFrame:CGRectMake(85, 35, 210, 130)];
    [displayView setBackgroundColor:[UIColor clearColor]];
    [[displayView layer]setCornerRadius:2];
    [[displayView layer]setMasksToBounds:YES];
    [displayView setContentMode:UIViewContentModeScaleAspectFill];
    [displayView setTag:102];
    
    //---------- Label
    UILabel *lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(85, -3, 210, 40)];
    [lblTitle setBackgroundColor:[UIColor clearColor]];
    lblTitle.lineBreakMode = NSLineBreakByWordWrapping;
    lblTitle.numberOfLines = 2;
    [lblTitle setTextColor:[UIColor blackColor]];
    lblTitle.font = [UIFont fontWithName:@"Helvetica Neue" size:12.5];
    [lblTitle setTag:103];
    
    //select มีสี
    UIView *goldenColor = [[UIView alloc] init];
    goldenColor.backgroundColor = [UIColor colorWithRed:0.024 green:0.650    blue:0.200 alpha:0.15];
    //cell.selectedBackgroundView = goldenColor;
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                   reuseIdentifier:cellIdentifier];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    [cell setBackgroundColor:[UIColor clearColor]];
    [cell.contentView addSubview:displayicon];
    [cell.contentView addSubview:displayView];
    [cell.contentView addSubview:lblTitle];
 
    
    return cell;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellLeft";
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        cell = [self getPost:CellIdentifier];
        
    }

    
    UIImageView *displayicon =(UIImageView *)[cell viewWithTag:101];
    [displayicon setImage:[UIImage imageNamed:@"icon-Neww.png"]];
    

    
    UIImageView *displayImgView = (UIImageView *)[cell viewWithTag:102];
    NewsClass *newsClass = [[NewsClass  alloc]init];
    [newsClass loadImage:[NSURL URLWithString:[NSString stringWithFormat:@"%@",data[indexPath.row][@"news_pic1"]]] completion:^(UIImage *image){
        
        [displayImgView setImage:image];
    }];
    
    
    UILabel *lblTile  = (UILabel *)[cell viewWithTag:103];
    [lblTile setText:data[indexPath.row][@"news_title"]];
   
    
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSInteger index = indexPath.row;
    NewsDetail * NewsDetails = [[NewsDetail alloc]init];
    NewsDetails.arrayNewsDetailData = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%lo",(long)index],data[indexPath.row], nil];
    
    [self.navigationController  pushViewController:NewsDetails animated:NO];

  
    
}


#pragma UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offs = (scrollView.contentOffset.y+scrollView.bounds.size.height);
    float val = (scrollView.contentSize.height);
    if (offs==val)
    {
        if(!actView.isAnimating){
            [self loadMoreData];
            
        }
    }
}


- (void)loadMoreData
{
    
    NSLog(@"currenPage :%i",currenPage);
    if(!morePage)
    {
        currenPage++;
        //currenPage--;
        [actView startAnimating];
        NewsClass *newsClass = [[NewsClass alloc]init];
        NSMutableArray *longData = [[NSMutableArray alloc]init];
        NSMutableArray *longData2 = [[NSMutableArray alloc]init];
        [newsClass getNewsWhitPage:currenPage completion:^(NSMutableDictionary *completion)
         {
             [actView stopAnimating];
             
             if(data.count > 0){
                 [longData2 addObject:completion[@"result"]];
                 [longData addObject:longData2[0]];
                 
                 
                 [data addObjectsFromArray:longData[0]];
                 //NSLog(@"Data :%@",data);
                 NSLog(@"Data count:%lo",(unsigned long)[data count]);
                 [longData removeAllObjects];
                 [longData2 removeAllObjects];
                 
             }else{
                 morePage = YES;
             }
             [tbView reloadData];
         }];
        
    }
}
@end
