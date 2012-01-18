//
//  BBQMainViewController.h
//  UndoTest
//
//  Created by Patrick Burleson on 1/18/12.
//  Copyright (c) 2012 BitBQ. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface BBQMainViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIView *dragView;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
