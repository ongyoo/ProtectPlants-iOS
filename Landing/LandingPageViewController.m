//
//  LandingPageViewController.m
//  ProtectPlants
//
//  Created by komsit on 9/6/14.
//  Copyright (c) 2014 EaseCode Co.Ltd. All rights reserved.
//

#import "LandingPageViewController.h"
#import "AppDelegate.h"

@interface LandingPageViewController ()

@end

@implementation LandingPageViewController


-(void)loadUI
{
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_loading.png"]]];
    
}

-(void)nextPage
{
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    delegate.window.rootViewController = delegate.nav;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadUI];
    //------- Timer  นับถอยหลังเวลา------//
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self
                                   selector:@selector(nextPage)
                                   userInfo:nil
                                    repeats:NO];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
