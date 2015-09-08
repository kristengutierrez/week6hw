//
//  Reservations.h
//  
//
//  Created by Kristen Kozmary on 9/8/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Guest, Room;

@interface Reservations : NSManagedObject

@property (nonatomic, retain) NSDate* arrivalDate;
@property (nonatomic, retain) NSDate* departureDate;
@property (nonatomic, retain) Room *room;
@property (nonatomic, retain) Guest *guest;

@end
