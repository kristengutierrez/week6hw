//
//  Room.h
//  
//
//  Created by Kristen Kozmary on 9/8/15.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Hotel, Reservations;

@interface Room : NSManagedObject

@property (nonatomic, retain) NSNumber * number;
@property (nonatomic, retain) Hotel *hotel;
@property (nonatomic, retain) NSSet *reservations;
@property (nonatomic, retain) NSNumber *beds;
@property (nonatomic, retain) NSNumber *rate;
@end

@interface Room (CoreDataGeneratedAccessors)

- (void)addReservationsObject:(Reservations *)value;
- (void)removeReservationsObject:(Reservations *)value;
- (void)addReservations:(NSSet *)values;
- (void)removeReservations:(NSSet *)values;

@end
