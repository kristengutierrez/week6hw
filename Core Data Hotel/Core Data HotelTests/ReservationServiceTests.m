//
//  ReservationServiceTests.m
//  Core Data Hotel
//
//  Created by Kristen Kozmary on 9/14/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ReservationService.h"

@interface ReservationServiceTests : XCTestCase
@property (strong, nonatomic) NSDate *startDate;
@property (strong, nonatomic) NSDate *endDate;
@end

@implementation ReservationServiceTests

- (void)setUp {
  [super setUp];
  self.startDate = [NSDate date];
  self.endDate = [NSDate dateWithTimeIntervalSinceNow:(60 * 60 * 24)];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
  self.startDate = nil;
  self.endDate = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAvailableRoomsForNilDates{
  NSArray *results = [ReservationService availableRoomsForStartDate:nil endDate:nil];
  XCTAssertNotNil(results);
}

- (void)testAvailableRoomsForValidDates{
  NSArray *results = [ReservationService availableRoomsForStartDate:self.startDate endDate:self.endDate];
  XCTAssertNotNil(results);
}

- (void)testAvailableRoomsForInvalidDates{
  NSArray *results = [ReservationService availableRoomsForStartDate:self.endDate endDate:self.startDate];
  XCTAssertNotNil(results);
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
