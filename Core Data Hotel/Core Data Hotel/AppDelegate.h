//
//  AppDelegate.h
//  Core Data Hotel
//
//  Created by Kristen Kozmary on 9/7/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CoreDataStack;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CoreDataStack *coreDataStack;
@property (strong, nonatomic) UINavigationController *navController;

@end

