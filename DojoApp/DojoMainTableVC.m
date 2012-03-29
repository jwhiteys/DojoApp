//
//  DojoMainTableVC.m
//  Dojo
//
//  Created by Justin Skweres on 3/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DojoMainTableVC.h"
#import "DojoDataManager.h"


//Implement a DojoColorSchemeManager to return an array of 3 color objects (trichrome color schemes)
typedef enum {
    DojoColorSchemeDefaultBlack,
    DojoColorSchemeRed,
    DojoColorSchemeBlue,
    DojoColorSchemeMetallic,
    DojoColorSchemeWhite,
    DojoColorSchemeMidnight,
    DojoColorSchemeGreen
} DojoColorScheme;


@implementation DojoMainTableVC

@synthesize dataManager=_dataManager;
@synthesize navigationController=_navigationController;
@synthesize fetchedResultsController=_fetchedResultsController;
@synthesize managedObjectContext=_managedObjectContext;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        //customization needed?
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Dojo";
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:
                                      CGRectMake(0, 0, 320, 20)];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:
                                      CGRectMake(440, 440, 320, 20)];
    self.tableView.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
   
   //NEXT TASK IS TO BE ABLE TO ADD TASKS TO THE LIST AND SAVE TO CONTEXT... IMPLEMENT TASK SAVING
    //WITH LONG PRESS GESTURE ON THE UITABLEVIEW (OR CELLS THEREOF) TO SLIDE DOWN TO CREATE NEW CELL.
    //?????????NO NEED FOR ADD TASK VC? WE'LL SEE....
    //?????????GET RID OF BOTTOM BAR - KEEP AS MINIMALIST AS POSSIBLE WITHOUT BEING CONFUSING.
    
    UIGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(addNewTableViewRow:)];
    [self.tableView addGestureRecognizer:longPress];
    
    
    //set up toolBar and button...
    UIBarButtonItem *flexibleSpaceLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace 
                                                                                       target:nil action:nil];
    UIBarButtonItem *flexibleSpaceRight = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace 
                                                                                        target:nil action:nil];
    NSString *segItem1 = [NSString stringWithFormat:@"Subjects"];
    NSString *segItem2 = [NSString stringWithFormat:@"Goals"];
    NSString *segItem3 = [NSString stringWithFormat:@"Tasks"];
    NSArray *segArray = [[NSArray alloc] initWithObjects:segItem1, segItem2, segItem3, nil];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:segArray];
    segmentedControl.tintColor = [UIColor blackColor];
    [segmentedControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    [segmentedControl setMomentary:NO];
    UIBarButtonItem *segBarItem = [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
    
    self.toolbarItems = [[NSArray alloc] initWithObjects:flexibleSpaceLeft, segBarItem, flexibleSpaceRight, nil];
    
    /*      WILL IMPLEMENT A SEGMENTED CONTROL AT BOTTOM
    UIBarButtonItem *yinYangButton = [[UIBarButtonItem alloc] 
                                      initWithImage:[UIImage imageNamed:@"YinYangButtonSmall.png"] 
                                      style:UIBarButtonItemStylePlain target:self 
                                      action:@selector(yinYangButton:)];
    self.toolbarItems = [[NSArray alloc] initWithObjects:flexibleSpaceLeft, yinYangButton, flexibleSpaceRight, nil];
     */
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)addNewTableViewRow:(id)sender
{
    //implement
    NSLog(@"Long Press Detected - trying to add new row...");
}

-(void)displaySubjects:(id)sender
{
                                   
}

-(void)displayGoals:(id)sender
{
    
}

-(void)displayTasks:(id)sender
{
    
}

- (void)viewDidUnload
{
    [self setDataManager:nil];
    [self setNavigationController:nil];
    [self setFetchedResultsController:nil];
    [self setManagedObjectContext:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    if (self.dataManager.taskList.count == 0) {
        return 1;
    }
    if (self.dataManager.goalList.count==0 && self.dataManager.subjectList.count==0)
        return [self.dataManager.taskList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"UITableViewDelegate called - tableview cellForRowAtIndexPath:");
    static NSString *CellIdentifier = @"TaskCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
            cell.textLabel.font = [UIFont systemFontOfSize:16.0];
            cell.textLabel.textAlignment = UITextAlignmentLeft;
            cell.textLabel.autoresizingMask = (UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight);
        
    }
    
    // Configure the cell..
    if (self.dataManager.taskList.count == 0) {
        cell.textLabel.text = @"Press and Hold To Prepare a New Task";
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
