//
//  Contact.m
//  Work
//
//  Created by Shotiwan Wattanalarpz on 9/6/14.
//  Copyright (c) 2014 easecode. All rights reserved.
//

#import "Contact.h"
#import "ContactThx.h"
#import "UserClass.h"
@interface Contact ()

@end

@implementation Contact
{
    UITextField *txtName;
    UITextField *txtEmail;
    UITextField *txtTel;
    UITextField *txtTilte;
    UITextView *txtMsg;
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
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_Contact.png"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void) LoadData{
    
}

- (void) LoadUI{
    
    CGSize sc = [[UIScreen mainScreen] bounds].size;
    
    //----- set BG------//
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_about.png"]]];
    
    //---- set BG NAV-----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_Contact.png"] forBarMetrics:UIBarMetricsDefault];
    
    
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
    
    

    
}

- (void)addScrollView{

    CGSize sc = [[UIScreen mainScreen]bounds].size;
    
    UIScrollView *scv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, sc.width, sc.height-42)];
    [scv setDelegate:self];
    [scv setScrollEnabled:YES];
    [scv setBackgroundColor:[UIColor clearColor]];
    int y =30;
    

    
    
    
    //============ Label  ชื่อนามสกุล
    UILabel *Label1 = [[UILabel alloc]initWithFrame:CGRectMake(2, y+5, 110, 25)];
    [Label1 setBackgroundColor:[UIColor clearColor]];
    [Label1 setTextColor:[UIColor blackColor]];
    [Label1 setText:@"ชื่อ - นามสกุล : "];
    Label1.font = [UIFont fontWithName:@"Helvetica Neue" size:16.0];
    [Label1 setTextAlignment:NSTextAlignmentRight];
    [scv addSubview:Label1];

    txtName = [[UITextField alloc]initWithFrame:CGRectMake((Label1.frame.size.width)+14, y+5, 175, 25)];
    txtName.font = [UIFont fontWithName:@"Helvetica Neue" size:14.0];
    [txtName setBorderStyle:UITextBorderStyleRoundedRect];
    [txtName setReturnKeyType:UIReturnKeyDone];
    [txtName setDelegate:self];
    [scv addSubview:txtName];
    y = txtName.frame.size.height + txtName.frame.origin.y;
    
    
    //============= Label อีเมล์
    UILabel *Label2 = [[UILabel alloc]initWithFrame:CGRectMake(2, y+5, 110, 25)];
    [Label2 setBackgroundColor:[UIColor clearColor]];
    [Label2 setTextColor:[UIColor blackColor]];
    [Label2 setText:@"อีเมล์ : "];
    Label2.font = [UIFont fontWithName:@"Helvetica Neue" size:16.0];
    [Label2 setTextAlignment:NSTextAlignmentRight];
    [scv addSubview:Label2];
    
    txtEmail = [[UITextField alloc]initWithFrame:CGRectMake((Label1.frame.size.width)+14, y+5, 175, 25)];
    txtEmail.font = [UIFont fontWithName:@"Helvetica Neue" size:14.0];
    [txtEmail setBorderStyle:UITextBorderStyleRoundedRect];
    [txtEmail setKeyboardType:UIKeyboardTypeEmailAddress];
    [txtEmail setReturnKeyType:UIReturnKeyDone];
    [txtEmail setDelegate:self];
    [scv addSubview:txtEmail];
    y = txtEmail.frame.size.height + txtEmail.frame.origin.y;
    
    
    
    //============= Label โทรศัพท์
    UILabel *Label3 = [[UILabel alloc]initWithFrame:CGRectMake(2, y+5, 110, 25)];
    [Label3 setBackgroundColor:[UIColor clearColor]];
    [Label3 setTextColor:[UIColor blackColor]];
    [Label3 setText:@"โทรศัพท์ : "];
    Label3.font = [UIFont fontWithName:@"Helvetica Neue" size:16.0];
    [Label3 setTextAlignment:NSTextAlignmentRight];
    [scv addSubview:Label3];
    
    txtTel = [[UITextField alloc]initWithFrame:CGRectMake((Label1.frame.size.width)+14, y+5, 175, 25)];
    txtTel.font = [UIFont fontWithName:@"Helvetica Neue" size:14.0];
    [txtTel setBorderStyle:UITextBorderStyleRoundedRect];
    [txtTel setReturnKeyType:UIReturnKeyDone];
    [txtTel setDelegate:self];
    [scv addSubview:txtTel];
    y = txtTel.frame.size.height + txtTel.frame.origin.y;
    
    
    
    //============= Label เรื่อง
    UILabel *Label4 = [[UILabel alloc]initWithFrame:CGRectMake(2, y+5, 110, 25)];
    [Label4 setBackgroundColor:[UIColor clearColor]];
    [Label4 setTextColor:[UIColor blackColor]];
    [Label4 setText:@"เรื่อง : "];
    Label4.font = [UIFont fontWithName:@"Helvetica Neue" size:16.0];
    [Label4 setTextAlignment:NSTextAlignmentRight];
    [scv addSubview:Label4];
    
    txtTilte = [[UITextField alloc]initWithFrame:CGRectMake((Label1.frame.size.width)+14, y+5, 175, 25)];
    txtTilte.font = [UIFont fontWithName:@"Helvetica Neue" size:14.0];
    [txtTilte setBorderStyle:UITextBorderStyleRoundedRect];
    [txtTilte setReturnKeyType:UIReturnKeyDone];
    [txtTilte setDelegate:self];
    [scv addSubview:txtTilte];
    y = txtTilte.frame.size.height + txtTilte.frame.origin.y;
    
  
    
    
    //============== Label ข้อความ
    UILabel *Label5 = [[UILabel alloc]initWithFrame:CGRectMake(2, y+5, 110, 25)];
    [Label5 setBackgroundColor:[UIColor clearColor]];
    [Label5 setTextColor:[UIColor blackColor]];
    [Label5 setText:@"ข้อความ : "];
    Label5.font = [UIFont fontWithName:@"Helvetica Neue" size:16.0];
    [Label5 setTextAlignment:NSTextAlignmentRight];
    [scv addSubview:Label5];
    
    
    txtMsg = [[UITextView alloc]initWithFrame:CGRectMake((Label1.frame.size.width)+14, y+5, 175,100)];
    txtMsg.font = [UIFont fontWithName:@"Helvetica Neue" size:14.0];
    [txtMsg setReturnKeyType:UIReturnKeyDone];
    [scv addSubview:txtMsg];
    y = txtMsg.frame.size.height + txtMsg.frame.origin.y;
    
    
    //============ Button
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect frame1 = CGRectMake(sc.width-106, y+8, 84, 30);
    [btn1 setFrame: frame1];
    [btn1 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_submit.png"]]];
    [[btn1 layer]setCornerRadius:2];
    [[btn1 layer]setMasksToBounds:YES];
    [btn1 setContentMode:UIViewContentModeScaleAspectFill];
    [btn1 setTag:100111];
    [btn1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scv addSubview:btn1];
    y = btn1.frame.size.height + btn1.frame.origin.y;
    
    
    
    
    
    
    //============== Image Logo
    UIImageView *ImageLogo = [[UIImageView alloc]initWithFrame:CGRectMake(38, y-105, 70 ,70)];
    [ImageLogo setImage:[UIImage imageNamed:@"icon-agriculture.png"]];
    [scv addSubview:ImageLogo];
    y = ImageLogo.frame.size.height + ImageLogo.frame.origin.y;
    
    
    // ================== Label Detail
    UILabel *Label6 = [[UILabel alloc]initWithFrame:CGRectMake(40, y+55, 240, 100)];
    [Label6 setBackgroundColor:[UIColor clearColor]];
    [Label6 setTextColor:[UIColor blackColor]];
    Label6.lineBreakMode = NSLineBreakByWordWrapping;
    Label6.numberOfLines = 8;
    [Label6 setText:@"กลุ่มพัฒนาสื่อส่งเสริมการเกษตร\nสำนักพัฒนาการถ่ายทอดเทคโนโลยี\nกรมส่งเสริมการเกษตร 2143/1 ถนน พหลโยธิน\nเขตจตุจักร กรุงเทำมหานคร 10900"];
    Label6.font = [UIFont fontWithName:@"Helvetica Neue" size:12.0];
    [Label6 setTextAlignment:NSTextAlignmentCenter];
    [scv addSubview:Label6];
    y = Label6.frame.size.height + Label6.frame.origin.y;
    
    
    

    
    
    [scv setContentSize:CGSizeMake(sc.width, y+40)];
    [self.view addSubview:scv];

}


