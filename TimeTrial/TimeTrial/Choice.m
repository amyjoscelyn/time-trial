//
//  Choice.m
//  TimeTrial
//
//  Created by Amy Joscelyn on 5/9/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "Choice.h"

@implementation Choice

+ (Choice *)createChoiceFromCSVRow:(NSArray *)csvRow managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Choice *choice = [NSEntityDescription insertNewObjectForEntityForName:@"Choice" inManagedObjectContext:managedObjectContext];
    choice.storyID = csvRow[0];
    choice.comment = csvRow[1];
    // 2 is questionIns
    // 3 is prerequisites
    // 4 is effects
    // 5 is destinationID/questionOut
    choice.content = csvRow[6];
    
    //    NSLog(@"Choice: %@", choice);
    return choice;
}

- (NSString *)description
{
    NSMutableString *description = [[NSMutableString alloc] initWithString:@"Choice - "];
    [description appendFormat:@"%@ - %@", self.storyID, self.comment];
    //    [description appendFormat:@"\n %@", self.effects];
    [description appendFormat:@"\n %@", self.content];
    
    return description;
}

@end
