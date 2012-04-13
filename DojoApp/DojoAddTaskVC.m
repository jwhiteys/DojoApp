//
//  DojoAddTaskVC.m
//  Dojo
//
//  Created by Justin Skweres on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DojoAddTaskVC.h"

@interface DojoAddTaskVC()

-(void)displayTimerViewController;

@end

@implementation DojoAddTaskVC

@synthesize taskTitleTextField=_taskTitleTextField, taskSummaryTextField=_taskSummaryTextField, goalTimeLabel=_goalTimeLabel, goalTimePickerView=_goalTimePickerView, cancelButton=_cancelButton, timerButton=_timerButton, delegate=_delegate, enduranceLabel=_enduranceLabel, enduranceSwitch=_enduranceSwitch, saveButton=_saveButton, goalTimeInSeconds=_goalTimeInSeconds, goalTimePickerHours=_goalTimePickerHours, goalTimePickerMinutes=_goalTimePickerMinutes, quantAlertView=_quantAlertView, quantUnitType=_quantUnitType, quantsEnabled=_quantsEnabled, quantNameAlertView=_quantNameAlertView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    self.title = @"Add A New Task";
    self.view.backgroundColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:1];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    [self.navigationController setToolbarHidden:NO];
    [self.navigationController.toolbar setBarStyle:UIBarStyleBlackTranslucent];
    
    self.taskTitleTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 240, 40)];
    self.taskTitleTextField.center = CGPointMake(160, 90);
    [self.taskTitleTextField setPlaceholder:@"Enter a Task Title..."];
    [self.taskTitleTextField setBackgroundColor:[UIColor blackColor]];
    [self.taskTitleTextField setTextColor:[UIColor whiteColor]];
    [self.taskTitleTextField setOpaque:YES];
    [self.taskTitleTextField setFont:[UIFont systemFontOfSize:16.0]];
    [self.taskTitleTextField setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
    [self.taskTitleTextField setReturnKeyType:UIReturnKeyDone];
    [self.taskTitleTextField setBorderStyle:UITextBorderStyleBezel];
    [self.taskTitleTextField setDelegate:self];
    self.taskSummaryTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 240, 40)];
    self.taskSummaryTextField.center = CGPointMake(160, 150);
    [self.taskSummaryTextField setBackgroundColor:[UIColor blackColor]];
    [self.taskSummaryTextField setTextColor:[UIColor whiteColor]];
    [self.taskSummaryTextField setOpaque:YES];
    [self.taskSummaryTextField setPlaceholder:@"Enter Task Summary..."];
    [self.taskSummaryTextField setFont:[UIFont systemFontOfSize:16.0]];
    [self.taskSummaryTextField setDelegate:self];
    [self.taskSummaryTextField setBorderStyle:UITextBorderStyleBezel];
    [self.taskSummaryTextField setReturnKeyType:UIReturnKeyDone];
    [self.taskSummaryTextField setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
    
    //endurance label and switch
    self.enduranceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 240, 40)];
    self.enduranceLabel.text = @"Endurance Mode";
    self.enduranceLabel.textColor = [UIColor whiteColor];
    self.enduranceLabel.backgroundColor = [UIColor clearColor];
    self.enduranceLabel.textAlignment = UITextAlignmentCenter;
    self.enduranceLabel.center = CGPointMake(110, 195);
    
    self.enduranceSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    self.enduranceSwitch.backgroundColor = [UIColor clearColor];
    self.enduranceSwitch.onTintColor = [UIColor blackColor];
    self.enduranceSwitch.center = CGPointMake(237, 195);
    
    //Picker View and label
    self.goalTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 240, 40)];
    self.goalTimeLabel.center = CGPointMake(160, 235);
    self.goalTimeLabel.text = @"Enter Goal Time";
    self.goalTimeLabel.backgroundColor = [UIColor clearColor];
    self.goalTimeLabel.textColor = [UIColor whiteColor];
    self.goalTimeLabel.textAlignment = UITextAlignmentCenter;
    self.goalTimePickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, 320, 160)];
    self.goalTimePickerView.delegate = self;
    [self.goalTimePickerView setAutoresizingMask:(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)];
    [self.goalTimePickerView setCenter:CGPointMake(160, 340)];
    self.goalTimePickerView.delegate = self;
    self.goalTimePickerView.dataSource = self;
    [self.goalTimePickerView setShowsSelectionIndicator:YES];
    
    //set up the cancel, timer, and save buttons
    UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(didCancelNewTask:)];
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(didSaveNewTask:)];
    //forget custom button for now... figure out later
    /*
    UIBarButtonItem *timer = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"TimerButton"] style:UIBarButtonItemStylePlain target:self action:@selector(didAddNewTask:)];
     */
    UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *timer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(didAddNewTask:)];
    self.toolbarItems = [NSArray arrayWithObjects: flexibleSpace, cancel, flexibleSpace, timer, flexibleSpace, save, flexibleSpace, nil];
    
    //add all views to the VC's view
    [self.view addSubview:self.taskSummaryTextField];
    [self.view addSubview:self.taskTitleTextField];
    [self.view addSubview:self.enduranceLabel];
    [self.view addSubview:self.enduranceSwitch];
    [self.view addSubview:self.goalTimeLabel];
    [self.view addSubview:self.goalTimePickerView];
    

    [super viewDidLoad];
}


