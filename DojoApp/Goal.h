//
//  Goal.h
//  Dojo
//
//  Created by Justin Skweres on 3/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AbstractEntry.h"

@class BasicTask, Subject;

@interface Goal : AbstractEntry

@property (nonatomic, retain) NSNumber * progress;
@property (nonatomic, retain) Subject *subject;
@property (nonatomic, retain) NSSet *tasks;
@end

@interface Goal (CoreDataGeneratedAccessors)

- (void)addTasksObject:(BasicTask *)value;
- (void)removeTasksObject:(BasicTask *)value;
- (void)addTasks:(NSSet *)values;
- (void)removeTasks:(NSSet *)values;

@end
