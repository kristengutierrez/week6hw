//
//  Guest.h
//  
//
//  Created by Kristen Kozmary on 9/8/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Reservations;

@interface Guest : NSManagedObject

@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;
@property (nonatomic, retain) Reservations *reservations;

@end
