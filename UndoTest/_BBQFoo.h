// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BBQFoo.h instead.

#import <CoreData/CoreData.h>





@interface BBQFooID : NSManagedObjectID {}
@end

@interface _BBQFoo : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (BBQFooID*)objectID;




@property (nonatomic, retain) NSDate *testTime;


//- (BOOL)validateTestTime:(id*)value_ error:(NSError**)error_;





@end

@interface _BBQFoo (CoreDataGeneratedAccessors)

@end

@interface _BBQFoo (CoreDataGeneratedPrimitiveAccessors)


- (NSDate*)primitiveTestTime;
- (void)setPrimitiveTestTime:(NSDate*)value;




@end
