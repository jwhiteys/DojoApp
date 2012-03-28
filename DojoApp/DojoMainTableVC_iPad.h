//
//  DojoMainTableVC_iPad.h
//  Dojo
//
//  Created by Justin Skweres on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DojoDataManager, DojoDetailVC;

@interface DojoMainTableVC_iPad : UITableViewController

@property (strong, nonatomic) UISplitViewController  *splitViewController;
@property (strong, nonatomic) DojoDetailVC *detailViewController;
@property (strong, nonatomic) DojoDataManager *dataManager;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
