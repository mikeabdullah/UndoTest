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

- (void)dealloc
{
    [_managedObjectContext release];
    [super dealloc];
}

@end
