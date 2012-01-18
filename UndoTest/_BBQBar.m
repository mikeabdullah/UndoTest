// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to BBQBar.m instead.

#import "_BBQBar.h"

@implementation BBQBarID
@end

@implementation _BBQBar

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"BBQBar" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"BBQBar";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"BBQBar" inManagedObjectContext:moc_];
}

- (BBQBarID*)objectID {
	return (BBQBarID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"someValueValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"someValue"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic someValue;



- (int)someValueValue {
	NSNumber *result = [self someValue];
	return [result intValue];
}

- (void)setSomeValueValue:(int)value_ {
	[self setSomeValue:[NSNumber numberWithInt:value_]];
}

- (int)primitiveSomeValueValue {
	NSNumber *result = [self primitiveSomeValue];
	return [result intValue];
}

- (void)setPrimitiveSomeValueValue:(int)value_ {
	[self setPrimitiveSomeValue:[NSNumber numberWithInt:value_]];
}









@end
