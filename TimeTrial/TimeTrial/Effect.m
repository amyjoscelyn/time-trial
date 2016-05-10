//
//  Effect.m
//  TimeTrial
//
//  Created by Amy Joscelyn on 5/9/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "Effect.h"
#import "Choice.h"
#import "Prerequisite.h"
#import "Question.h"

@implementation Effect

+ (Effect *)createEffectFromCSVRow:(NSArray *)csvRow managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Effect *effect = [NSEntityDescription insertNewObjectForEntityForName:@"Effect" inManagedObjectContext:managedObjectContext];
    effect.storyID = csvRow[0];
    effect.comment = csvRow[1];
    // 2 is choices
    // 3 is questions       //is this a row in the csv?
    // 4 is prerequisites
    effect.objectAffected = csvRow[5];
    effect.propertyAffected = csvRow[6];
    effect.operator = csvRow[7];
    effect.stringValue = csvRow[8];
    
    //    NSLog(@"Effect: %@", effect);
    return effect;
}

- (NSString *)description
{
    NSMutableString *description = [[NSMutableString alloc] initWithString:@"Effect - "];
    [description appendFormat:@"%@ - %@", self.storyID, self.comment];
    [description appendFormat:@"\n  %@.%@", self.objectAffected, self.propertyAffected];
    [description appendFormat:@" %@ %@", self.operator, self.stringValue];
    
    return description;
}

@end
