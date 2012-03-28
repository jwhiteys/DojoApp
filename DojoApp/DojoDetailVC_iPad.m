//
//  DojoDetailVC_iPad.m
//  Dojo
//
//  Created by Justin Skweres on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DojoDetailVC_iPad.h"
#import "AppDelegate.h"

@implementation DojoDetailVC_iPad

@synthesize popover=_popover;
@synthesize mainListBarButton=_mainListBarButton;

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


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Dojo";  //set to this for now... will need to come back and set the title to dynamically
                            //pull from whatever the detail view is showing (subject, goal, or task title)
                            //FIX THIS...
    self.view.backgroundColor = [UIColor grayColor];
    self.popover = [[UIPopoverController alloc] initWithContentViewController:
                            [[[(AppDelegate *)[[UIApplication sharedApplication] delegate] splitViewController] viewControllers] objectAtIndex:0]];
    self.mainListBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(displayMainPopover:)];
    if (UIInterfaceOrientationPortrait | UIInterfaceOrientationPortraitUpsideDown) {
        self.navigationItem.leftBarButtonItem = self.mainListBarButton;
    }
}


- (void)viewDidUnload
{
    [self setPopover:nil];
    [self setMainListBarButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

#pragma mark - UISplitViewControllerDelegate Protocol Methods

-(void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc
{
    NSLog(@"Rotating to Portrait - will call splitVC delegate method...");
    self.navigationItem.leftBarButtonItem = self.mainListBarButton;
}

-(void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSLog(@"Rotating to Landscape - trying to invalidate button/popover combination...");
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
}

-(void)displayMainPopover:(id)sender
{
    if (![self.popover isPopoverVisible]) 
    {
        [self.popover presentPopoverFromBarButtonItem:self.mainListBarButton permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    } else {
        [self.popover dismissPopoverAnimated:YES];
    }
}
                                        
@end
