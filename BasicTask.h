//
//  BasicTask.h
//  Dojo
//
//  Created by Justin Skweres on 3/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AbstractEntry.h"

@class Goal;

@interface BasicTask : AbstractEntry

@property (nonatomic, retain) NSNumber * dingCount;
@property (nonatomic, retain) NSDate * endTime;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSNumber * productivity;
@property (nonatomic, retain) NSNumber * quantCount;
@property (nonatomic, retain) NSString * quantUnitType;
@property (nonatomic, retain) NSDate * startTime;
@property (nonatomic, retain) NSNumber * usesQuants;
@property (nonatomic, retain) NSNumber * isCompleted;
@property (nonatomic, retain) Goal *goal;

@end
