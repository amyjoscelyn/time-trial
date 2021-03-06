//
//  Playthrough+CoreDataProperties.h
//  TimeTrial
//
//  Created by Amy Joscelyn on 5/13/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Playthrough.h"

NS_ASSUME_NONNULL_BEGIN

@interface Playthrough (CoreDataProperties)

@property (nonatomic) int64_t day;
@property (nonatomic) int64_t hour;
@property (nonatomic) BOOL newDay;
@property (nonatomic) BOOL sameDay;
@property (nullable, nonatomic, retain) Question *currentQuestion;
@property (nullable, nonatomic, retain) Character *playerCharacter;

@end

NS_ASSUME_NONNULL_END
