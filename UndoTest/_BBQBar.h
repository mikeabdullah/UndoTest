// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BBQBar.h instead.

#import <CoreData/CoreData.h>





@interface BBQBarID : NSManagedObjectID {}
@end

@interface _BBQBar : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (BBQBarID*)objectID;




@property (nonatomic, retain) NSNumber *someValue;


@property int someValueValue;
- (int)someValueValue;
- (void)setSomeValueValue:(int)value_;

//- (BOOL)validateSomeValue:(id*)value_ error:(NSError**)error_;





@end

@interface _BBQBar (CoreDataGeneratedAccessors)

@end

@interface _BBQBar (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber*)primitiveSomeValue;
- (void)setPrimitiveSomeValue:(NSNumber*)value;

- (int)primitiveSomeValueValue;
- (void)setPrimitiveSomeValueValue:(int)value_;




@end
