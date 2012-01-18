// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BBQFoo.m instead.

#import "_BBQFoo.h"

@implementation BBQFooID
@end

@implementation _BBQFoo

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"BBQFoo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"BBQFoo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"BBQFoo" inManagedObjectContext:moc_];
}

- (BBQFooID*)objectID {
	return (BBQFooID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic testTime;










@end
