//
//  AMYDetailManager.m
//  TimeTrial
//
//  Created by Amy Joscelyn on 5/6/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMYDetailManager.h"

@interface AMYDetailManager ()

@property (nonatomic, strong) AMYStoryDataStore *dataStore;

@end

@implementation AMYDetailManager

- (void)fetchDataStoreData
{
    if (!self.dataStore)
    {
        self.dataStore = [AMYStoryDataStore sharedStoryDataStore];
        
        [self.dataStore fetchData];
    }
}

- (void)doThe:(Effect *)thing
{
    [self fetchDataStoreData];
    
    //Maybe I'll be able to parse down better with the comparator/operator--make that a sort of Group name, with the properties Grouped together based on type.  So it'll be a Type.  If it's a boolType (making/checking YES or NO), or a stringType (saving or checking to a string), or an integerType (adding or subtracting numbers, or checking equality), then that would narrow the properties down a lot, making the subsequent method called a lot more refined.
    
    //this handles all effects from selected choice or currentQuestion
    
    NSString *objectAffected = thing.objectAffected;
    
    if ([objectAffected isEqualToString:@"story"])
    {
        [self managePlaythrough:thing];
    }
    else if ([objectAffected isEqualToString:@"character"])
    {
        [self manageCharacter:thing];
    }
    else
    {
        NSLog(@"***Action %@ does not have object attributed to it.", thing.storyID);
    }
}

#pragma Playthrough Handling Effects

- (void)managePlaythrough:(Effect *)effect
{
    if ([effect.operator isEqualToString:@"BOOL"])
    {
        [self boolEffectPlaythroughHandler:effect];
    }
    else if ([effect.operator isEqualToString:@"string"])
    {
        [self stringEffectPlaythroughHandler:effect];
    }
    else
    {
        [self integerEffectPlaythroughHandler:effect];
    }
}

- (void)boolEffectPlaythroughHandler:(Effect *)effect
{
//    NSString *propertyAffected = effect.propertyAffected;
//    BOOL boolValue = effect.stringValue.boolValue;
}

- (void)stringEffectPlaythroughHandler:(Effect *)effect
{
    //these aren't used for current story
    //    NSString *actionProperty = effect.actionProperty;
    //    NSString *stringValue = effect.stringValue;
}

- (void)integerEffectPlaythroughHandler:(Effect *)effect
{
    //these aren't used for current story
    //    NSString *actionProperty = effect.actionProperty;
    //    NSInteger integerValue = effect.stringValue.integerValue;
}

#pragma Character Handling Manager

- (void)manageCharacter:(Effect *)effect
{
    if ([effect.operator isEqualToString:@"BOOL"])
    {
        [self boolEffectCharacterHandler:effect];
    }
    else if ([effect.operator isEqualToString:@"string"])
    {
        [self stringEffectCharacterHandler:effect];
    }
    else if ([effect.operator isEqualToString:@"integer"])
    {
        [self integerEffectCharacterHandler:effect];
    }
    else
    {
        NSLog(@"***ERROR: THERE IS NO OPERATOR TO CHANGE EFFECT %@ WITH.", effect.storyID);
    }
}

- (void)boolEffectCharacterHandler:(Effect *)effect
{
    //these aren't used for current story
    //    NSString *actionProperty = effect.actionProperty;
    //    BOOL boolValue = effect.stringValue.boolValue;
}

- (void)stringEffectCharacterHandler:(Effect *)effect
{
//    NSString *propertyAffected = effect.propertyAffected;
    //    NSString *stringValue = effect.stringValue;
}

- (void)integerEffectCharacterHandler:(Effect *)effect
{
//    NSString *propertyAffected = effect.propertyAffected;
//    NSInteger integerValue = effect.stringValue.integerValue;
}

#pragma Checking Prerequisites

- (BOOL)checkPrerequisite:(Prerequisite *)prerequisite
{
    [self fetchDataStoreData];
    
    NSString *objectChecked = prerequisite.objectChecked;
    BOOL passesCheck;
    
    if ([objectChecked isEqualToString:@"story"])
    {
        passesCheck = [self checkPlaythroughPrerequisite:prerequisite];
    }
    else if ([objectChecked isEqualToString:@"character"])
    {
        passesCheck = [self checkCharacterPrerequisite:prerequisite];
    }
    
    return passesCheck;
}

