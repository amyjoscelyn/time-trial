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
    
    NSString *actionObject = thing.actionObject;
    
    if ([actionObject isEqualToString:@"story"])
    {
        [self managePlaythrough:thing];
    }
    else if ([actionObject isEqualToString:@"character"])
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
    NSString *actionProperty = effect.actionProperty;
    BOOL boolValue = effect.stringValue.boolValue;
    
    if ([actionProperty isEqualToString:@"fontChange"])
    {
        self.dataStore.playthrough.fontChange = boolValue;
    }
    else if ([actionProperty isEqualToString:@"creativityChosen"])
    {
        self.dataStore.playthrough.creativityChosen = YES;
    }
    else if ([actionProperty isEqualToString:@"intelligenceChosen"])
    {
        self.dataStore.playthrough.intelligenceChosen = YES;
    }
    else if ([actionProperty isEqualToString:@"obedienceChosen"])
    {
        self.dataStore.playthrough.obedienceChosen = YES;
    }
    else if ([actionProperty isEqualToString:@"empathyChosen"])
    {
        self.dataStore.playthrough.empathyChosen = YES;
    }
    else if ([actionProperty isEqualToString:@"instinctChosen"])
    {
        self.dataStore.playthrough.instinctChosen = YES;
    }
    else if ([actionProperty isEqualToString:@"perseveranceChosen"])
    {
        self.dataStore.playthrough.perseveranceChosen = YES;
    }
    else if ([actionProperty isEqualToString:@"kindnessChosen"])
    {
        self.dataStore.playthrough.kindnessChosen = YES;
    }
    else if ([actionProperty isEqualToString:@"strengthChosen"])
    {
        self.dataStore.playthrough.strengthChosen = YES;
    }
    else if ([actionProperty isEqualToString:@"graceChosen"])
    {
        self.dataStore.playthrough.graceChosen = YES;
    }
    else if ([actionProperty isEqualToString:@"intellectChosen"])
    {
        self.dataStore.playthrough.intellectChosen = YES;
    }
    else if ([actionProperty isEqualToString:@"imaginationChosen"])
    {
        self.dataStore.playthrough.imaginationChosen = YES;
    }
    else if ([actionProperty isEqualToString:@"caringChosen"])
    {
        self.dataStore.playthrough.caringChosen = YES;
    }
    else if ([actionProperty isEqualToString:@"wondermentChosen"])
    {
        self.dataStore.playthrough.wondermentChosen = YES;
    }
    else if ([actionProperty isEqualToString:@"curiosityChosen"])
    {
        self.dataStore.playthrough.curiosityChosen = YES;
    }
    else
    {
        NSLog(@"***ERROR: Action property %@ does not match anything", actionProperty);
    }
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
    NSString *actionProperty = effect.actionProperty;
    //    NSString *stringValue = effect.stringValue;
    
    if ([actionProperty isEqualToString:@"stateOfAcceptance"])
    {
        NSInteger majorValue = self.dataStore.playerCharacter.chosenMajorValue;
        
        if (majorValue > 15)
        {
            self.dataStore.playerCharacter.stateOfAcceptance = @"Exceptional Acceptance";
        }
        else if (majorValue > 12)
        {
            self.dataStore.playerCharacter.stateOfAcceptance = @"Regular Acceptance";
        }
        else if (majorValue >= 10)
        {
            self.dataStore.playerCharacter.stateOfAcceptance = @"Barely Accepted";
        }
        else if (majorValue < 7)
        {
            self.dataStore.playerCharacter.stateOfAcceptance = @"Regular Rejection";
        }
        else
        {
            self.dataStore.playerCharacter.stateOfAcceptance = @"Barely Rejected";
        }
    }
}

- (void)integerEffectCharacterHandler:(Effect *)effect
{
    NSString *actionProperty = effect.actionProperty;
    NSInteger integerValue = effect.stringValue.integerValue;
    
    if ([actionProperty isEqualToString:@"charm"])
    {
        self.dataStore.playerCharacter.charm += integerValue;
    }
    else if ([actionProperty isEqualToString:@"practical"])
    {
        self.dataStore.playerCharacter.practical += integerValue;
    }
    else if ([actionProperty isEqualToString:@"history"])
    {
        self.dataStore.playerCharacter.history += integerValue;
    }
    else if ([actionProperty isEqualToString:@"potions"])
    {
        self.dataStore.playerCharacter.potions += integerValue;
    }
    else if ([actionProperty isEqualToString:@"healing"])
    {
        self.dataStore.playerCharacter.healing += integerValue;
    }
    else if ([actionProperty isEqualToString:@"divining"])
    {
        self.dataStore.playerCharacter.divining += integerValue;
    }
    else if ([actionProperty isEqualToString:@"animalia"])
    {
        self.dataStore.playerCharacter.animalia += integerValue;
    }
    else
    {
        NSLog(@"***ERROR: ACTION PROPERTY %@ DOES NOT MATCH ATTRIBUTE", actionProperty);
    }
}

#pragma Checking Prerequisites

