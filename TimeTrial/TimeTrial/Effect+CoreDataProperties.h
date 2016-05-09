//
//  Effect+CoreDataProperties.h
//  TimeTrial
//
//  Created by Amy Joscelyn on 5/9/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Effect.h"

NS_ASSUME_NONNULL_BEGIN

@interface Effect (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *stringValue;
@property (nullable, nonatomic, retain) NSString *storyID;
@property (nullable, nonatomic, retain) NSString *operator;
@property (nullable, nonatomic, retain) NSString *comment;
@property (nullable, nonatomic, retain) NSString *objectAffected;
@property (nullable, nonatomic, retain) NSString *propertyAffected;
@property (nullable, nonatomic, retain) NSSet<Prerequisite *> *prerequisites;
@property (nullable, nonatomic, retain) NSSet<Question *> *questions;
@property (nullable, nonatomic, retain) NSSet<Choice *> *choices;

@end

@interface Effect (CoreDataGeneratedAccessors)

- (void)addPrerequisitesObject:(Prerequisite *)value;
- (void)removePrerequisitesObject:(Prerequisite *)value;
- (void)addPrerequisites:(NSSet<Prerequisite *> *)values;
- (void)removePrerequisites:(NSSet<Prerequisite *> *)values;

- (void)addQuestionsObject:(Question *)value;
- (void)removeQuestionsObject:(Question *)value;
- (void)addQuestions:(NSSet<Question *> *)values;
- (void)removeQuestions:(NSSet<Question *> *)values;

- (void)addChoicesObject:(Choice *)value;
- (void)removeChoicesObject:(Choice *)value;
- (void)addChoices:(NSSet<Choice *> *)values;
- (void)removeChoices:(NSSet<Choice *> *)values;

@end

NS_ASSUME_NONNULL_END
