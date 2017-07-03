//
//  PestPicture.m
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/7/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import "PestPicture.h"
#import "CropClass.h"
#import <Social/Social.h>
#import "NSObject+UIImage_Resize.h"
#import <FacebookSDK/FacebookSDK.h>
@interface PestPicture ()
{
    NSMutableArray *dataNameBtn;
}
@end

@implementation PestPicture
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
    NSLog(@"%@",_arrayPestData);
    
    NSLog(@"%@",_arrayPestData[@"result"][@"content_pic1"]);

    
    dataNameBtn = [[NSMutableArray alloc]initWithObjects:@"ชื่อวิทยาศาสตร์ :", @"Sycanus Collaris", @"ลักษณะทั่วไป :", @"ระยะที่ใช้ควบคุมศัตรูพืช :", @"ตัวอ่อน  - ตัวเต็มวัย", @"อัตราการใช้ :",nil];
    
}

- (void) LoadUI{


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
    
    
    
    //------- TABBAR HOME ---------//
    
    UIImageView *tabView = [[UIImageView alloc]initWithFrame:CGRectMake(0, sc.height-58, sc.width, 58)];
    [tabView setBackgroundColor:[UIColor clearColor]];
    [tabView setImage:[UIImage  imageNamed:@"tabbar.png"]];
    [self.view addSubview:tabView];
    
    UIButton *btnHome = [[UIButton alloc]initWithFrame:CGRectMake((sc.width-53)/2, sc.height-65, 60, 60)];
    [btnHome setBackgroundColor:[UIColor clearColor]];
    [btnHome setImage:[UIImage imageNamed:@"icon-home.png"] forState:UIControlStateNormal];
    [self.view addSubview:btnHome];

}