- (BOOL)checkPrerequisite:(Prerequisite *)prerequisite
{
    [self fetchDataStoreData];
    
    NSString *checkObject = prerequisite.checkObject;
    BOOL passesCheck;
    
    if ([checkObject isEqualToString:@"story"])
    {
        passesCheck = [self checkPlaythroughPrerequisite:prerequisite];
    }
    else if ([checkObject isEqualToString:@"character"])
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
    NSString *checkProperty = prerequisite.checkProperty;
    BOOL boolValue = prerequisite.stringValue.boolValue;
    BOOL passesCheck;
    
    
    if ([checkProperty isEqualToString:@"creativityChosen"])
    {
        BOOL creativityChosen = self.dataStore.playthrough.creativityChosen;
        
        if (boolValue == creativityChosen)
        {
            passesCheck = NO;
        }
        else
        {
            passesCheck = YES;
        }
    }
    else if ([checkProperty isEqualToString:@"intelligenceChosen"])
    {
        BOOL intelligenceChosen = self.dataStore.playthrough.intelligenceChosen;
        if (boolValue == intelligenceChosen)
        {
            passesCheck = NO;
        }
        else
        {
            passesCheck = YES;
        }
    }
    else if ([checkProperty isEqualToString:@"obedienceChosen"])
    {
        BOOL obedienceChosen = self.dataStore.playthrough.obedienceChosen;
        if (boolValue == obedienceChosen)
        {
            passesCheck = NO;
        }
        else
        {
            passesCheck = YES;
        }
    }
    else if ([checkProperty isEqualToString:@"empathyChosen"])
    {
        BOOL empathyChosen = self.dataStore.playthrough.empathyChosen;
        if (boolValue == empathyChosen)
        {
            passesCheck = NO;
        }
        else
        {
            passesCheck = YES;
        }
    }
    else if ([checkProperty isEqualToString:@"instinctChosen"])
    {
        BOOL instinctChosen = self.dataStore.playthrough.instinctChosen;
        if (boolValue == instinctChosen)
        {
            passesCheck = NO;
        }
        else
        {
            passesCheck = YES;
        }
    }
    else if ([checkProperty isEqualToString:@"perseveranceChosen"])
    {
        BOOL perseveranceChosen = self.dataStore.playthrough.perseveranceChosen;
        if (boolValue == perseveranceChosen)
        {
            passesCheck = NO;
        }
        else
        {
            passesCheck = YES;
        }
    }
    else if ([checkProperty isEqualToString:@"kindnessChosen"])
    {
        BOOL kindnessChosen = self.dataStore.playthrough.kindnessChosen;
        if (boolValue == kindnessChosen)
        {
            passesCheck = NO;
        }
        else
        {
            passesCheck = YES;
        }
    }
    else if ([checkProperty isEqualToString:@"strengthChosen"])
    {
        BOOL strengthChosen = self.dataStore.playthrough.strengthChosen;
        if (boolValue == strengthChosen)
        {
            passesCheck = NO;
        }
        else
        {
            passesCheck = YES;
        }
    }
    else if ([checkProperty isEqualToString:@"graceChosen"])
    {
        BOOL graceChosen = self.dataStore.playthrough.graceChosen;
        if (boolValue == graceChosen)
        {
            passesCheck = NO;
        }
        else
        {
            passesCheck = YES;
        }
    }
    else if ([checkProperty isEqualToString:@"intellectChosen"])
    {
        BOOL intellectChosen = self.dataStore.playthrough.intellectChosen;
        if (boolValue == intellectChosen)
        {
            passesCheck = NO;
        }
        else
        {
            passesCheck = YES;
        }
    }
    else if ([checkProperty isEqualToString:@"imaginationChosen"])
    {
        BOOL imaginationChosen = self.dataStore.playthrough.imaginationChosen;
        if (boolValue == imaginationChosen)
        {
            passesCheck = NO;
        }
        else
        {
            passesCheck = YES;
        }
    }
    else if ([checkProperty isEqualToString:@"caringChosen"])
    {
        BOOL caringChosen = self.dataStore.playthrough.caringChosen;
        if (boolValue == caringChosen)
        {
            passesCheck = NO;
        }
        else
        {
            passesCheck = YES;
        }
    }
    else if ([checkProperty isEqualToString:@"wondermentChosen"])
    {
        BOOL wondermentChosen = self.dataStore.playthrough.wondermentChosen;
        if (boolValue == wondermentChosen)
        {
            passesCheck = NO;
        }
        else
        {
            passesCheck = YES;
        }
    }
    else if ([checkProperty isEqualToString:@"curiosityChosen"])
    {
        BOOL curiosityChosen = self.dataStore.playthrough.curiosityChosen;
        if (boolValue == curiosityChosen)
        {
            passesCheck = NO;
        }
        else
        {
            passesCheck = YES;
        }
    }
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
    
    NSString *checkProperty = prerequisite.checkProperty;
    NSString *stringValue = prerequisite.stringValue;
    
    if ([checkProperty isEqualToString:@"stateOfAcceptance"])
    {
        //        NSLog(@"state of acceptance: %@", stringValue);
        if ([stringValue isEqualToString:self.dataStore.playerCharacter.stateOfAcceptance])
        {
            passesCheck = YES;
        }
    }
    
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
    
    if ([content containsString:@"#highestMajorColor"])
    {
        //        NSLog(@"major color: %@", self.dataStore.playerCharacter.chosenMajorColor);
        content = [content stringByReplacingOccurrencesOfString:@"#highestMajorColor" withString:self.dataStore.playerCharacter.chosenMajorColor];
    }
    if ([content containsString:@"#highestMajor"])
    {
        //        NSLog(@"highest major: %@", self.dataStore.playerCharacter.chosenMajor);
        content = [content stringByReplacingOccurrencesOfString:@"#highestMajor" withString:self.dataStore.playerCharacter.chosenMajor.capitalizedString];
    }
    
    return content;
}

- (void)resetAttributes
{
    [self fetchDataStoreData];
    
    //restore all properties to original new-game-state here
}

@end
