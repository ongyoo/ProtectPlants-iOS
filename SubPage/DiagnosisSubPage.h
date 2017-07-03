//
//  DiagnosisSubPage.h
//  ProtectPlants
//
//  Created by komsit on 11/12/2557 BE.
//  Copyright (c) 2557 EaseCode Co.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiagnosisSubPage : UIViewController
<
    UIScrollViewDelegate
>
@property (nonatomic,strong)NSMutableDictionary *dataPassingSub;
@property (nonatomic,strong)NSString *strID;
@property (nonatomic,strong)NSString *strTile;

@end
