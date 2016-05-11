//
//  Playthrough+CoreDataProperties.h
//  
//
//  Created by Amy Joscelyn on 5/11/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Playthrough.h"

NS_ASSUME_NONNULL_BEGIN

@interface Playthrough (CoreDataProperties)

@property (nonatomic) int64_t day;
@property (nonatomic) int64_t hour;
@property (nullable, nonatomic, retain) Question *currentQuestion;
@property (nullable, nonatomic, retain) Character *playerCharacter;

@end

NS_ASSUME_NONNULL_END
