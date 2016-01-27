//
//  NewToDo.m
//  ToDoList
//
//  Created by Anthony Tulai on 2016-01-26.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "NewToDoViewController.h"
#import "Todo.h"

@implementation NewToDoViewController
- (IBAction)returnData:(id)sender {
    
    NSString *myNewTitle = self.addTitle.text;
    NSString *myNewDescription = self.addDescription.text;
    int myNewPriority = [self.addPriority.text intValue];
    
    //[self.delegate updateNewToDoWithTitle:myNewTitle Description:myNewDescription Priority:myNewPriority];
    [self.delegate updateNewToDo:self title:myNewTitle desc:myNewDescription priority:myNewPriority];
}

@end
