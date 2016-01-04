//
//  NDMVPViewController.h
//  NDRequest(MVP)
//
//  Created by NDMAC on 15/12/31.
//  Copyright © 2015年 NDEducation. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NDPresenter;

@interface NDMVPViewController : UIViewController

@property (nonatomic, strong) NDPresenter *presenter;
@property (weak, nonatomic) IBOutlet UITextView *appTextView;

@end
