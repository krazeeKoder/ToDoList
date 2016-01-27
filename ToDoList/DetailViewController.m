//
//  DetailViewController.m
//  ToDoList
//
//  Created by Anthony Tulai on 2016-01-26.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
//@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
//@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

//- (void)setDetailItem:(id)newDetailItem {
//    if (_detailItem != newDetailItem) {
//        _detailItem = newDetailItem;
//            
//        // Update the view.
//        [self configureView];
//    }
//}

//- (void)configureView {
//    // Update the user interface for the detail item.
//    if (self.detailItem) {
//        self.detailDescriptionLabel.text = [self.detailItem description];
//    }
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.text = self.detailTodo.title;
    self.descriptionLabel.text = self.detailTodo.desc;
    
//    // Do any additional setup after loading the view, typically from a nib.
//    [self configureView];
}


@end
