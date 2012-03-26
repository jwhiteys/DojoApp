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

@synthesize goalList=_goalList;
@synthesize subjectList=_subjectList;
@synthesize taskList=_taskList;
@synthesize masterEntryCollection=_masterEntryCollection;
@synthesize managedObjectContext=_managedObjectContext;
@synthesize fetchedResultsController=_fetchedResultsController;

-(id)init
{
    if(self = [super init]){
        //custom data manager initialization here
        //this class should be singleton
        self.goalList = [[NSMutableArray alloc] init];
        self.subjectList = [[NSMutableArray alloc] init];
        self.taskList = [[NSMutableArray alloc] init];
        self.masterEntryCollection = [[NSMutableDictionary alloc] init];
        self.managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
        self.fetchedResultsController = [[NSFetchedResultsController alloc] init];
        
        return self;
    }
    return nil;
}





@end