- (BOOL)checkPlaythroughPrerequisite:(Prerequisite *)prerequisite
{
    NSString *comparator = prerequisite.comparator;
    BOOL passesCheck = NO;
    
    if ([comparator isEqualToString:@"BOOL"])
    {
        passesCheck = [self checkPlaythroughBOOLPrerequisite:prerequisite];
    }
    else if ([comparator isEqualToString:@"string"])
    {
        passesCheck = [self checkPlaythroughStringPrerequisite:prerequisite];
    }
    else if ([comparator isEqualToString:@"integer"])
    {
        passesCheck = [self checkPlaythroughIntegerPrerequisite:prerequisite];
    }
    else
    {
        NSLog(@"***ERROR: THERE IS NO COMPARATOR TO CHECK PREREQUISITE %@ WITH.", prerequisite.storyID);
    }
    
    return passesCheck;
}

- (BOOL)checkPlaythroughBOOLPrerequisite:(Prerequisite *)prerequisite
{
//    NSString *propertyChecked = prerequisite.propertyChecked;
//    BOOL boolValue = prerequisite.stringValue.boolValue;
    BOOL passesCheck;
    
    return passesCheck;
}

- (BOOL)checkPlaythroughStringPrerequisite:(Prerequisite *)prerequisite
{
    //these aren't being used for current story
    //    NSString *checkProperty = prerequisite.checkProperty;
    //    NSString *stringValue = prerequisite.stringValue;
    
    return NO;
}

- (BOOL)checkPlaythroughIntegerPrerequisite:(Prerequisite *)prerequisite
{
    //these aren't being used for current story
    //    NSString *checkProperty = prerequisite.checkProperty;
    //    NSInteger integerValue = prerequisite.stringValue.integerValue;
    
    return NO;
}

- (BOOL)checkCharacterPrerequisite:(Prerequisite *)prerequisite
{
    NSString *comparator = prerequisite.comparator;
    BOOL passesCheck = NO;
    
    if ([comparator isEqualToString:@"BOOL"])
    {
        passesCheck = [self checkCharacterBOOLPrerequisite:prerequisite];
    }
    else if ([comparator isEqualToString:@"string"])
    {
        passesCheck = [self checkCharacterStringPrerequisite:prerequisite];
    }
    else
    {
        passesCheck = [self checkCharacterIntegerPrerequisite:prerequisite];
    }
    
    return passesCheck;
}

- (BOOL)checkCharacterBOOLPrerequisite:(Prerequisite *)prerequisite
{
    BOOL passesCheck = NO;
    return passesCheck;
}

- (BOOL)checkCharacterStringPrerequisite:(Prerequisite *)prerequisite
{
    BOOL passesCheck = NO;
    
//    NSString *propertyChecked = prerequisite.propertyChecked;
//    NSString *stringValue = prerequisite.stringValue;
    
    return passesCheck;
}

- (BOOL)checkCharacterIntegerPrerequisite:(Prerequisite *)prerequisite
{
    BOOL passesCheck = NO;
    return passesCheck;
}

#pragma Replace Content

- (NSString *)replaceContent:(NSString *)content
{
    [self fetchDataStoreData];
    
    if ([content containsString:@"#hour"])
    {
        NSInteger hour = (int)self.dataStore.playthrough.hour;
        NSNumber *hourNumber = @(hour);
        NSString *hourString = hourNumber.stringValue;
        content = [content stringByReplacingOccurrencesOfString:@"#hour" withString:hourString];
//        NSLog(@"Replaced Content: %@", content);
    }
    if ([content containsString:@"#day"])
    {
        NSInteger day = (int)self.dataStore.playthrough.day;
        NSNumber *hourNumber = @(day);
        NSString *dayString = hourNumber.stringValue;
        content = [content stringByReplacingOccurrencesOfString:@"#day" withString:dayString];
    }
    
    return content;
}

- (void)resetAttributes
{
    [self fetchDataStoreData];
    
    self.dataStore.playthrough.day = 0;
    self.dataStore.playthrough.hour = 0;
    self.dataStore.playthrough.newDay = NO;
    self.dataStore.playthrough.sameDay = YES;
    //restore all properties to original new-game-state here
}

@end
