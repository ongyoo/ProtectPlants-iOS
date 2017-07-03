//
//  News.h
//  Work
//
//  Created by Shotiwan Wattanalarpz on 9/5/14.
//  Copyright (c) 2014 easecode. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

@interface News : UIViewController
<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    int currenPage;                     //-- หน้าที่แสดงข้อมูลจาก SERVER
    BOOL lastPage;                      //-- เช็คว่าเป็นหน้าสุดท้ายหรือไม่ ถ้าใช่จะไม่โหลดเพิ่มอีก
    BOOL morePage;
    UIActivityIndicatorView *actView;
}

@end

