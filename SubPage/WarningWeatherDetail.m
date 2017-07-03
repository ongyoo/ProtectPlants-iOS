//
//  WarningWeatherDetail.m
//  ProtectPlants
//
//  Created by Shotiwan Wattanalarpz on 9/8/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import "WarningWeatherDetail.h"
#import <Social/Social.h>
#import "HomePage.h"
#import "WeatherClass.h"
#import <FacebookSDK/FacebookSDK.h>
#import <MessageUI/MessageUI.h>

@interface WarningWeatherDetail ()<MFMailComposeViewControllerDelegate>
{

    UIScrollView *myScrollView;
    NSDictionary *dataTable;
    
}
@end

@implementation WarningWeatherDetail



-(void)eventHome{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)eventBlack
{
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)viewWillDisappear:(BOOL)animated
{
    //---- set BG NAV-----//
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Nav_Warning.png"] forBarMetrics:UIBarMetricsDefault];
    
}




- (void) LoadData{
    
    dataTable = [[NSDictionary alloc]init];
    dataTable = _arrayWarningWeaterData[1];

}

- (void) LoadUI{
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
    int y =10;
    
    
    
    //---------- Label Head-----------//
    UILabel *lblTile = [[UILabel alloc]initWithFrame:CGRectMake(50, y+5, 220, 40)];
    [lblTile setBackgroundColor:[UIColor clearColor]];
    [lblTile setTextColor:[UIColor blackColor]];
    lblTile.lineBreakMode = NSLineBreakByWordWrapping;
    lblTile.numberOfLines = 2;
    lblTile.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:16];
    [lblTile setText:dataTable[@"weather_title"]];
    [lblTile setTextAlignment:NSTextAlignmentCenter];
    [scv addSubview:lblTile];
    y = lblTile.frame.size.height + lblTile.frame.origin.y;
    
    //---------- Label Detail -----------//
    
    UITextView *txtDetail = [[UITextView alloc]initWithFrame:CGRectMake(35, y, 250, 280)];
    [txtDetail setBackgroundColor:[UIColor clearColor]];
    [txtDetail setText:dataTable[@"weather_detail"]];
    [txtDetail setFont:[UIFont fontWithName:@"Helvetica Neue" size:13.0]];
    [txtDetail setEditable:NO];
    [txtDetail sizeToFit];
    [scv addSubview:txtDetail];
    y = txtDetail.frame.size.height + txtDetail.frame.origin.y;
    
    

    
    //==================  UI Button Share
    
    UIButton *btnfacebook = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect frame4 = CGRectMake(sc.width-80,y+10,27.5,27.5);
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
    CGRect frame5 = CGRectMake(sc.width-50,y+10,27.5,27.5);
    [btnemail setFrame: frame5];
    [btnemail setBackgroundImage:[UIImage imageNamed:@"Email.png"] forState:UIControlStateNormal];
    btnemail.imageView.contentMode = UIViewContentModeCenter;
    [[btnemail layer]setCornerRadius:3];
    [[btnemail layer]setMasksToBounds:YES];
    [btnemail setContentMode:UIViewContentModeScaleAspectFill];
    [btnemail setTag:2];
    [btnemail addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [scv addSubview:btnemail];
    
    [scv setContentSize:CGSizeMake(sc.width, y+65)];
    [self.view addSubview:scv];
    
}



- (void)buttonClicked:(UIButton *)sender{
    /*
    
    //SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    if(sender.tag == 1){
        
        //-------Sherd Facebook
        
        NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       dataTable[@"weather_title"], @"name",
                                       @"", @"caption",
                                       dataTable[@"weather_detail"], @"description",
                                       @"http://agri-media.com/", @"link",
                                       @"http://www.khonkaen.doae.go.th/images/button/doae_logo.gif", @"picture",
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
        
        
        NSString *emailTitle = dataTable[@"weather_title"];
        // Email Content
        NSString *messageBody =  dataTable[@"weather_detail"];
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
