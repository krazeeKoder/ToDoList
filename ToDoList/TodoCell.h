//
//  TodoCell.h
//  ToDoList
//
//  Created by Anthony Tulai on 2016-01-26.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodoCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UILabel *descriptionPreview;
@property (strong, nonatomic) IBOutlet UILabel *priorityNumber;



@end
