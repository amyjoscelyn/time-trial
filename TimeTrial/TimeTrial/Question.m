//
//  Question.m
//  TimeTrial
//
//  Created by Amy Joscelyn on 5/9/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "Question.h"
#import "Choice.h"
#import "Playthrough.h"

@implementation Question

+ (Question *)createQuestionFromCSVRow:(NSArray *)csvRow managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Question *question = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:managedObjectContext];
    question.storyID = csvRow[0];
    question.comment = csvRow[1];
    // 2 is prerequisites
    // 3 is effects
    // 4 is questionBefores
    // 5 is questionAfter
    // 6 is choiceIns
    // 7 is choiceOuts
    question.content = csvRow[8];
    
    //    NSLog(@"Question: %@", question);
    return question;
}

- (NSString *)description
{
    NSMutableString *description = [[NSMutableString alloc] initWithString:@"Question - "];
    [description appendFormat:@"%@ - %@", self.storyID, self.comment];
    [description appendFormat:@"\n %@", self.content];
    
    return description;
}

@end
