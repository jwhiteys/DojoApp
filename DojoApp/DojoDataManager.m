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
#import "Quant.h"


@implementation DojoDataManager

static DojoDataManager __strong *sharedInstance = nil;

@synthesize goalList=_goalList;
@synthesize subjectList=_subjectList;
@synthesize taskList=_taskList;
@synthesize quantDataTypes=_quantDataTypes;
@synthesize masterEntryCollection=_masterEntryCollection;
@synthesize locationManager=_locationManager;
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

-(CLLocationManager *)locationManager
{
    if (_locationManager != nil) {
        return _locationManager;
    }
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    [_locationManager startMonitoringSignificantLocationChanges];
    return _locationManager;
}

#pragma mark - TASK METHODS

//add a new task... VC's send all info to datamanager, which creates new object and adds to context
-(void)addNewTaskWithTitle:(NSString *)title summary:(NSString *)summary goalTimeInSeconds:(NSUInteger)goalTimeInSeconds isEndurance:(BOOL)enduranceBool usesQuants:(BOOL)quantBool quantUnitType:(NSString *)quantUnitName;
{
    //creatinga  new task to save and start later - where date, location ,etc will be filled in then...
    if (!enduranceBool) {
        //set up a training task...
        TrainingTask *taskEntity = [NSEntityDescription insertNewObjectForEntityForName:@"TrainingTask" inManagedObjectContext:self.managedObjectContext];
        if (taskEntity!=nil) {
        
        taskEntity.isTrainingTask = [NSNumber numberWithBool:YES];
        taskEntity.goalTime = [NSNumber numberWithInteger:goalTimeInSeconds];
        taskEntity.actualTime = nil;
        
        //set up the task entity
        taskEntity.title = title;
        taskEntity.summary = summary;
        taskEntity.usesQuants = [NSNumber numberWithBool:quantBool];
        if (quantBool) {
            Quant *aQuant = [NSEntityDescription insertNewObjectForEntityForName:@"Quant" inManagedObjectContext:self.managedObjectContext];
            aQuant.type = quantUnitName;
            aQuant.count = [NSNumber numberWithInt:0];
            taskEntity.quant = aQuant;
        }
        taskEntity.dingCount = [NSNumber numberWithInt:0];
        taskEntity.productivity = nil;
        taskEntity.startTime = nil;
        taskEntity.endTime = nil;
        taskEntity.latitude = nil;
        taskEntity.longitude = nil;
        taskEntity.productivity = nil;
        taskEntity.goal = nil;
        [self.taskList addObject:taskEntity];
        }

    }
    else if (enduranceBool) {
        //set up an endurance task - counts up and no set time...
        EnduranceTask *taskEntity = [NSEntityDescription insertNewObjectForEntityForName:@"EnduranceTask" inManagedObjectContext:self.managedObjectContext];
        if (taskEntity!=nil) {
            
        taskEntity.successes = [NSNumber numberWithInt:0];
        taskEntity.totalTime = [NSNumber numberWithInt:0];
        taskEntity.isEnduranceTask = [NSNumber numberWithBool:YES];
        
        //set up the task entity
        taskEntity.title = title;
        taskEntity.summary = summary;
        taskEntity.usesQuants = [NSNumber numberWithBool:quantBool];
        if (quantBool) {
            Quant *aQuant = [NSEntityDescription insertNewObjectForEntityForName:@"Quant" inManagedObjectContext:self.managedObjectContext];
            aQuant.type = quantUnitName;
            aQuant.count = [NSNumber numberWithInt:0];
            taskEntity.quant = aQuant;
        }
        taskEntity.dingCount = [NSNumber numberWithInt:0];
        taskEntity.productivity = nil;
        taskEntity.startTime = nil;
        taskEntity.endTime = nil;
        taskEntity.latitude = nil;
        taskEntity.longitude = nil;
        taskEntity.productivity = nil;
        taskEntity.goal = nil;
        
            [self.taskList addObject:taskEntity];
        }
        
    }
    
    NSError *saveError = nil;
    if ([self.managedObjectContext save:&saveError]) {
        //error handling...
        NSLog(@"successfully created new task");
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Unable to save new task."delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert    show];
    }
}

@end
