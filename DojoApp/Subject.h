//
//  Subject.h
//  Dojo
//
//  Created by Justin Skweres on 3/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AbstractEntry.h"

@class Goal;

@interface Subject : AbstractEntry

@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSSet *goals;
@end

@interface Subject (CoreDataGeneratedAccessors)

- (void)addGoalsObject:(Goal *)value;
- (void)removeGoalsObject:(Goal *)value;
- (void)addGoals:(NSSet *)values;
- (void)removeGoals:(NSSet *)values;

@end
