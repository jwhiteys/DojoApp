//
//  DojoDetailVC_iPad.h
//  Dojo
//
//  Created by Justin Skweres on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DojoDetailVC_iPad : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) UIPopoverController *popover;
@property (strong, nonatomic) UIBarButtonItem *mainListBarButton;

-(void)displayMainPopover:(id)sender;

@end