- (void)addScrollView{
 
    
    CGSize sc = [[UIScreen mainScreen] bounds].size;
    
    //================ UI ScrollView ===============//
    UIScrollView *scv = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, sc.width, sc.height-42)];
    [scv setDelegate:self];
    [scv setScrollEnabled:YES];
    [scv setBackgroundColor:[UIColor clearColor]];
    
    int y =10;
    
    //------- BUTTON  Head ------//
    UIButton *btnNews = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnNews setFrame:CGRectMake(63, y, 194, 40)];
    [btnNews setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-peast.png"]]];
    [btnNews setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnNews setTitle: _arrayPestData[@"result"][@"content_name"] forState:UIControlStateNormal];
    //[btnNews  sizeToFit];
    [btnNews setTag:1];
    [scv addSubview:btnNews];
    

    //--------Loop Image---------//
    for (int idx = 1; 3 > idx; idx++) {
        
        NSString * contentPic = [NSString stringWithFormat:@"content_pic%i",idx];
        if([_arrayPestData[@"result"][contentPic] length] != 0){
            
            

            CropClass *cropClass = [[CropClass  alloc]init];
            
            //---- Image Show 1-2
            UIImageView *titleImgView = [[UIImageView alloc]initWithFrame:CGRectMake(50, y+50/idx, 220, 144)];
            [titleImgView setBackgroundColor:[UIColor clearColor]];
            //        [titleImgView setImage:[UIImage imageNamed:dataPicture[idx]]];
            [[titleImgView layer]setCornerRadius:4];
            [[titleImgView layer]setMasksToBounds:YES];
            [titleImgView setContentMode:UIViewContentModeScaleAspectFill];
            
            
            [cropClass loadImage:[NSURL URLWithString:[NSString stringWithFormat:@"%@",_arrayPestData[@"result"][contentPic]]] completion:^(UIImage *image){
                
                //[displayImgView setImage:image];
                //[displayImgView setImage:image];
                
                [titleImgView setImage:image];
                //[titleImgView sizeToFit];
                [scv addSubview:titleImgView];
            }];
            
            
            y = titleImgView.frame.size.height + titleImgView.frame.origin.y;
            
            
            

        }
    }
    
    //---------- Label ชื่อใต้ภาพ -----------//
    UILabel *lblTile = [[UILabel alloc]initWithFrame:CGRectMake(50, y+2, 220, 20)];
    [lblTile setBackgroundColor:[UIColor clearColor]];
    [lblTile setTextColor:[UIColor blackColor]];
    lblTile.font = [UIFont fontWithName:@"Helvetica Neue" size:14.0];
    [lblTile setTextAlignment:NSTextAlignmentCenter];
    [lblTile setText: _arrayPestData[@"result"][@"content_name"]];
    [scv addSubview:lblTile];
    //y = lblTile.frame.size.height + lblTile.frame.origin.y;
    
  
    //------- BUTTON1 Head ชื่อวิทยาศาสตร์ ------//
    UIButton *btnNew1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnNew1 setFrame:CGRectMake(63, y+40, 194, 40)];
    [btnNew1 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-peast.png"]]];
    [btnNew1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnNew1 setTitle:dataNameBtn[0] forState:UIControlStateNormal];
    [btnNew1 setTag:1];
    [scv addSubview:btnNew1];
    y = btnNew1.frame.size.height + btnNew1.frame.origin.y;
    
    
    //---------- Label1 ชื่อทางวิทยาศาสตร์ -----------//
    UILabel *lblTile1 = [[UILabel alloc]initWithFrame:CGRectMake(50, y-8, 220, 40)];
    [lblTile1 setBackgroundColor:[UIColor clearColor]];
    [lblTile1 setTextColor:[UIColor blackColor]];
    lblTile1.font = [UIFont fontWithName:@"Helvetica Neue" size:14.0];
    [lblTile1 setTextAlignment:NSTextAlignmentCenter];
    [lblTile1 setText:_arrayPestData[@"result"][@"content_detail_1"]];
    //[lblTile1 sizeToFit];
    [lblTile1 setTag:101];
    [scv addSubview:lblTile1];
    y = lblTile1.frame.size.height + lblTile1.frame.origin.y;
    
    
    //------- BUTTON2 ลักษณะทั่วไป ------//
    UIButton *btnNew2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnNew2 setFrame:CGRectMake(63, y-8, 200, 40)];
    [btnNew2 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-peast.png"]]];
    [btnNew2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnNew2 setTitle: dataNameBtn[2] forState:UIControlStateNormal];
    [btnNew2 setTag:2];
    [scv addSubview:btnNew2];
    y = btnNew2.frame.size.height + btnNew2.frame.origin.y;
    
    
    //---------- Label2 รายละเอียด ลักษณะทั่ว -----------//
    UILabel *lblTile2 = [[UILabel alloc]initWithFrame:CGRectMake(27, y+5, 270, 150)];
    [lblTile2 setBackgroundColor:[UIColor clearColor]];
    lblTile2.lineBreakMode = NSLineBreakByWordWrapping;
    lblTile2.numberOfLines = 8;
    [lblTile2 setTextColor:[UIColor blackColor]];
    lblTile2.font = [UIFont fontWithName:@"Helvetica Neue" size:14.0];
    [lblTile2 setTextAlignment:NSTextAlignmentLeft];
    [lblTile2 setText:_arrayPestData[@"result"][@"content_detail_2"]];
    [lblTile2 sizeToFit];
    [lblTile2 setTag:102];
    [scv addSubview:lblTile2];
    y = lblTile2.frame.size.height + lblTile2.frame.origin.y;
    
    //------- BUTTON3  ระยะที่ใช้ควบคุมศัตรูพืช ------//
    UIButton *btnNew3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnNew3 setFrame:CGRectMake(63, y+5, 200, 40)];
    [btnNew3 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-peast.png"]]];
    [btnNew3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnNew3 setTitle: dataNameBtn[3] forState:UIControlStateNormal];
    [btnNew3 setTag:3];
    [scv addSubview:btnNew3];
    y = btnNew3.frame.size.height + btnNew3.frame.origin.y;
    
    
    //---------- Label3 รายละเอียดละยะ -----------//
    UILabel *lblTile3 = [[UILabel alloc]initWithFrame:CGRectMake(25, y+5, 270, 40)];
    [lblTile3 setBackgroundColor:[UIColor clearColor]];
    [lblTile3 setTextColor:[UIColor blackColor]];
    lblTile3.lineBreakMode = NSLineBreakByWordWrapping;
    lblTile3.numberOfLines = 8;
    lblTile3.font = [UIFont fontWithName:@"Helvetica Neue" size:14.0];
    [lblTile3 setTextAlignment:NSTextAlignmentCenter];
    [lblTile3 setText:_arrayPestData[@"result"][@"content_detail_3"]];
    [lblTile3 setTag:103];
    [scv addSubview:lblTile3];
    y = lblTile3.frame.size.height + lblTile3.frame.origin.y;
    
    
    //------- BUTTON4  อัตรการใช้ ------//
    UIButton *btnNew4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnNew4 setFrame:CGRectMake(63, y+5, 194, 40)];
    [btnNew4 setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg-peast.png"]]];
    [btnNew4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnNew4 setTitle: dataNameBtn[4] forState:UIControlStateNormal];
    [btnNew4 setTag:4];
    [scv addSubview:btnNew4];
    y = btnNew4.frame.size.height + btnNew4.frame.origin.y;
    
    
    //---------- Label4 รายละเอียด -----------//
    UILabel *lblTile4 = [[UILabel alloc]initWithFrame:CGRectMake(27, y+5, 270, 160)];
    [lblTile4 setBackgroundColor:[UIColor clearColor]];
    lblTile4.lineBreakMode = NSLineBreakByWordWrapping;
    lblTile4.numberOfLines = 2;
    [lblTile4 setTextColor:[UIColor blackColor]];
    lblTile4.font = [UIFont fontWithName:@"Helvetica Neue" size:14.0];
    [lblTile4 setTextAlignment:NSTextAlignmentLeft];
    [lblTile4 setText:_arrayPestData[@"result"][@"content_name"]];
    [lblTile4 sizeToFit];
    [lblTile4 setTag:104];
    [scv addSubview:lblTile4];
    y = lblTile4.frame.size.height + lblTile4.frame.origin.y;
    
    
    
    //==================  UI Button Share
    
    UIButton *btnfacebook = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect frame4 = CGRectMake(sc.width-95,y+5,27.5,27.5);
    [btnfacebook setFrame: frame4];
    [btnfacebook setBackgroundImage:[UIImage imageNamed:@"Facebook.png"] forState:UIControlStateNormal];
    btnfacebook.imageView.contentMode = UIViewContentModeCenter;
    [[btnfacebook layer]setCornerRadius:3];
    [[btnfacebook layer]setMasksToBounds:YES];
    [btnfacebook setContentMode:UIViewContentModeScaleAspectFill];
    [btnfacebook setTag:1];
    [btnfacebook addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scv addSubview:btnfacebook];
    
    
    UIButton *btnemail = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect frame5 = CGRectMake(sc.width-66,y+5,27.5,27.5);
    [btnemail setFrame: frame5];
    [btnemail setBackgroundImage:[UIImage imageNamed:@"Email.png"] forState:UIControlStateNormal];
    btnemail.imageView.contentMode = UIViewContentModeCenter;
    [[btnemail layer]setCornerRadius:3];
    [[btnemail layer]setMasksToBounds:YES];
    [btnemail setContentMode:UIViewContentModeScaleAspectFill];
    [btnemail setTag:2];
    [btnemail addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scv addSubview:btnemail];
    
    [scv setContentSize:CGSizeMake(sc.width, y+60)];
    [self.view addSubview:scv];
    
    
}

