//
//  BookReservationViewController.m
//  Core Data Hotel
//
//  Created by Kristen Kozmary on 9/8/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

#import "BookReservationViewController.h"
#import "AppDelegate.h"
#import "Reservations.h"
#import "Room.h"
#import "CoreDataStack.h"

@interface BookReservationViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation BookReservationViewController

- (void)loadView {
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];
  
  UITableView *tableView = [[UITableView alloc] initWithFrame:rootView.frame style:UITableViewStylePlain];
  self.tableView = tableView;
  [tableView setTranslatesAutoresizingMaskIntoConstraints:false];
  [rootView addSubview:tableView];
  tableView.backgroundColor = [UIColor colorWithRed:122.0/255.0 green:97.0/255.0 blue:149.0/255.0 alpha:1];
  
  
  NSDictionary *views = @{@"tableView" : tableView};
  
  NSArray *tableViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[tableView]|" options:0 metrics:nil views:views];
  [rootView addConstraints:tableViewVerticalConstraints];
  NSArray *tableViewHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[tableView]|"options:0 metrics:nil views:views];
  [rootView addConstraints:tableViewHorizontalConstraints];
  self.view = rootView;
  
}
- (void)viewDidLoad {
    [super viewDidLoad];

  self.tableView.dataSource = self;
  self.tableView.delegate = self;
  
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"BookCell"];
  
  
NSDate *arrivalDate = [NSDate date];
NSDate *departureDate = [NSDate dateWithTimeInterval:86400 * 2 sinceDate:[NSDate date]];


[self fetchAvailableRoomsForFromDate:arrivalDate toDate:departureDate];
// Do any additional setup after loading the view.
}

-(NSArray *)fetchAvailableRoomsForFromDate:(NSDate*)fromDate toDate:(NSDate *)toDate {
  
  AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
  
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservations"];
  
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"arrivalDate <= %@ AND departureDate >= %@",toDate,fromDate];
  request.predicate = predicate;
  NSError *fetchError;
  NSArray *results = [appDelegate.coreDataStack.managedObjectContext executeFetchRequest:request error:&fetchError];
  
  NSMutableArray *badRooms = [[NSMutableArray alloc] init];
  for (Reservations *reservation in results) {
    [badRooms addObject:reservation.room];
  }
  
  NSFetchRequest *finalRequest = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
  NSPredicate *finalPredicate = [NSPredicate predicateWithFormat:@"NOT self IN %@", badRooms];
  finalRequest.predicate = finalPredicate;
  
  NSError *finalError;
  
  NSArray *finalResults = [appDelegate.coreDataStack.managedObjectContext executeFetchRequest:finalRequest error:&finalError];
  
  if (finalError) {
    return nil;
  }
  return finalResults;
  
}

-(void)bookTestReservation {
  
  AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
  
  Reservations *reservation = [NSEntityDescription insertNewObjectForEntityForName:@"Reservations" inManagedObjectContext:appDelegate.coreDataStack.managedObjectContext];
  
  reservation.arrivalDate = [NSDate date];
  reservation.departureDate = [NSDate dateWithTimeInterval:86400 * 2 sinceDate:[NSDate date]];
  
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Room"];
  fetchRequest.predicate = [NSPredicate predicateWithFormat:@"number == 2"];
  NSError *fetchError;
  NSArray *results = [appDelegate.coreDataStack.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
  if (results.count > 0) {
    Room *room = results.firstObject;
    reservation.room = room;
    NSError *saveError;
    if (![appDelegate.coreDataStack.managedObjectContext save:&saveError]) {
      NSLog(@"%@",saveError.localizedDescription);
    }
    
  }
  
  
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookCell"];
  return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}


@end
