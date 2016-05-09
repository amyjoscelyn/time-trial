//
//  Question+CoreDataProperties.m
//  TimeTrial
//
//  Created by Amy Joscelyn on 5/9/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Question+CoreDataProperties.h"

@implementation Question (CoreDataProperties)

@dynamic storyID;
@dynamic content;
@dynamic comment;
@dynamic prerequisites;
@dynamic effects;
@dynamic choiceOuts;
@dynamic choiceIns;
@dynamic playthrough;
@dynamic questionBefores;
@dynamic questionAfter;

@end
