//
//  EnduranceTask.h
//  Dojo
//
//  Created by Justin Skweres on 3/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "BasicTask.h"


@interface EnduranceTask : BasicTask

@property (nonatomic, retain) NSNumber * isEnduranceTask;
@property (nonatomic, retain) NSNumber * totalTime;
@property (nonatomic, retain) NSNumber * successes;

@end
