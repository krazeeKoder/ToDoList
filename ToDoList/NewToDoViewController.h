//
//  NewToDo.h
//  ToDoList
//
//  Created by Anthony Tulai on 2016-01-26.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"
@class NewToDoViewController;

@protocol NewToDoDelegate <NSObject>

//-(void)updateNewToDoWithTitle: (NSString *)title Description:(NSString *)description Priority: (int) priority;
-(void)updateNewToDo:(NewToDoViewController *)newTodo title: (NSString *)title desc:(NSString *)description priority: (int) priority;
@end

@interface NewToDoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *addTitle;
@property (strong, nonatomic) IBOutlet UITextView *addDescription;
@property (strong, nonatomic) IBOutlet UITextField *addPriority;
@property (weak, nonatomic) id <NewToDoDelegate> delegate;


@end
