//
//  RoomsViewController.m
//  Core Data Hotel
//
//  Created by Kristen Kozmary on 9/10/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

#import "RoomsViewController.h"
#import "Room.h"
#import "CoreDataStack.h"
#import "AppDelegate.h"
#import "Hotel.h"
#import "HotelListViewController.h"
#import "BookReservationViewController.h"

@interface RoomsViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation RoomsViewController

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
  
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"RoomCell"];
  _roomsArray = _currentHotel.rooms.allObjects;
  [self.tableView reloadData];
  
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.roomsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RoomCell"];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"RoomCell"];
  }
//  NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"number" ascending:YES selector:@selector(localizedStandardCompare:)];
   NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"number" ascending:YES];
  NSArray *sortedRoomsArray = [self.roomsArray sortedArrayUsingDescriptors:@[descriptor]];
  NSLog(@"%@", sortedRoomsArray);
  Room *room = sortedRoomsArray[indexPath.row];
  cell.textLabel.text = [NSString stringWithFormat:@"Room %@", [room number]];
  cell.textLabel.textColor = [UIColor whiteColor];
  cell.backgroundColor =  [UIColor colorWithRed:122.0/255.0 green:97.0/255.0 blue:149.0/255.0 alpha:1];
  cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:15.0];
  return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:true];
  BookReservationViewController *bookVC = [[BookReservationViewController alloc] init];
  [self.navigationController pushViewController:bookVC animated:YES];
}


@end
