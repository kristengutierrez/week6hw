//
//  ConfirmationViewController.m
//  Core Data Hotel
//
//  Created by Kristen Kozmary on 9/14/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

#import "ConfirmationViewController.h"
#import "ArrivalAndDepartureViewController.h"

@interface ConfirmationViewController ()
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@end

@implementation ConfirmationViewController
- (void)loadView {
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];
  self.view = rootView;
  
  UILabel *arrivalDateLabel = [[UILabel alloc] init];
  
  //  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  //  dateFormatter.dateStyle = NSDateFormatterShortStyle;
  [self.dateFormatter setDateFormat:@"MMMM dd YY"];
  NSString *dateString = [self.dateFormatter stringFromDate:self.datePickerDate];
  NSLog(@"this the date: %@", dateString);
  
  arrivalDateLabel.text = [NSString stringWithFormat:@"%@", dateString];
//    cell.textLabel.text = [NSString stringWithFormat:@"Room %@", [room number]];
  [rootView addSubview:arrivalDateLabel];
  [arrivalDateLabel setTranslatesAutoresizingMaskIntoConstraints:false];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



@end
