//
//  Search.m
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/8/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import "Search.h"
#import "SearchDetail.h"
#import "SearchClass.h"

@interface Search ()
{
    UITextField *searchTextField;
}
@end

@implementation Search

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
    
}

- (void) LoadUI{
    

    CGSize sc = [[UIScreen mainScreen] bounds].size;
    
    //----- set BG------//
    //[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-menu.png"]]];
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
    
    
    int y=70;
    
    // ================= TextField Search
     searchTextField =[[UITextField alloc]initWithFrame:CGRectMake(30, y+55, 260, 33)];
     [searchTextField setBackgroundColor:[UIColor whiteColor]];
     searchTextField.tintColor = [UIColor lightGrayColor];
     [searchTextField setLeftViewMode:UITextFieldViewModeNever];
     searchTextField.layer.borderWidth=2.0;
     searchTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
     searchTextField.layer.cornerRadius = 18.0f;
     searchTextField.returnKeyType =UIReturnKeyDone;
     searchTextField.placeholder =@"ใส่คำค้นหา";
     searchTextField.delegate=self;
     [searchTextField setLeftViewMode:UITextFieldViewModeAlways];
    
    //======= Set Img TextField Left
     UIImageView *img =[[UIImageView alloc]initWithFrame:CGRectMake(15, 5, 27, 27)];
     [img setImage:[UIImage imageNamed:@"icon_searchs.png"]];
     searchTextField.leftView= img;
    
    //======= Set Img Button TextField right
    UIButton *theButton = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect frame1s = CGRectMake(15, 5, 33, 33);
    [theButton setFrame: frame1s];
    [theButton setImage:[UIImage imageNamed:@"icon_close.png"] forState:UIControlStateNormal];
    [theButton addTarget:self action:@selector(eventText:) forControlEvents:UIControlEventTouchUpInside];
    searchTextField.rightView = theButton;
    searchTextField.rightViewMode = UITextFieldViewModeAlways;
     [self.view addSubview:searchTextField];
    y = searchTextField.frame.size.height + searchTextField.frame.origin.y;
    
    
    
    
    
 
    
    
    /*
    // ================== Label ทั้งหมด
    UILabel *Label2 = [[UILabel alloc]initWithFrame:CGRectMake(80, y+10, 60, 25)];
    [Label2 setBackgroundColor:[UIColor clearColor]];
    [Label2 setTextColor:[UIColor whiteColor]];
    [Label2 setText:@"ทั้งหมด"];
    Label2.font = [UIFont fontWithName:@"Helvetica Neue" size:17.0];
    [Label2 setTextAlignment:NSTextAlignmentCenter];
    [Label2 sizeToFit];
    [self.view addSubview:Label2];
    
    // ================== Label หัวข้อ
    UILabel *Label3 = [[UILabel alloc]initWithFrame:CGRectMake(190 ,y+10, 70, 25)];
    [Label3 setBackgroundColor:[UIColor clearColor]];
    [Label3 setTextColor:[UIColor whiteColor]];
    [Label3 setText:@"หัวข้อเรื่อง"];
    Label3.font = [UIFont fontWithName:@"Helvetica Neue" size:17.0];
    [Label3 setTextAlignment:NSTextAlignmentCenter];
    [Label3 sizeToFit];
    [self.view addSubview:Label3];
    y = Label3.frame.size.height + Label3.frame.origin.y;
   */
    
    //============ Button Search
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect frame1 = CGRectMake(79, y+20, 162, 33);
    [btn1 setFrame: frame1];
    [btn1 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_search.png"]]];
    [[btn1 layer]setCornerRadius:2];
    [[btn1 layer]setMasksToBounds:YES];
    [btn1 setContentMode:UIViewContentModeScaleAspectFill];
    [btn1 setTag:10011];
    [btn1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    y = btn1.frame.size.height + btn1.frame.origin.y;
    
    
    //============== Image Logo
    UIImageView *ImageLogos = [[UIImageView alloc]initWithFrame:CGRectMake(26, y+140, 60 ,60)];
    [ImageLogos setImage:[UIImage imageNamed:@"icon-agriculture.png"]];
    [self.view addSubview:ImageLogos];
    
    //============== Image Detail
    UIImageView *ImageDetail = [[UIImageView alloc]initWithFrame:CGRectMake(92, y+160, 188 ,23)];
    [ImageDetail setImage:[UIImage imageNamed:@"text_kaset.png"]];
    [self.view addSubview:ImageDetail];
   
}

- (void)eventText:(UIButton *)sender{
    [searchTextField setText:nil];
}
- (void)buttonClicked:(UIButton *)sender{
    
    NSLog(@"searchTextField :%@",searchTextField.text);
    //---- ค้นหา
    SearchClass *searchClass = [[SearchClass alloc]init];
    [searchClass getSearch:[searchTextField text] completion:^(NSMutableDictionary *completion) {
        
        if([completion[@"result"] count] != 0){
            SearchDetail *searchDetail = [[SearchDetail alloc]init];
            searchDetail.dataDic = [[NSMutableDictionary alloc]initWithDictionary:completion];
            [self.navigationController pushViewController:searchDetail animated:YES];
            
        }else{
            UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:nil
                                                              message:@"ไม่พบข้อมูล"
                                                             delegate:self
                                                    cancelButtonTitle:@"ปิด"
                                                    otherButtonTitles:nil];
            [alerView show];
        }
        
    }];
    
    

}

-(void)dismissKeyboard
{
    [searchTextField resignFirstResponder];
    
}



- (void)HidkeyBoard{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    
}
#pragma mark textField
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self HidkeyBoard];
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
