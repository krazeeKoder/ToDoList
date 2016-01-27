//
//  MasterViewController.m
//  ToDoList
//
//  Created by Anthony Tulai on 2016-01-26.
//  Copyright © 2016 Anthony Tulai. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDoManager.h"
#import "TodoCell.h"
#import "NewToDoViewController.h"

@interface MasterViewController () <UITableViewDataSource, UITableViewDelegate, NewToDoDelegate>

@property NSMutableArray *objects;
@property (strong,nonatomic) ToDoManager *todoManager;


@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    self.todoManager = [ToDoManager new];

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    [self.todoManager addTodoItemWithTitle:@"Feed Cat" Description:@"Feed the kitty kibble not apples" Priority:1];
    [self.todoManager addTodoItemWithTitle:@"Do Lighthouse Homework" Description:@"Do the To-Do assignment and review/finish old assignments" Priority:2];
    [self.todoManager addTodoItemWithTitle:@"Do groceries" Description:@"Get milk and bread and meat and more kibble" Priority:3];
    [self.todoManager addTodoItemWithTitle:@"Do exercise" Description:@"Ab ripper and pushups and walk" Priority:4];
    [self.todoManager addTodoItemWithTitle:@"Sleep" Description:@"Get to bed before midnight" Priority:5];
    
    
    
    //UITableViewCell *displayInfo = [UITableView new];
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
//    if (!self.objects) {
//        self.objects = [[NSMutableArray alloc] init];
//    }
//    [self.objects insertObject:[NSDate date] atIndex:0];
    
    [self performSegueWithIdentifier:@"addTodo" sender:sender];
    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //NSDate *object = self.objects[indexPath.row];
        Todo *currentToDo = self.todoManager.toDoList[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
    
        
        
        controller.detailTodo = currentToDo;
        
        //[controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    } else if ([[segue identifier] isEqualToString:@"addTodo"]) {
        NewToDoViewController *todoToAdd = (NewToDoViewController *)[segue destinationViewController];
        todoToAdd.delegate = self;
        
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todoManager.toDoList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    TodoCell *todoCell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];
    
    Todo *currentTodoItem = self.todoManager.toDoList[indexPath.row];
    
    // Set the cell's labels using the object's properties
    todoCell.title.text = currentTodoItem.title;
    todoCell.descriptionPreview.text = currentTodoItem.desc;
    todoCell.priorityNumber.text = [NSString stringWithFormat:@"%d", currentTodoItem.priorityNumber];
    
    return todoCell;
    //NSDate *object = self.objects[indexPath.row];
    //cell.textLabel.text = [object description];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.todoManager.toDoList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}-(void)updateNewToDo:(NewToDoViewController *)newTodo title: (NSString *)title desc:(NSString *)description priority: (int) priority {
    Todo *myNewTodo = [[Todo alloc] initWithTitle:title Description:description Priority:priority];
    [self.todoManager.toDoList addObject:myNewTodo];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tableView reloadData];
}

//-(void)updateNewToDoWithTitle: (NSString *)title Description:(NSString *)description Priority: (int) priority {
//    Todo *myNewTodo = [[Todo alloc]  Description:<#(NSString *)#> Priority:<#(int)#>]
//    //Todo *myNewTodo = [[Todo alloc] initWithTitle:title Description:description Priority:priority];
//    
//    [self.todoManager.toDoList addObject:myNewTodo];
//    
//    
//}


@end
