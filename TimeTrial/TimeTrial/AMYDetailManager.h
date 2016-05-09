//
//  AMYDetailManager.h
//  TimeTrial
//
//  Created by Amy Joscelyn on 5/6/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMYStoryDataStore.h"

@interface AMYDetailManager : NSObject

- (void)doThe:(Effect *)thing;

- (BOOL)checkPrerequisite:(Prerequisite *)prerequisite;

- (NSString *)replaceContent:(NSString *)content;

- (void)resetAttributes;

@end
