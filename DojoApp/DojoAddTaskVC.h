//
//  DojoAddTaskVC.h
//  Dojo
//
//  Created by Justin Skweres on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DojoDataManager.h"

@protocol DojoAddTaskVCDelegate <NSObject>

-(void)viewController:(UIViewController *)viewController didAddTaskWithTitle:(NSString *)title summary:(NSString *)summary andGoalTime:(NSInteger)seconds isEndurance:(BOOL)enduranceBool usesQuants:(BOOL)quantBool quantUnitType:(NSString *)quantUnitName;
-(void)viewController:(UIViewController *)viewController didCancelTaskWithTitle:(NSString *)title summary:(NSString *)summary andGoalTime:(NSInteger)seconds isEndurance:(BOOL)enduranceBool usesQuants:(BOOL)quantBool quantUnitType:(NSString *)quantUnitName;
-(void)viewController:(UIViewController *)viewController didSaveTaskWithTitle:(NSString *)title summary:(NSString *)summary andGoalTime:(NSInteger)seconds isEndurance:(BOOL)enduranceBool usesQuants:(BOOL)quantBool quantUnitType:(NSString *)quantUnitName;

@end

@interface DojoAddTaskVC : UIViewController <UIPickerViewDelegate, UITextFieldDelegate, UIPickerViewDataSource, UIAlertViewDelegate>

//delegate property
@property (nonatomic, weak)id <DojoAddTaskVCDelegate> delegate;

//UIKit elements
@property (nonatomic, strong) UITextField *taskTitleTextField;
@property (nonatomic, strong) UITextField *taskSummaryTextField;
@property (nonatomic, strong) UILabel *goalTimeLabel;
@property (nonatomic, strong) UIPickerView *goalTimePickerView;
@property (nonatomic, strong) UIBarButtonItem *timerButton;
@property (nonatomic, strong) UIBarButtonItem *cancelButton;
@property (nonatomic, strong) UIBarButtonItem *saveButton;
@property (nonatomic, strong) UILabel *enduranceLabel;
@property (nonatomic, strong) UISwitch *enduranceSwitch;
//choos if there should be an incremented quantitative value
@property (nonatomic, strong) UIAlertView *quantAlertView;
//choose that value's name if a value is to be incremented - can also choose from existing types 
////ask the data manager!
@property (nonatomic, strong) UIAlertView *quantNameAlertView;

//properties to store data entered at the add screen - sent to MainVC (parent)
@property (nonatomic) NSUInteger goalTimePickerHours;
@property (nonatomic) NSUInteger goalTimePickerMinutes;
@property (nonatomic) NSUInteger goalTimeInSeconds;
@property (nonatomic) BOOL quantsEnabled;
@property (nonatomic, strong) NSString *quantUnitType;


//cancel adding the info for task and return to maintableview
-(void)didCancelNewTask:(id)sender;

//hit the timer button - validate info, proceed to timer stage...
-(void)didAddNewTask:(id)sender;

//save for later - file as incomplete...
-(void)didSaveNewTask:(id)sender;

@end
