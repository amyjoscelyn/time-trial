//
//  Prerequisite+CoreDataProperties.h
//  TimeTrial
//
//  Created by Amy Joscelyn on 5/9/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Prerequisite.h"

NS_ASSUME_NONNULL_BEGIN

@interface Prerequisite (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *stringValue;
@property (nullable, nonatomic, retain) NSString *storyID;
@property (nullable, nonatomic, retain) NSString *comparator;
@property (nullable, nonatomic, retain) NSString *comment;
@property (nullable, nonatomic, retain) NSString *objectChecked;
@property (nullable, nonatomic, retain) NSString *propertyChecked;
@property (nullable, nonatomic, retain) NSSet<Question *> *questions;
@property (nullable, nonatomic, retain) NSSet<Choice *> *choices;
@property (nullable, nonatomic, retain) NSSet<Effect *> *effects;

@end

@interface Prerequisite (CoreDataGeneratedAccessors)

- (void)addQuestionsObject:(Question *)value;
- (void)removeQuestionsObject:(Question *)value;
- (void)addQuestions:(NSSet<Question *> *)values;
- (void)removeQuestions:(NSSet<Question *> *)values;

- (void)addChoicesObject:(Choice *)value;
- (void)removeChoicesObject:(Choice *)value;
- (void)addChoices:(NSSet<Choice *> *)values;
- (void)removeChoices:(NSSet<Choice *> *)values;

- (void)addEffectsObject:(Effect *)value;
- (void)removeEffectsObject:(Effect *)value;
- (void)addEffects:(NSSet<Effect *> *)values;
- (void)removeEffects:(NSSet<Effect *> *)values;

@end

NS_ASSUME_NONNULL_END
