//
//  HotelListViewController.m
//  Core Data Hotel
//
//  Created by Kristen Kozmary on 9/7/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

#import "HotelListViewController.h"
#import "AppDelegate.h"
#import "Hotel.h"
#import "CoreDataStack.h"
#import "ViewController.h"
#import "RoomsViewController.h"

@interface HotelListViewController () <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *hotels;
@end

@implementation HotelListViewController

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
  
  [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HotelCell"];
  
  AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;

  NSError *fetchError;
  NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
//  fetchRequest.predicate = [NSPredicate predicateWithFormat:@"stars > 3"];
  self.hotels = [appDelegate.coreDataStack.managedObjectContext executeFetchRequest:fetchRequest error:&fetchError];
  if (fetchError) {
    NSLog(@"%@",fetchError.localizedDescription);
  }
  [self.tableView reloadData];
    // Do any additional setup after loading the view.
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.hotels.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HotelCell"];
  Hotel *hotel = self.hotels[indexPath.row];
  NSLog(@"%@", hotel.name);
  cell.textLabel.text = hotel.name;
    cell.backgroundColor =  [UIColor colorWithRed:122.0/255.0 green:97.0/255.0 blue:149.0/255.0 alpha:1];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:20.0];
    cell.textLabel.textColor = [UIColor whiteColor];
  
//  cell.backgroundColor =  [UIColor colorWithRed:122.0/255.0 green:97.0/255.0 blue:149.0/255.0 alpha:1];
//  if (cell == nil) {
//    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HotelCell"];
//  }
  return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:true];
  RoomsViewController *roomsVC = [[RoomsViewController alloc] init];
  roomsVC.currentHotel = self.hotels[indexPath.row];
  [self.navigationController pushViewController:roomsVC animated:YES];
}

@end