-(void)dismissKeyboard
{
    [txtName resignFirstResponder];
    [txtTel resignFirstResponder];
    [txtTilte resignFirstResponder];
    [txtEmail resignFirstResponder];
    [txtMsg resignFirstResponder];
}



- (void)buttonClicked:(UIButton *)sender{
    
    
    //----Check txt Null
    if([[txtEmail text]length] != 0
       && [[txtName text]length] != 0
       && [[txtTel text]length] != 0
       && [[txtTilte text]length] != 0
       && [[txtMsg text]length] != 0){
        
        
        UserClass *userClass = [[UserClass  alloc]init];
        [userClass setFeedbackWhitName:[txtName text]
                             WhitEmail:[txtEmail text]
                               WhitTel:[txtTel text]
                              WhitTile:[txtTilte text]
                               WhitMsg:[txtMsg text]
                            completion:^(BOOL completion){
                                
                                if(completion){
                                    
                                    ContactThx *contackthx = [[ContactThx alloc]init];
                                    [self.navigationController pushViewController:contackthx animated:YES];
                                    
                                }else{
                                    
                                    UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"Error"
                                                                                      message:@"Not Sent Data."
                                                                                     delegate:self
                                                                            cancelButtonTitle:nil
                                                                            otherButtonTitles:@"OK", nil];
                                    
                                    [alerView show];
                                }
                            }];
    }
    else{
        //---- Check
        UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"Error"
                                                          message:@"กรุณากรอกให้ครบด้วยค่ะ"
                                                         delegate:self
                                                cancelButtonTitle:nil
                                                otherButtonTitles:@"OK", nil];
        
        [alerView show];
    }
    
}


- (void)HidkeyBoard{
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self HidkeyBoard];
    [self LoadData];
    [self addScrollView];
    [self LoadUI];
}

#pragma mark textField
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
