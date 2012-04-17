//
//  DojoTimerVC.h
//  Dojo
//
//  Created by Justin Skweres on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//Timer VC should be a large timer with Ding button and optional button to increment a specified value (use a plus sign?).  Also
//needs a break/pause button, a resume button, a cancel button.  Must register all interruptions to a task - app going to background for
//any reason.  This is not stored in VC (only responsible for the view) Send to the data manager! 

@protocol DojoTimerVCDelegate <NSObject>
    
        //implement a protocol that the data manager will follow... tasks will be constantly updated while they are occuring and saved
            //to the context...

@end

@interface DojoTimerVC : UIViewController


//needs to update the location field of the task when the timer is called.  This
////is because the task may be scheduled and saved, not started immediately.

//UIKit Elements



//Location Manager for where the task is actually performed (may be put in earlier)


-(void)incrementDing:(id)sender;  //Target/Action for incrementing ding count when button pressed

-(void)pauseTask:(id)sender;       //not implemented

-(void)resumeTask:(id)sender;       //not implemented

-(void)startTimer;          //not implemented

-(void)stopTimer;           //not implemented


@end
