//
//  DojoMainTableVC.h
//  Dojo
//
//  Created by Justin Skweres on 3/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class DojoDataManager;

@interface DojoMainTableVC : UITableViewController

//core data reference
@property (weak, nonatomic) NSManagedObjectContext *managedObjectContext;
//DojoDataManagerReference
@property (weak, nonatomic) DojoDataManager *dataManager;

@end
