//
//  ViewController.m
//  Core Data Hotel
//
//  Created by Kristen Kozmary on 9/7/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

#import "ViewController.h"
#import "HotelListViewController.h"
#import "AppDelegate.h"
#import "BookReservationViewController.h"
#import "LookUpReservationsViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@end

@implementation ViewController

NSArray *tableData;
- (void)loadView {
  UITableView *tableView = [[UITableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
  tableView.backgroundColor = [UIColor colorWithRed:122.0/255.0 green:97.0/255.0 blue:149.0/255.0 alpha:1];
  tableView.delegate = self;
  tableView.dataSource = self;
  
  [tableView reloadData];
  self.view = tableView;
//  UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//  [redView setTranslatesAutoresizingMaskIntoConstraints:false];
//  redView.backgroundColor = [UIColor purpleColor];
//  [rootView addSubview:redView];
//  
//  UILabel *greenLabel = [[UILabel alloc] init];
//  [greenLabel setTranslatesAutoresizingMaskIntoConstraints:false];
//  greenLabel.text = @"Kristen";
//  greenLabel.backgroundColor = [UIColor greenColor];
//  [rootView addSubview:greenLabel];
//  NSDictionary *views = @{@"redView" : redView, @"greenLabel" : greenLabel};
//  NSArray *redViewHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[redView]-|" options:0 metrics:nil views:views];
//    [rootView addConstraints:redViewHorizontalConstraints];
//  NSArray *redViewVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[redView]-100-|" options:0 metrics:nil views:views];
//  [rootView addConstraints:redViewVerticalConstraints];
//  NSArray *greenLabelVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView]-[greenLabel]" options:0 metrics:nil views:views];
//  [rootView addConstraints:greenLabelVerticalConstraints];
//  NSLayoutConstraint *greenLabelCenterXConstraint = [NSLayoutConstraint constraintWithItem:greenLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
//  greenLabelCenterXConstraint.active = true;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
tableData = [NSArray arrayWithObjects:NSLocalizedString (@"Browse Hotels", nil), NSLocalizedString (@"Book a Room", nil), NSLocalizedString (@"Look Up Reservations", nil), nil];
  // Do any additional setup after loading the view, typically from a nib.
}
//  AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
#pragma mark - UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
  }
  
  cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
  
  cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:50.0];
  cell.textLabel.numberOfLines = 0;
  cell.textLabel.textColor = [UIColor whiteColor];
  cell.backgroundColor = [UIColor colorWithRed:122.0/255.0 green:97.0/255.0 blue:149.0/255.0 alpha:1];
  if (indexPath.row == 0) {
      cell.accessibilityLabel = @"Browse hotels";
  } else if (indexPath.row == 1){
    cell.accessibilityLabel = @"Book a room";
  } else if (indexPath.row == 2) {
    cell.accessibilityLabel = @"Look up reservations";
  }

  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return 3;
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 200;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row == 0) {
    HotelListViewController *hotelVC = [[HotelListViewController alloc] init];
    [self.navigationController pushViewController:hotelVC animated:YES];
  } else if (indexPath.row == 1){
    BookReservationViewController *bookReservationVC = [[BookReservationViewController alloc] init];
    [self.navigationController pushViewController:bookReservationVC animated:YES];
  } else if (indexPath.row == 2) {
    LookUpReservationsViewController *lookVC = [[LookUpReservationsViewController alloc] init];
    [self.navigationController pushViewController:lookVC animated:YES];
  }
  
}

@end
