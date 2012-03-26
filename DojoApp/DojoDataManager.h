//
//  DojoDataManager.h
//  Dojo
//
//  Created by Justin Skweres on 3/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Subject, Goal, TrainingTask, EnduranceTask, AbstractEntry, BasicTask;

@interface DojoDataManager : NSObject

@property (strong, nonatomic) NSMutableArray *subjectList;
@property (strong, nonatomic) NSMutableArray *goalList;
@property (strong, nonatomic) NSMutableArray *taskList;
@property (strong, nonatomic) NSMutableDictionary *masterEntryCollection;
//core data link
@property (weak, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

//access to the DataManager Singleton - calls init
+(id)sharedDataManager;

//SUBJECTS - create, read, update, delete
//*C*
//creates a new subject and adds to the list
-(void)addNewSubjectWithTitle:(NSString *)theTitle summary:(NSString *)theSummary;

//*R*
-(Subject *)subjectWithTitle:(NSString *)theTitle;
-(Subject *)subjectAtIndex:(NSInteger)theIndex;
-(NSInteger)subjectCount;
-(Subject *)oldestSubject;
-(Subject *)newestSubject;
//light or heavy based on number of goals therein
-(Subject *)heaviestSubject;
-(Subject *)lightestSubject;
//most trained based on number of tasks
-(Subject *)mostTrainedSubject;
-(Subject *)leastTrainedSubject;
//best and worst - based on aggregate score of underlying tasks - 
//takes productivity, time trained, least dings, etc.
-(Subject *)bestSubject;
-(Subject *)worstSubject;
//improvement
-(Subject *)mostImprovedSubject;
-(Subject *)leastImprovedSubject;

//*U*
////not sure what update tasks should go here

//*D*
-(void)removeSubjectWithTitle:(NSString *)theTitle;
-(void)removeSubject:(Subject *)theSubject;

//GOALS - CRUD
-(void)addNewGoalWithTitle:(NSString *)theTitle summary:(NSString *)theSummary;

-(Goal *)goalWithTitle:(NSString *)theTitle;
-(Goal *)goalAtIndex:(NSInteger)theIndex;
-(NSInteger)goalCount;
-(Goal *)oldestGoal;
-(Goal *)newestGoal;
-(Goal *)mostProgress;
-(Goal *)leastProgress;
-(Goal *)mostTimeTrained;
-(Goal *)leastTimeTrained;
-(void)removeGoalWithTitle:(NSString *)theTitle;
-(void)removeGoal:(Goal *)theGoal;

//TASKS - CRUD
-(void)addNewTaskWithTitle:(NSString *)theTitle summary:(NSString *)theSummary isEndurance:(BOOL *)theBool;

-(BasicTask *)taskWithTitle:(NSString *)theTitle;
-(BasicTask *)taskAtIndex:(NSInteger)theIndex;
-(BasicTask *)taskCount;
-(NSSet *)completedTasks;
-(NSSet *)incompleteTasks;







@end
