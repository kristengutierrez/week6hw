//
//  HashTable.h
//  Core Data Hotel
//
//  Created by Kristen Kozmary on 9/9/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HashTable : NSObject
-(id)removeObjectForKey:(NSString *)key;
-(id)objectForKey:(NSString *)key;
@end
