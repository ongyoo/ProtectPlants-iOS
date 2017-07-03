//
//  About.m
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/12/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import "About.h"
@interface About ()

@end

@implementation About


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
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_About.png"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void) LoadData{
    
}

- (void) LoadUI{
    
    
    CGSize sc = [[UIScreen mainScreen] bounds].size;
    
    //----- set BG------//
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_menu.png"]]];
    
    //---- set BG NAV-----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_About.png"] forBarMetrics:UIBarMetricsDefault];
    
    
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
    int y =45;
    
    
  
    //============== Image Logo
    UIImageView *ImageLogo = [[UIImageView alloc]initWithFrame:CGRectMake(25, y+5, 120 ,120)];
    [ImageLogo setImage:[UIImage imageNamed:@"icon_logo.png"]];
    [scv addSubview:ImageLogo];
    
    //============== Image Care
    UIImageView *ImagCare = [[UIImageView alloc]initWithFrame:CGRectMake(150, y+45, 160 ,45)];
    [ImagCare setImage:[UIImage imageNamed:@"text_care.png"]];
    [scv addSubview:ImagCare];
    y = ImagCare.frame.size.height + ImagCare.frame.origin.y;
    
    
    //============== Label วัตถุประสงค์
    UILabel *Label1 = [[UILabel alloc]initWithFrame:CGRectMake(30, y+40, 260, 40)];
    [Label1 setBackgroundColor:[UIColor clearColor]];
    [Label1 setTextColor:[UIColor blackColor]];
    [Label1 setText:@"วัตถุประสงค์"];
    [Label1 setTintColor:[UIColor clearColor]];
    [Label1 setTextColor:[UIColor whiteColor]];
    Label1.font = [UIFont fontWithName:@"Helvetica Neue" size:22.0];
    [Label1 setTextAlignment:NSTextAlignmentLeft];
    [scv addSubview:Label1];
    y = Label1.frame.size.height + Label1.frame.origin.y;
    
    //============== Label วัตถุประสงค์ รายละเอียดข้อมูล
    UILabel *Label2 = [[UILabel alloc]initWithFrame:CGRectMake(30, y-12, 260, 40)];
    [Label2 setBackgroundColor:[UIColor clearColor]];
    [Label2 setTextColor:[UIColor blackColor]];
    Label2.lineBreakMode = NSLineBreakByWordWrapping;
    Label2.numberOfLines = 2;
    [Label2 setText:[NSString stringWithFormat:@"%@%@%@",@"''",@"กรมส่งเสริมการเกษตรเป็นองค์กรที่มุ่งมั่นในการ ส่งเสริมและพัฒนาให้เกษตรกรอยู่ดีมีความสุขอย่างยั่งยืน",@"''"]];
    [Label2 setTintColor:[UIColor clearColor]];
    [Label2 setTextColor:[UIColor whiteColor]];
    Label2.font = [UIFont fontWithName:@"Helvetica Neue" size:14.0];
    [Label2 setTextAlignment:NSTextAlignmentLeft];
    [scv addSubview:Label2];
    y = Label2.frame.size.height + Label2.frame.origin.y;
    
    
    
    
    //============== Label พันธกิจ
    UILabel *lblDetail = [[UILabel alloc]initWithFrame:CGRectMake(30, y+10, 260, 40)];
    [lblDetail setBackgroundColor:[UIColor clearColor]];
    [lblDetail setTextColor:[UIColor blackColor]];
    [lblDetail setText:@"พันธกิจ"];
    [lblDetail setTintColor:[UIColor clearColor]];
    [lblDetail setTextColor:[UIColor whiteColor]];
    lblDetail.font = [UIFont fontWithName:@"Helvetica Neue" size:22.0];
    [lblDetail setTextAlignment:NSTextAlignmentLeft];
    [scv addSubview:lblDetail];
    y = lblDetail.frame.size.height + lblDetail.frame.origin.y;
    
    //============== Label คณะผู้จัดทำ รายละเอียดข้อมูล
    UILabel *lblSubDetail = [[UILabel alloc]initWithFrame:CGRectMake(30, y-12, 260, 174)];
    [lblSubDetail setBackgroundColor:[UIColor clearColor]];
    [lblSubDetail setTextColor:[UIColor blackColor]];
    lblSubDetail.lineBreakMode = NSLineBreakByWordWrapping;
    lblSubDetail.numberOfLines = 20;
    [lblSubDetail setText:@"๑. ส่งเสริมและพัฒนาเกษตรกรให้มีความเข็มแข็งและสามารถพึ่งพาตนเองได้\n๒. ส่งเสริมและพัฒนาเกษตรกรให้มีขีดความสามารถในการผลิตและจัดการสินค้าเกษตรตามความต้องการของตลาด\n๓. ให้บริการทางการเกษตรและผลิตปัจจัยทางการเกษตรเพื่อสนับสนุนและจำหน่ายแก่เกษตรกรและหน่วยงานที่เกี่ยวข้อง\n๔. ศึกษา วิจัย และพัฒนางานด้านการส่งเสริมการเกษตรและบูรณาการ การทำงานกับทุกภาคส่วน"];
    [lblSubDetail setTintColor:[UIColor clearColor]];
    [lblSubDetail setTextColor:[UIColor whiteColor]];
    lblSubDetail.font = [UIFont fontWithName:@"Helvetica Neue" size:14.0];
    [lblSubDetail setTextAlignment:NSTextAlignmentLeft];
    [scv addSubview:lblSubDetail];
    y = lblSubDetail.frame.size.height + lblSubDetail.frame.origin.y;
    
    //============== Label คณะผู้จัดทำ
    UILabel *Label3 = [[UILabel alloc]initWithFrame:CGRectMake(30, y+10, 260, 40)];
    [Label3 setBackgroundColor:[UIColor clearColor]];
    [Label3 setTextColor:[UIColor blackColor]];
    [Label3 setText:@"คณะผู้จัดทำ"];
    [Label3 setTintColor:[UIColor clearColor]];
    [Label3 setTextColor:[UIColor whiteColor]];
    Label3.font = [UIFont fontWithName:@"Helvetica Neue" size:22.0];
    [Label3 setTextAlignment:NSTextAlignmentLeft];
    [scv addSubview:Label3];
    y = Label3.frame.size.height + Label3.frame.origin.y;
    
    //============== Label คณะผู้จัดทำ รายละเอียดข้อมูล
    UILabel *Label4 = [[UILabel alloc]initWithFrame:CGRectMake(30, y-12, 260, 50)];
    [Label4 setBackgroundColor:[UIColor clearColor]];
    [Label4 setTextColor:[UIColor blackColor]];
    Label4.lineBreakMode = NSLineBreakByWordWrapping;
    Label4.numberOfLines = 3;
    [Label4 setText:@"สำนักพัฒนาการถ่ายทอดเทคโนโลยี\nกองส่งเสิมอารักขาพืชและจัดการดินปุ๋ย\nกองแผนงาน"];
    [Label4 setTintColor:[UIColor clearColor]];
    [Label4 setTextColor:[UIColor whiteColor]];
    Label4.font = [UIFont fontWithName:@"Helvetica Neue" size:14.0];
    [Label4 setTextAlignment:NSTextAlignmentLeft];
    [scv addSubview:Label4];
    y = Label4.frame.size.height + Label4.frame.origin.y;
    
    
    
    
    
    //============== Label ข้อมูลอ้างอิง
    UILabel *Label5 = [[UILabel alloc]initWithFrame:CGRectMake(30, y+15, 260, 40)];
    [Label5 setBackgroundColor:[UIColor clearColor]];
    [Label5 setTextColor:[UIColor blackColor]];
    [Label5 setText:@"ข้อมูลอ้างอิง"];
    [Label5 setTintColor:[UIColor clearColor]];
    [Label5 setTextColor:[UIColor whiteColor]];
    Label5.font = [UIFont fontWithName:@"Helvetica Neue" size:22];
    [Label5 setTextAlignment:NSTextAlignmentLeft];
    [scv addSubview:Label5];
    y = Label5.frame.size.height + Label5.frame.origin.y;
    
    
    //============== Image Logo
    UIImageView *ImageLogos = [[UIImageView alloc]initWithFrame:CGRectMake(30, y+5, 70 ,70)];
    [ImageLogos setImage:[UIImage imageNamed:@"icon-agriculture.png"]];
    [scv addSubview:ImageLogos];
   
    //============== Image Detail
    UIImageView *ImageDetail = [[UIImageView alloc]initWithFrame:CGRectMake(110, y+33, 188 ,23)];
    [ImageDetail setImage:[UIImage imageNamed:@"text_kaset"]];
    [scv addSubview:ImageDetail];
    y = ImageDetail.frame.size.height + ImageDetail.frame.origin.y;
    
 
    
    
    
    [scv setContentSize:CGSizeMake(sc.width, y+60)];
    [self.view addSubview:scv];
    
}





- (void)viewDidLoad
{
    [super viewDidLoad];
    [self LoadData];
    [self addScrollView];
    [self LoadUI];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
