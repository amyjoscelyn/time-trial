//
//  AMYMainTableViewController.m
//  TimeTrial
//
//  Created by Amy Joscelyn on 5/6/16.
//  Copyright © 2016 Amy Joscelyn. All rights reserved.
//

#import "AMYMainTableViewController.h"
#import "AMYStoryDataStore.h"
#import "AMYDetailManager.h"

@interface AMYMainTableViewController ()

@property (nonatomic, strong) AMYStoryDataStore *dataStore;
@property (nonatomic, strong) AMYDetailManager *detailManager;
@property (strong, nonatomic) Question *currentQuestion;
@property (strong, nonatomic) NSArray *sortedChoices;
@property (strong, nonatomic) NSMutableArray *choicesArray;

@property (nonatomic) NSInteger selectedRow;

@end

@implementation AMYMainTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.dataStore = [AMYStoryDataStore sharedStoryDataStore];
    
    [self.dataStore fetchData];
    
    [self.detailManager resetAttributes];
    
    [self setCurrentQuestionOfStory:self.dataStore.playthrough.currentQuestion];
    
    self.selectedRow = 10;
    
    self.detailManager = [AMYDetailManager new];
}

- (void)setCurrentQuestionOfStory:(Question *)currentQuestion
{
    _currentQuestion = currentQuestion;
    _sortedChoices = [currentQuestion.choiceOuts sortedArrayUsingDescriptors:@[self.dataStore.sortByStoryIDAsc]];
    
    _dataStore.playthrough.currentQuestion = currentQuestion;
    
    NSLog(@"current question: %@", currentQuestion.content);
    [_dataStore saveContext];
    
    [self generateChoicesArrayForCurrentQuestion:currentQuestion];
}

- (void)generateChoicesArrayForCurrentQuestion:(Question *)currentQuestion
{
    self.choicesArray = [[NSMutableArray alloc] init];
    
//    NSLog(@"number of choices: %lu", self.sortedChoices.count);
    
    if (self.sortedChoices.count > 0)
    {
//        NSString *choiceStoryID = @"";
        for (Choice *choice in currentQuestion.choiceOuts)
        {
            NSLog(@"Choice = %@", choice);
            NSLog(@"choice.effects: %@", choice.effects);
//            if ([choice.storyID isEqualToString:choiceStoryID])
//            {
                [self.choicesArray addObject:choice];
//            }
        }
    }
    else
    {
        for (Choice *choice in currentQuestion.choiceOuts)
        {
            if (choice.prerequisites.count == 0)
            {
                [self.choicesArray addObject:choice];
            }
            else
            {
                BOOL passesCheck = NO;
                
                for (Prerequisite *prereq in choice.prerequisites)
                {
                    //passesCheck must come back as YES to be displayed among the choices
                    passesCheck = [self.detailManager checkPrerequisite:prereq];
                    
                    if (passesCheck)
                    {
                        //                            NSLog(@"%@ should be displayed", choice.content);
                        [self.choicesArray addObject:choice];
                    }
                    else //I don't really need this but I'll keep it here for now to make sure it works
                    {
                        //                            NSLog(@"%@ should NOT be displayed", choice.content);
                    }
                }
            }
        }
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
        {
            return 1;
        }
        case 1:
        {
            NSInteger choiceOutsCount = self.choicesArray.count;
            if (choiceOutsCount > 0)
            {
                return choiceOutsCount;
            }
            else
            {
                return 1;
            }
        }
        default:
        {
            return 0;
        }
    }
}

//this is a messy, messy method
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StoryCell" forIndexPath:indexPath];
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    if (section == 0)
    {
        NSString *content = [self.currentQuestion.content mutableCopy];
        
        if ([content containsString:@"#"])
        {
            content = [self.detailManager replaceContent:content];
        }
        cell.textLabel.text = content;
        cell.textLabel.numberOfLines = 0;
        
        cell.detailTextLabel.hidden = YES;
        
        cell.userInteractionEnabled = NO;
        tableView.rowHeight = UITableViewAutomaticDimension;
        tableView.estimatedRowHeight = 45;
    }
    else if (section == 1)
    {
//        NSLog(@"choices: %lu", self.choicesArray.count);
        if (self.choicesArray.count > 0)
        {
            Choice *choice = self.choicesArray[row];
            cell.textLabel.text = choice.content;
        }
        else if (self.currentQuestion.questionAfter)
        {//maybe this should be in section 3, and hide section 2?
            cell.textLabel.text = @"Continue";
        }
        else if ([self.currentQuestion.content isEqualToString:@"THE END."])
        {
            cell.textLabel.text = @"(tap to restart)";
        }
        else
        {
            cell.textLabel.text = @"You have reached a precarious end with no further content! (Hang here for a bit or tap to restart)";
        }
        cell.textLabel.numberOfLines = 0;
        cell.detailTextLabel.hidden = YES;
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = indexPath.section;
    NSUInteger indentation = 0;
    
    if (section)
    {
        indentation += 3;
    }
    return indentation;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) { return; }
    
    NSUInteger row = indexPath.row;
    
    if (self.selectedRow != row)
    {
        self.selectedRow = row;
        return;
    }
    
    if (self.currentQuestion.effects.count > 0)
    {
        //this takes care of effects the currentQuestion might incur
        for (Effect *thing in self.currentQuestion.effects)
        {
            [self.detailManager doThe:thing];
        }
    }
    
    if (self.currentQuestion.questionAfter)
    {
        [self setCurrentQuestionOfStory:self.currentQuestion.questionAfter];
    }
    else if (self.choicesArray.count > 0)
    {
        Choice *selectedChoice = self.choicesArray[row];
        NSLog(@"self.choicesArray.count = %li", self.choicesArray.count);
        NSLog(@"selectedChoice.effects.count = %li", selectedChoice.effects.count);
        
        if (selectedChoice.effects.count)
        {
            for (Effect *thing in selectedChoice.effects)
            {
                if ([thing.stringValue isEqualToString:@""])
                {
                    Choice *selectedChoice = self.choicesArray[row];
                    thing.stringValue = selectedChoice.content;
                }
                [self.detailManager doThe:thing];
            }
        }
        [self setCurrentQuestionOfStory:selectedChoice.questionOut];
    }
    else
    {
        [self setCurrentQuestionOfStory:self.dataStore.questions[0]];
        
        // below resets the properties
        [self.detailManager resetAttributes];
        
        [_dataStore saveContext];
        
        // go to next chapter or restart here
    }
    self.selectedRow = 10;
    
    [self.tableView reloadData];
}

/*
 add .gitignore
 */

@end
