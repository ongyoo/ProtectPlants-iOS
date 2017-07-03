//
//  SearchDetail.m
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/16/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import "SearchDetail.h"
#import "NewsDetail.h"
#import "NewsClass.h"

@interface SearchDetail ()
{
    UITableView *tbView;
}

@end

@implementation SearchDetail

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
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_Search.png"] forBarMetrics:UIBarMetricsDefault];
    
    
    
}

- (void) LoadData{
    NSLog(@"Dta :%@",_dataDic);
    NSLog(@"result :%@",_dataDic[@"result"]);
}

- (void) LoadUI{
    
    
    CGSize sc = [[UIScreen mainScreen] bounds].size;
    
    //----- set BG------//
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_menu.png"]]];
    
    //---- set BG NAV-----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_Search.png"] forBarMetrics:UIBarMetricsDefault];
    
    
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
    
    
    //======= TableView Cell =========//
    tbView = [[UITableView alloc]initWithFrame:CGRectMake(0,35, sc.width, (sc.height-76)) style:UITableViewStylePlain];
    [tbView setBackgroundColor:[UIColor clearColor]];
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

    
}

#pragma mark TabbleViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataDic[@"result"] count];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 175.0;
//}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Set the data for this cell:
    [cell.textLabel setText:_dataDic[@"result"][indexPath.row][@"title"]];
    [cell.detailTextLabel setTextColor:[UIColor redColor]];
    [cell setBackgroundColor:[UIColor clearColor]];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if([_dataDic[@"result"][indexPath.row][@"type"]isEqualToString:@"news"]){
        
        NewsClass*newsClass = [[NewsClass alloc]init];
        NewsDetail *newsDetail = [[NewsDetail alloc]init];
        
        [newsClass getNewsDetailWhitID:_dataDic[@"result"][indexPath.row][@"id"] completion:^(NSMutableDictionary *completion) {
            
            NSMutableArray *data = [[NSMutableArray alloc]init];
            NSMutableArray *longData = [[NSMutableArray alloc]init];
            [data addObject:completion[@"result"]];
            [longData addObject:data[0]];
            
            [data removeAllObjects];
            [data addObjectsFromArray:longData[0]];
            newsDetail.arrayNewsDetailData = [[NSMutableArray alloc]initWithObjects:[NSString stringWithFormat:@"%lo",(long)index],data[0], nil];
            [self.navigationController  pushViewController:newsDetail animated:NO];
        }];
        
        
        
        
    }else if ([_dataDic[@"result"][indexPath.row][@"type"]isEqualToString:@"content"]){
        
    }
    
    
    
    
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


@end
