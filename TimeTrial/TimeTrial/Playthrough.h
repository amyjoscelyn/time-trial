//
//  Playthrough.h
//  TimeTrial
//
//  Created by Amy Joscelyn on 5/9/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Question, Character;

NS_ASSUME_NONNULL_BEGIN

@interface Playthrough : NSManagedObject

+ (Playthrough *)createNewPlaythroughWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

NS_ASSUME_NONNULL_END

#import "Playthrough+CoreDataProperties.h"
