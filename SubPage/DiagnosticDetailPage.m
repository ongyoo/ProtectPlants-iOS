//
//  DiagnosticDetailPage.m
//  ProtectPlants
//
//  Created by komsit on 11/13/2557 BE.
//  Copyright (c) 2557 EaseCode Co.Ltd. All rights reserved.
//

#import "DiagnosticDetailPage.h"
#import "DiagnosisClass.h"
#import <FacebookSDK/FacebookSDK.h>
#import <MessageUI/MessageUI.h>

@interface DiagnosticDetailPage () <MFMailComposeViewControllerDelegate>
{
    UILabel *lblTile;
    UIActivityIndicatorView *actView;

}
@end

@implementation DiagnosticDetailPage

-(void)eventHome{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


-(void)eventBlack
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loadUI
{
    CGSize sc = [[UIScreen mainScreen] bounds].size;
    
    //========== SET BG ===========//
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    
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
    
    
    //------ Lable Tile----//
    lblTile = [[UILabel alloc]initWithFrame:CGRectMake((sc.width/2)-50, y, 100, 22)];
    [lblTile setBackgroundColor:[UIColor clearColor]];
    [lblTile setText:@"สาเหตุเกิดจาก"];
    [lblTile setFont:[UIFont systemFontOfSize:20]];
    [lblTile setTextColor:[UIColor colorWithRed:0.360 green:0.678 blue:0.360 alpha:0.8]];
    [lblTile sizeToFit];
    y = lblTile.frame.size.height + lblTile.frame.origin.y;
    [scv addSubview:lblTile];
    
    //----lbl for box
    UILabel*lblDetail1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 8, 100, 22)];
    [lblDetail1 setBackgroundColor:[UIColor clearColor]];
    [lblDetail1 setText:_dataPassingDetail[@"plants_sub_1"]];
    [lblDetail1 setFont:[UIFont systemFontOfSize:14]];
    [lblDetail1 setTextColor:[UIColor colorWithRed:0.360 green:0.678 blue:0.360 alpha:0.8]];
    [lblDetail1 sizeToFit];
    
    
    //----Box---//
    UIView *boxView = [[UIView alloc]initWithFrame:CGRectMake((sc.width/2)-(lblDetail1.frame.size.width/2), y+4, lblDetail1.frame.size.width+20, 40)];
    [boxView setBackgroundColor:[UIColor colorWithRed:0.909 green:0.803 blue:0 alpha:1]];
    [[boxView layer]setCornerRadius:10];
    y = boxView.frame.size.height + boxView.frame.origin.y;
    [boxView addSubview:lblDetail1];
    [scv addSubview:boxView];
    
    //-----TEXTVIEW----//
    UITextView *txtDetailView = [[UITextView alloc]initWithFrame:CGRectMake(10, y+4, sc.width-20, 100)];
    [txtDetailView setBackgroundColor:[UIColor clearColor]];
    [txtDetailView setTextColor:[UIColor colorWithRed:0.360 green:0.678 blue:0.360 alpha:0.8]];
    [txtDetailView setScrollEnabled:NO];
    [txtDetailView setEditable:NO];
    [txtDetailView setText:_dataPassingDetail[@"plants_detail_1"]];
    [txtDetailView setFont:[UIFont systemFontOfSize:14]];
    [txtDetailView sizeToFit];
    y = txtDetailView.frame.size.height + txtDetailView.frame.origin.y;
    [scv addSubview:txtDetailView];
    
    
    //----lbl for เชื้อสาเหตุ
    UILabel*lblTileDetail2 = [[UILabel alloc]initWithFrame:CGRectMake(10, y+10, 100, 22)];
    [lblTileDetail2 setBackgroundColor:[UIColor clearColor]];
    [lblTileDetail2 setText:@"เชื้อสาเหตุ"];
    [lblTileDetail2 setFont:[UIFont systemFontOfSize:14]];
    [lblTileDetail2 setTextColor:[UIColor colorWithRed:0.360 green:0.678 blue:0.360 alpha:0.8]];
    [lblTileDetail2 sizeToFit];
    
    //----lbl for เชื้อสาเหตุ
    UILabel*lblDetail2 = [[UILabel alloc]initWithFrame:CGRectMake(80, y+10, 100, 22)];
    [lblDetail2 setBackgroundColor:[UIColor clearColor]];
    [lblDetail2 setText:_dataPassingDetail[@"plants_sub_2"]];
    [lblDetail2 setFont:[UIFont systemFontOfSize:14]];
    [lblDetail2 setTextColor:[UIColor blackColor]];
    [lblDetail2 sizeToFit];
    y = lblDetail2.frame.size.height + lblDetail2.frame.origin.y;
    [scv addSubview:lblDetail2];
    [scv addSubview:lblTileDetail2];
    
    
    //---- imge box---//
    UIScrollView *scvImage = [[UIScrollView alloc]initWithFrame:CGRectMake(10, y+10, sc.width-20, 250)];
    [scvImage setDelegate:self];
    [scvImage setScrollEnabled:YES];
    [scvImage setPagingEnabled:YES];
    [scvImage setBackgroundColor:[UIColor clearColor]];
    
    for(int idx = 1; idx<=3; idx++){
        UIImageView *detailImgView = [[UIImageView alloc]init];
        [detailImgView setBackgroundColor:[UIColor clearColor]];
        
        
        if([_dataPassingDetail[[NSString stringWithFormat:@"plants_img_0%i",idx]] length]-1 > 0){
            
            NSString *URL = _dataPassingDetail[[NSString stringWithFormat:@"plants_img_0%i",idx]];
            NSLog(@"URL :%@",URL);
            DiagnosisClass *diagnosisClass = [[DiagnosisClass alloc]init];
            
            if(idx != 1){
                
                [detailImgView setFrame:CGRectMake(300*(idx-1), 0, sc.width-20, 250)];
                
            }else{
                
                [detailImgView setFrame:CGRectMake(0, 0, sc.width-20, 250)];
            }
            
            
            
            
            //-- load image----//
            
            [diagnosisClass loadImage:[NSURL URLWithString:URL] completion:^(UIImage *image) {
                
                [detailImgView setImage:image];
            }];
            
        }
        [scvImage addSubview:detailImgView];
        [scvImage setContentSize:CGSizeMake(320*(idx-1), 250)];
    }
    [scv addSubview:scvImage];
    y = scvImage.frame.size.height + scvImage.frame.origin.y;
    
    
    //----- Detail3 ลักษณอาการ ----//
    //----lbl for เชื้อสาเหตุ
    UILabel*lblTileDetail3 = [[UILabel alloc]initWithFrame:CGRectMake(10, y+4, 100, 22)];
    [lblTileDetail3 setBackgroundColor:[UIColor clearColor]];
    [lblTileDetail3 setText:@"ลักษณะอาการ"];
    [lblTileDetail3 setFont:[UIFont systemFontOfSize:16]];
    [lblTileDetail3 setTextColor:[UIColor colorWithRed:0.360 green:0.678 blue:0.360 alpha:0.8]];
    [lblTileDetail3 sizeToFit];
    y = lblTileDetail3.frame.size.height + lblTileDetail3.frame.origin.y;
    [scv addSubview:lblTileDetail3];
    
    //---- Detail4 TextView--//
    UITextView *textDetail4View = [[UITextView alloc]initWithFrame:CGRectMake(10, y+2, sc.width-20, 100)];
    [textDetail4View setBackgroundColor:[UIColor clearColor]];
    [textDetail4View setTextColor:[UIColor blackColor]];
    [textDetail4View setScrollEnabled:NO];
    [textDetail4View setEditable:NO];
    [textDetail4View setText:_dataPassingDetail[@"plants_title"]];
    [textDetail4View setFont:[UIFont systemFontOfSize:14]];
    [textDetail4View sizeToFit];
    y = textDetail4View.frame.size.height + textDetail4View.frame.origin.y;
    [scv addSubview:textDetail4View];
    
    
    
    
    //----- Detail3 ลักษณอาการ ----//
    //----lbl for การป้องกันและกำจัด
    UILabel*lblTileDetail4 = [[UILabel alloc]initWithFrame:CGRectMake(10, y+4, 100, 22)];
    [lblTileDetail4 setBackgroundColor:[UIColor clearColor]];
    [lblTileDetail4 setText:@"การป้องกันและกำจัด"];
    [lblTileDetail4 setFont:[UIFont systemFontOfSize:16]];
    [lblTileDetail4 setTextColor:[UIColor colorWithRed:0.360 green:0.678 blue:0.360 alpha:0.8]];
    [lblTileDetail4 sizeToFit];
    y = lblTileDetail4.frame.size.height + lblTileDetail4.frame.origin.y;
    [scv addSubview:lblTileDetail4];
    
    //---- Detail4 TextView--//
    UITextView *textDetail5View = [[UITextView alloc]initWithFrame:CGRectMake(10, y+2, sc.width-20, 100)];
    [textDetail5View setBackgroundColor:[UIColor clearColor]];
    [textDetail5View setTextColor:[UIColor blackColor]];
    [textDetail5View setScrollEnabled:NO];
    [textDetail5View setEditable:NO];
    [textDetail5View setText:_dataPassingDetail[@"plants_detail_2"]];
    [textDetail5View setFont:[UIFont systemFontOfSize:14]];
    [textDetail5View sizeToFit];
    y = textDetail5View.frame.size.height + textDetail5View.frame.origin.y;
    [scv addSubview:textDetail5View];
    
    
    
    
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
    
    //----set contean scv---//
    [scv setContentSize:CGSizeMake(sc.width, y+90)];
    
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
    NSLog(@"Data :%@",_dataPassingDetail);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
    [self loadData];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)buttonClicked:(UIButton *)sender{
    
    /*
    //SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    if(sender.tag == 1){
        
        //-------Sherd Facebook
        
        NSMutableDictionary *params = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       _dataPassingDetail[@"plants_sub_1"], @"name",
                                       @"", @"caption",
                                       _dataPassingDetail[@"plants_detail_1"], @"description",
                                       @"http://agri-media.com/", @"link",
                                       _dataPassingDetail[@"plants_img_01"], @"picture",
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
        
        
        NSString *emailTitle = _dataPassingDetail[@"plants_sub_1"];
        // Email Content
        NSString *messageBody =  _dataPassingDetail[@"plants_detail_1"];
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

@end
