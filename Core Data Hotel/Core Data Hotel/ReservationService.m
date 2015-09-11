//
//  ReservationService.m
//  Core Data Hotel
//
//  Created by Kristen Kozmary on 9/9/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

#import "ReservationService.h"
#import "AppDelegate.h"
#import "CoreDataStack.h"
#import "Reservations.h"
#import "Room.h"

@implementation ReservationService
+ (NSArray *)availableRoomsForStartDate:(NSDate *)arrivalDate endDate:(NSDate *)departureDate {
  if (!arrivalDate || !departureDate) {
    return [[NSArray alloc] init];
  }
  
  AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
  
  NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservations"];
  
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"arrivalDate <= %@ AND departureDate >= %@",departureDate,arrivalDate];
  
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

  @end
