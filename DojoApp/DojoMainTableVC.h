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

//needs to display the main table view with a segmented control.  Displays subjects if they exist, if none then all goals, if none
//then displays all tasks.  Long press on a cell should allow insertion of a new goal in a subject and a new task in a goal, depending
//on the list.  Adding new subjects is possible with the yinyang button at top depending on view and at that time tasks/goals can be
//associated with it.

@class DojoDataManager;

@interface DojoMainTableVC : UITableViewController <DojoAddTaskVCDelegate>

//core data reference
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
//DojoDataManagerReference
@property (strong, nonatomic) DojoDataManager *dataManager;  //used a reference to data manager - should have just accessed singleton...
//weak reference to the parentNavigationController
@property (weak, nonatomic) UINavigationController *navigationController;

-(void)longPressToAddNewTask:(id)sender;

-(void)displaySubjects:(id)sender;

-(void)displayGoals:(id)sender;

-(void)displayTasks:(id)sender;

@end
