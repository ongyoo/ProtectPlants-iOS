//
//  DiagnosisiSuperSubPage.h
//  ProtectPlants
//
//  Created by komsit on 11/13/2557 BE.
//  Copyright (c) 2557 EaseCode Co.Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

@interface DiagnosisiSuperSubPage : UIViewController
<
    UIScrollViewDelegate
>
{
    
}
@property (nonatomic,strong)NSMutableDictionary *dataPassingSuperSub;
@property (nonatomic,strong)NSString *strTile;
@end
