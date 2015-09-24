//
//  ArrivalAndDepartureViewController.m
//  Core Data Hotel
//
//  Created by Kristen Kozmary on 9/13/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

#import "ArrivalAndDepartureViewController.h"
#import "ConfirmationViewController.h"

@interface ArrivalAndDepartureViewController ()
@property (strong, nonatomic) UIDatePicker *datePicker;
@property (strong, nonatomic) UIDatePicker *datePickerDeparture;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@end

@implementation ArrivalAndDepartureViewController

- (void)loadView {
  UIView *rootView = [[UIView alloc] init];
  rootView.backgroundColor = [UIColor whiteColor];
  UILabel *arrivalLabel = [[UILabel alloc] init];
  arrivalLabel.text = @"Arrival Date";
  [rootView addSubview:arrivalLabel];
  [arrivalLabel setTranslatesAutoresizingMaskIntoConstraints:false];
  UILabel *departureLabel = [[UILabel alloc] init];
  departureLabel.text = @"Departure Date";
  [rootView addSubview:departureLabel];
  [departureLabel setTranslatesAutoresizingMaskIntoConstraints:false];
  UIDatePicker *datePicker = [[UIDatePicker alloc] init];
  UIDatePicker *datePickerDeparture = [[UIDatePicker alloc] init];
  self.datePickerDeparture = datePickerDeparture;
  self.datePicker = datePicker;
  [datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
  [rootView addSubview:datePicker];
  [datePickerDeparture addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
  [rootView addSubview:datePickerDeparture];
  [datePicker setTranslatesAutoresizingMaskIntoConstraints:false];
  [datePickerDeparture setTranslatesAutoresizingMaskIntoConstraints:false];
  NSDictionary *views = @{@"datePicker" : datePicker, @"arrivalLabel" : arrivalLabel, @"departureLabel" : departureLabel, @"datePickerDeparture" : datePickerDeparture};
    NSArray *datePickerVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-100-[datePicker]" options:0 metrics:nil views:views];
    [rootView addConstraints:datePickerVerticalConstraints];
  NSArray *datePickerDepartureVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-350-[datePickerDeparture]-|" options:0 metrics:nil views:views];
  [rootView addConstraints:datePickerDepartureVerticalConstraints];
  NSArray *arrivalLabelVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-70-[arrivalLabel]" options:0 metrics:nil views:views];
  [rootView addConstraints:arrivalLabelVerticalConstraints];
  NSArray *arrivalLabelHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-150-[arrivalLabel]-|" options:0 metrics:nil views:views];
  [rootView addConstraints:arrivalLabelHorizontalConstraints];
  NSArray *departureLabelVerticalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-400-[departureLabel]" options:0 metrics:nil views:views];
  [rootView addConstraints:departureLabelVerticalConstraints];
  NSArray *departureLabelHorizontalConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-150-[departureLabel]-|" options:0 metrics:nil views:views];
  [rootView addConstraints:departureLabelHorizontalConstraints];

  
  
  UIButton *nextButton = [[UIButton alloc] init];
  //  nextButton.backgroundColor = [UIColor blueColor];
  [nextButton addTarget:self action:@selector(nextButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
  [nextButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
  [nextButton setTitle:@"Next" forState:UIControlStateNormal];
  [nextButton setTranslatesAutoresizingMaskIntoConstraints:false];
  [rootView addSubview:nextButton];
  
  NSLayoutConstraint *nextButtonCenterX = [NSLayoutConstraint constraintWithItem:nextButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0];
  NSLayoutConstraint *nextButtonBottomConstraint = [NSLayoutConstraint constraintWithItem:nextButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-16.0];
  nextButtonCenterX.active = true;
  nextButtonBottomConstraint.active = true;
  self.view = rootView;
  
}


- (void)viewDidLoad {
    [super viewDidLoad];

  self.datePicker.datePickerMode = UIDatePickerModeDate;
  self.datePickerDeparture.datePickerMode = UIDatePickerModeDate;
  self.dateFormatter = [[NSDateFormatter alloc] init];
  
}

- (void)nextButtonPressed:(UIButton *)sender {
//  self.datePicker.date = self.datePickerDate;
//  self.datePickerDeparture.date = self.datePickerDepartureDate;

  ConfirmationViewController *confirmationVC = [[ConfirmationViewController alloc] init];
  confirmationVC.datePickerDate = self.datePicker.date;
  confirmationVC.datePickerDepartureDate = self.datePickerDeparture.date;
  [self.navigationController pushViewController:confirmationVC animated:YES];

}
- (void)datePickerValueChanged:(UIDatePicker *)sender {
  
    self.dateFormatter.dateStyle = NSDateFormatterShortStyle;
  [self.dateFormatter setDateFormat:@"MMMM dd YY"];
  NSString *dateString = [self.dateFormatter stringFromDate:sender.date];

}

@end
