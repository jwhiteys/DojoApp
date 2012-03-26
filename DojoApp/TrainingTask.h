//
//  TrainingTask.h
//  Dojo
//
//  Created by Justin Skweres on 3/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BasicTask.h"


@interface TrainingTask : BasicTask

@property (nonatomic, retain) NSNumber * actualTime;
@property (nonatomic, retain) NSNumber * goalTime;
@property (nonatomic, retain) NSNumber * isTrainingTask;

@end
