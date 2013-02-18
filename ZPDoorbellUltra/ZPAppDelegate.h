//
//  ZPAppDelegate.h
//  ZPDoorbellUltra
//
//  Created by Doug Feigelson on 8/23/12.
//  Copyright (c) 2012 Doug Feigelson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZPViewController;

@interface ZPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ZPViewController *viewController;

@end
