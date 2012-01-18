//
//  BBQMainViewController.m
//  UndoTest
//
//  Created by Patrick Burleson on 1/18/12.
//  Copyright (c) 2012 BitBQ. All rights reserved.
//

#import "BBQMainViewController.h"

#import <objc/runtime.h>

#import "BBQAppDelegate.h"
#import "BBQBar.h"
#import "BBQFoo.h"

@interface BBQMainViewController ()

@property (nonatomic, retain) BBQFoo *foo;

- (void)handlePanGesture:(UIPanGestureRecognizer *)gesture;

@end

@implementation BBQMainViewController

@synthesize dragView = _dragView;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize foo = _foo;

#pragma mark - Memory Management

- (void)dealloc
{
    [_managedObjectContext release];
    [_dragView release];
    [_foo release];
    [super dealloc];
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:[BBQFoo entityName]];
    NSError *error = nil;
    NSArray *foos = [[UIApp managedObjectContext] executeFetchRequest:request error:&error];
    if ( !foos )
    {
        NSLog(@"Error executing fetch for Foo: %@", error);
        abort();
    }
    
    if ( [foos count] == 0 )
    {
        [self setFoo:[BBQFoo insertInManagedObjectContext:[UIApp managedObjectContext]]];
        [[self foo] setTestTime:[NSDate date]];
        [UIApp saveContext];
    }
    else
    {
        [self setFoo:[foos objectAtIndex:0]];
    }
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [panGesture setMinimumNumberOfTouches:1];
    [panGesture setMaximumNumberOfTouches:1];
    [[self dragView] addGestureRecognizer:panGesture];
    [panGesture release];
}

- (void)viewDidUnload
{
    [self setDragView:nil];
    [super viewDidUnload];
}

#pragma mark - Pan Gesture Handler

- (void)handlePanGesture:(UIPanGestureRecognizer *)gesture
{
    NSUndoManager *undoManager = [[UIApp managedObjectContext] undoManager];
    NSMutableString *stateString = [NSMutableString stringWithString:@"Gesture State: "];
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan:
            [stateString appendString:@"Began"];
            break;
        case UIGestureRecognizerStateEnded:
            [stateString appendString:@"Ended"];
            break;
        case UIGestureRecognizerStateCancelled:
            [stateString appendString:@"Cancelled"];
            break;
        case UIGestureRecognizerStateFailed:
            [stateString appendString:@"Failed"];
            break;
        case UIGestureRecognizerStateChanged:
            [stateString appendString:@"Changed"];
            break;
        case UIGestureRecognizerStatePossible:
            [stateString appendString:@"Possible"];
            break;
        default:
            break;
    }
    
    NSLog(@"%@", stateString);
    
    if (gesture.state == UIGestureRecognizerStateBegan)
    {
        [[UIApp managedObjectContext] processPendingChanges];
        id undoStack = nil;
        
        object_getInstanceVariable(undoManager, "_undoStack", &undoStack);
        NSLog(@"Undo stack at begin: %@", [undoStack description]);
        
        NSInteger undoGroupCount = [undoManager groupingLevel];
        NSLog(@"Undo grouping level count at begin: %i", undoGroupCount);
        
        if (undoGroupCount > 0)
        {
            [undoManager endUndoGrouping];
            undoGroupCount = [undoManager groupingLevel];
            NSLog(@"Undo grouping level count after closing existing group: %i", undoGroupCount);
        }
        
        
        [undoManager setGroupsByEvent:NO];
        [undoManager beginUndoGrouping];
        undoGroupCount = [undoManager groupingLevel];
        NSLog(@"Undo grouping level count after adding grouping: %i", undoGroupCount);
        
        undoStack = nil;
        object_getInstanceVariable(undoManager, "_undoStack", &undoStack);
        NSLog(@"Undo stack at after begin undo group: %@", [undoStack description]);
    }
    else if (gesture.state == UIGestureRecognizerStateEnded)
    {
        NSInteger undoGroupCount = [undoManager groupingLevel];
        NSLog(@"Undo grouping level count at end: %i", undoGroupCount);
        
        [[UIApp managedObjectContext] processPendingChanges];
        [undoManager endUndoGrouping];
        [undoManager setGroupsByEvent:YES];
        undoGroupCount = [undoManager groupingLevel];
        NSLog(@"Undo grouping level count after removing grouping and adding one: %i", undoGroupCount);
        
        id undoStack = nil;
        object_getInstanceVariable(undoManager, "_undoStack", &undoStack);
        NSLog(@"Undo stack at end: %@", [undoStack description]);
    }
    else if (gesture.state == UIGestureRecognizerStateCancelled)
    {
        NSInteger undoGroupCount = [undoManager groupingLevel];
        NSLog(@"Undo grouping level count at cancel: %i", undoGroupCount);
        [undoManager endUndoGrouping];
        [undoManager setGroupsByEvent:YES];
        [undoManager beginUndoGrouping];
        undoGroupCount = [undoManager groupingLevel];
        NSLog(@"Undo grouping level count after removing grouping and adding one: %i", undoGroupCount);
        [undoManager undo];
    }
    else
    {
        // Commenting out the next line removes the automatic core data groups
        [[self foo] setTestTime:[NSDate date]];
        NSInteger undoGroupCount = [undoManager groupingLevel];
        NSLog(@"Undo grouping level count at change: %i", undoGroupCount);
        
        id undoStack = nil;
        object_getInstanceVariable(undoManager, "_undoStack", &undoStack);
        NSLog(@"Undo stack at change: %@", [undoStack description]);
        
        
    }
}

@end
