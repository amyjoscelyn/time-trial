//
//  Question.h
//  TimeTrial
//
//  Created by Amy Joscelyn on 5/9/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Choice, Effect, Playthrough, Prerequisite;

NS_ASSUME_NONNULL_BEGIN

@interface Question : NSManagedObject

+ (Question *)createQuestionFromCSVRow:(NSArray *)csvRow managedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

NS_ASSUME_NONNULL_END

#import "Question+CoreDataProperties.h"