- (void)viewDidUnload
{
    self.goalTimeLabel = nil;
    self.taskTitleTextField = nil;
    self.taskSummaryTextField = nil;
    self.goalTimePickerView = nil;
    self.enduranceSwitch = nil;
    self.enduranceLabel = nil;
    self.cancelButton = nil;
    self.timerButton = nil;
    self.saveButton = nil;
    self.quantAlertView = nil;
    self.quantUnitType = nil;
    self.quantNameAlertView = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Add, Cancel, or Save the new task
//FIX THE DELEGATE METHODS SENT TO THE MAIN VC (DELEGATE OF THE ADD TASK VC) SHOULD INCLUDE
////TITLE, SUMMARY, GOAL TIME.  THERE ALSO NEED TO BE NEW PROTOCOL METHODS FOR ENDURANCE TASK.
////******************************************************************************************
-(void)didAddNewTask:(id)sender
{
    //display alert asking whether or not to increment, if Yes, display an actionsheet with a text
    ////field for the data type name or pick from existing data types (in other tasks)
    //***********************THIS WILL NEED FIXING TO SEARCH OTHER TASKS' DATA TYPES*************
    self.quantAlertView = [[UIAlertView alloc] initWithTitle:@"Increment Value" message:@"Should this task increment a value?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
    [self.quantAlertView show];
    
    [self.delegate viewController:self 
              didAddTaskWithTitle:self.taskTitleTextField.text 
                          summary:self.taskSummaryTextField.text
                      andGoalTime:self.goalTimeInSeconds
                      isEndurance:[self.enduranceSwitch isOn]
                       usesQuants:self.quantsEnabled
                    quantUnitType:self.quantUnitType];
}

-(void)didCancelNewTask:(id)sender
{
    NSLog(@"Cancel button pressed...");
    [self.delegate viewController:self 
           didCancelTaskWithTitle:self.taskTitleTextField.text 
                          summary:self.taskSummaryTextField.text
                      andGoalTime:self.goalTimeInSeconds
                      isEndurance:[self.enduranceSwitch isOn]
                       usesQuants:self.quantsEnabled
                    quantUnitType:self.quantUnitType];
}

-(void)didSaveNewTask:(id)sender
{
    [self.delegate viewController:self 
              didSaveTaskWithTitle:self.taskTitleTextField.text 
                          summary:self.taskSummaryTextField.text
                      andGoalTime:self.goalTimeInSeconds
                      isEndurance:[self.enduranceSwitch isOn]
                       usesQuants:self.quantsEnabled
                    quantUnitType:self.quantUnitType];
}

#pragma mark - TextFieldDelegate Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField==self.taskTitleTextField) {
        [textField resignFirstResponder];
        return YES;
    }
    else if (textField==self.taskSummaryTextField) {
        [textField resignFirstResponder];
        return YES;
    }
    else return NO;
}

#pragma mark - UIPickerViewDataSource Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    NSInteger result = 0;
    if (pickerView==self.goalTimePickerView) {
        result = 2;
    }
    return result;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger result = 0;
    if (pickerView==self.goalTimePickerView) {
        if (component==0) {
            result = 25;
        }
        else if (component==1){
            result = 61;
        }
        else result = 10;  //for debug purpose to see if wrong number of rows appears
    }
    return  result;
}


#pragma mark - UIPickerViewDelegate Methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *result = nil;
    if (pickerView==self.goalTimePickerView) {
        if (component==0) {
            if (row==0) {
                result = @" 00 hours ";
            }
            else {
                result = [NSString stringWithFormat:@" %d ", row];
            }
        }
        else if (component==1) {
            if (row==0) {
                result = @" 00 min ";
            }
            else {
                result = [NSString stringWithFormat:@" %d ", row];
            }
        }
    }
    return result;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView==self.goalTimePickerView) {
        if (component==0) {
            self.goalTimePickerHours = row;
        }
        
        if (component==1) {
            self.goalTimePickerMinutes = row;
        }
        
        NSInteger timeInSeconds = (self.goalTimePickerHours * 60 * 60) + (self.goalTimePickerMinutes * 60);
        self.goalTimeInSeconds = timeInSeconds;
    }
    NSLog(@"goal Time in Seconds: %d", self.goalTimeInSeconds);
}

#pragma mark - UIAlertViewDelegate Methods

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (alertView==self.quantAlertView) {
        if (buttonIndex==0) {
            [self displayTimerViewController];
        }
        else if (buttonIndex==1){
            self.quantNameAlertView = [[UIAlertView alloc] initWithTitle:@"Unit Name" message:@"Enter the name of the units to be counted." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
            self.quantNameAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
            [self.quantNameAlertView show];
        }
        else return;
    }
    
    else if (alertView==self.quantNameAlertView) {
        if (buttonIndex==0) {
            return;
        }
        else if (buttonIndex==1) {
            UITextField *textField = [alertView textFieldAtIndex:0];
            self.quantUnitType = textField.text;
            NSLog(@" quant type set to : %@", self.quantUnitType);
            [self displayTimerViewController];
        }
        else return;
    }
}

-(void)displayTimerViewController
{
    //******* here you transition to the timer view controller for the added task and start the timer (begin button?) ************************
}


@end
