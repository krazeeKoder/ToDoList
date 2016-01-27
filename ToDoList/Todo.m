//
//  Todo.m
//  ToDoList
//
//  Created by Anthony Tulai on 2016-01-26.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "Todo.h"

@implementation Todo

-(instancetype) initWithTitle:(NSString *)title Description:(NSString *)description Priority:(int)priority {
    self = [super init];
    if (self) {
        _title = title;
        _desc = description;
        _priorityNumber = priority;
        _completed = NO;
    }
    return self;
}

@end
