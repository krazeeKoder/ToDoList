//
//  Todo.h
//  ToDoList
//
//  Created by Anthony Tulai on 2016-01-26.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *desc;
@property (assign, nonatomic) int priorityNumber;
@property (assign, nonatomic) bool completed;

-(instancetype) initWithTitle:(NSString *)title Description:(NSString *)description Priority:(int)priority;


@end
