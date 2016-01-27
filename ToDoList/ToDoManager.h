//
//  Master.h
//  ToDoList
//
//  Created by Anthony Tulai on 2016-01-26.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Todo.h"

@interface ToDoManager : NSObject

@property (strong, nonatomic) NSMutableArray *toDoList;

-(void)addTodoItemWithTitle:(NSString *)title Description:(NSString *)description Priority:(int)priority;

@end
