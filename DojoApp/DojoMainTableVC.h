//
//  DojoMainTableVC.h
//  Dojo
//
//  Created by Justin Skweres on 3/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "DojoAddTaskVC.h"

@class DojoDataManager;

@interface DojoMainTableVC : UITableViewController <DojoAddTaskVCDelegate>

//core data reference
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
//DojoDataManagerReference
@property (strong, nonatomic) DojoDataManager *dataManager;
//weak reference to the parentNavigationController
@property (weak, nonatomic) UINavigationController *navigationController;

-(void)longPressToAddNewTask:(id)sender;

-(void)displaySubjects:(id)sender;

-(void)displayGoals:(id)sender;

-(void)displayTasks:(id)sender;

@end
