//
//  Character.m
//  TimeTrial
//
//  Created by Amy Joscelyn on 5/9/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "Character.h"

@implementation Character

+ (Character *)createNewCharacterWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Character *character = [NSEntityDescription insertNewObjectForEntityForName:@"Character" inManagedObjectContext:managedObjectContext];
    
    //    NSLog(@"we've created a new character!");
    
    return character;
}

@end
