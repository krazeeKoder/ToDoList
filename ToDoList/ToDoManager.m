//
//  Master.m
//  ToDoList
//
//  Created by Anthony Tulai on 2016-01-26.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "ToDoManager.h"
#import "Todo.h"

@implementation ToDoManager

-(instancetype) init {
    self = [super init];
    if (self) {
        _toDoList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addTodoItemWithTitle:(NSString *)title Description:(NSString *)description Priority:(int)priority {
    Todo *newTodoObject = [[Todo alloc] initWithTitle:title Description:description Priority:priority];
    [self.toDoList addObject:newTodoObject];
}


@end
