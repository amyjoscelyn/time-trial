//
//  Playthrough.m
//  TimeTrial
//
//  Created by Amy Joscelyn on 5/9/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "Playthrough.h"
#import "Character.h"

@implementation Playthrough

+ (Playthrough *)createNewPlaythroughWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Playthrough *playthrough = [NSEntityDescription insertNewObjectForEntityForName:@"Playthrough" inManagedObjectContext:managedObjectContext];
    
    //    NSLog(@"we're creating a new playthrough!");
    
    return playthrough;
}

@end
