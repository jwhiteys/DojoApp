//
//  DojoDataManager.m
//  Dojo
//
//  Created by Justin Skweres on 3/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DojoDataManager.h"
#import "TrainingTask.h"
#import "EnduranceTask.h"
#import "Subject.h"
#import "Goal.h"
#import "BasicTask.h"
#import "AbstractEntry.h"
#import "AppDelegate.h"


@implementation DojoDataManager

static DojoDataManager __strong *sharedInstance = nil;

@synthesize goalList=_goalList;
@synthesize subjectList=_subjectList;
@synthesize taskList=_taskList;
@synthesize masterEntryCollection=_masterEntryCollection;
@synthesize managedObjectContext=_managedObjectContext;
@synthesize fetchedResultsController=_fetchedResultsController;

+(DojoDataManager *)sharedInstance
{
    if (!sharedInstance) {
        sharedInstance = [[[self class] alloc] init];
        NSLog(@"Creating subject, goal, and task lists");
        sharedInstance.goalList = [[NSMutableArray alloc] init];
        sharedInstance.subjectList = [[NSMutableArray alloc] init];
        sharedInstance.taskList = [[NSMutableArray alloc] init];
        sharedInstance.masterEntryCollection = [[NSMutableDictionary alloc] init];
        sharedInstance.managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
        sharedInstance.fetchedResultsController = [[NSFetchedResultsController alloc] init];
        NSLog(@"DataManager created");
    }
    return sharedInstance;
}

+(BOOL)sharedInstanceExists
{
    if (!sharedInstance) {
        return NO;
    }
    else return YES;
}






@end
