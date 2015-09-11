//
//  AppDelegate.m
//  Core Data Hotel
//
//  Created by Kristen Kozmary on 9/7/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "Hotel.h"
#import "Room.h"
#import "HotelListViewController.h"
#import "CoreDataStack.h"
#import "DatePickerViewController.h"
#import "BookReservationViewController.h"
#import "LookUpReservationsViewController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  NSDate *now = [NSDate date];
//  NSLog(@"%@",now);
//  NSDate *later = [NSDate dateWithTimeIntervalSinceNow:10];
//  NSLog(@"later time:%@", later);
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:now];
  NSLog(@"year is: %ld", (long)components.year);
//  components.year = 2016;
  NSDateComponents *newComponents = [[NSDateComponents alloc] init];
  newComponents.year = 1990;
  newComponents.day = 25;
  newComponents.month = 12;
  NSDate *christmas1990 = [calendar dateFromComponents:newComponents];
  NSLog(@"%@", christmas1990);
  NSError *saveError;
  BOOL result = [self.coreDataStack.managedObjectContext save:&saveError];
  if (!result) {
    NSLog(@"%@", saveError.localizedDescription);
  }
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
  NSError *fetchError;
  NSArray *results = [self.coreDataStack.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
  NSLog(@"%lu",(unsigned long)results.count);
  self.coreDataStack = [[CoreDataStack alloc] init];
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
      ViewController *viewController = [[ViewController alloc] init];
  UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self.window makeKeyAndVisible];
  [self.navController pushViewController:viewController animated:true];
  self.window.rootViewController = navController;
  return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
  // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
  // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
  // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
  // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
  // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
  // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
  // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  // Saves changes in the application's managed object context before the application terminates.
//  [self saveContext];
}

@end
