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

@synthesize dragView = _dragView;
@synthesize managedObjectContext = _managedObjectContext;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setDragView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)dealloc
{
    [_managedObjectContext release];
    [_dragView release];
    [super dealloc];
}

@end