- (void)buttonClicked:(UIButton *)sender{
    
    /*
    //SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    if(sender.tag == 1){
        
        //-------Sherd Facebook
        
        NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       _arrayPestData[@"result"][@"content_name"], @"name",
                                       _arrayPestData[@"result"][@"content_detail_1"], @"caption",
                                       _arrayPestData[@"result"][@"content_detail_2"], @"description",
                                       @"http://agri-media.com/", @"link",
                                       _arrayPestData[@"result"][@"content_pic1"], @"picture",
                                       nil];
        
        // Invoke the dialog
        [FBWebDialogs presentFeedDialogModallyWithSession:nil
                                               parameters:params
                                                  handler:
         ^(FBWebDialogResult result, NSURL *resultURL, NSError *error) {
             if (error) {
                 // Error launching the dialog or publishing a story.
                 NSLog(@"Error publishing story.");
             } else {
                 if (result == FBWebDialogResultDialogNotCompleted) {
                     // User clicked the "x" icon
                     NSLog(@"User canceled story publishing.");
                 } else {
                     // Handle the publish feed callback
                     NSDictionary *urlParams = [self parseURLParams:[resultURL query]];
                     if (![urlParams valueForKey:@"post_id"]) {
                         // User clicked the Cancel button
                         NSLog(@"User canceled story publishing.");
                     } else {
                         // User clicked the Share button
                         NSString *msg = [NSString stringWithFormat:
                                          @"Posted story, id: %@",
                                          [urlParams valueForKey:@"post_id"]];
                         NSLog(@"%@", msg);
                         // Show the result in an alert
                         
                     }
                 }
             }
         }];
    }else{
        //-----Shred Email
        
        
        NSString *emailTitle = _arrayPestData[@"result"][@"content_name"];
        // Email Content
        NSString *messageBody =  _arrayPestData[@"result"][@"content_detail_2"];
        // To address
        NSArray *toRecipents = [NSArray arrayWithObject:@""];
        
        MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
        mc.mailComposeDelegate = self;
        [mc setSubject:emailTitle];
        [mc setMessageBody:messageBody isHTML:NO];
        [mc setToRecipients:toRecipents];
        
        // Present mail view controller on screen
        [self presentViewController:mc animated:YES completion:NULL];
        
        
    }
     */
    
}

/**
 * A function for parsing URL parameters.
 */
- (NSDictionary*)parseURLParams:(NSString *)query {
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    for (NSString *pair in pairs) {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        NSString *val =
        [kv[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        params[kv[0]] = val;
    }
    return params;
}

//----Event Sent Mail
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
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
