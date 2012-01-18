//
//  BBQMainViewController.m
//  UndoTest
//
//  Created by Patrick Burleson on 1/18/12.
//  Copyright (c) 2012 BitBQ. All rights reserved.
//

#import "BBQMainViewController.h"

@interface BBQMainViewController ()

@end

@implementation BBQMainViewController

@synthesize managedObjectContext = _managedObjectContext;
@synthesize flipsidePopoverController = _flipsidePopoverController;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(BBQFlipsideViewController *)controller
{
    [self.flipsidePopoverController dismissPopoverAnimated:YES];
}

- (void)dealloc
{
    [_managedObjectContext release];
    [_flipsidePopoverController release];
    [super dealloc];
}

- (IBAction)showInfo:(id)sender
{
    if (!self.flipsidePopoverController) {
        BBQFlipsideViewController *controller = [[[BBQFlipsideViewController alloc] initWithNibName:@"BBQFlipsideViewController" bundle:nil] autorelease];
        controller.delegate = self;
        
        self.flipsidePopoverController = [[[UIPopoverController alloc] initWithContentViewController:controller] autorelease];
    }
    if ([self.flipsidePopoverController isPopoverVisible]) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
    } else {
        [self.flipsidePopoverController presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    }
}

@end
