//
//  BBQFlipsideViewController.h
//  UndoTest
//
//  Created by Patrick Burleson on 1/18/12.
//  Copyright (c) 2012 BitBQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BBQFlipsideViewController;

@protocol BBQFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(BBQFlipsideViewController *)controller;
@end

@interface BBQFlipsideViewController : UIViewController

@property (assign, nonatomic) id <BBQFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
