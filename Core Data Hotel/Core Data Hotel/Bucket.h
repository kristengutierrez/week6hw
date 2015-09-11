//
//  Bucket.h
//  Core Data Hotel
//
//  Created by Kristen Kozmary on 9/9/15.
//  Copyright (c) 2015 koz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bucket : NSObject
@property (strong, nonatomic) Bucket *next;
@property (strong, nonatomic)NSString *key;
@property (strong, nonatomic)id value;
@end
