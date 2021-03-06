//
//  NotesScheduleTableViewController.m
//  FMR
//
//  Created by Kwan, Kaitlyn on 9/18/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import "NotesScheduleTableViewController.h"
#import "NotesScheduleTableViewCell.h"
#import "NotesRoundsViewController.h"

@interface NotesScheduleTableViewController ()

@end

@implementation NotesScheduleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _schedule = [defaults objectForKey:@"schedule"];
    
    if ([_schedule count] == 0) {
        NSString *url = @"http://cu-recruitment.herokuapp.com/api/getCalendar";
        NSString *escapedURL = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:escapedURL]];
        NSURLResponse *response;
        NSError *error;
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        _schedule = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        [defaults setObject:_schedule forKey:@"schedule"];
        [defaults synchronize];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Table view data source
- (IBAction)reset:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *url = @"http://cu-recruitment.herokuapp.com/api/getCalendar";
    NSString *escapedURL = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:escapedURL]];
    NSURLResponse *response;
    NSError *error;
    
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    _schedule = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    [defaults setObject:_schedule forKey:@"schedule"];
    [defaults synchronize];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _schedule.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"NotesScheduleTableViewCell";
    NotesScheduleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    int row = (int)[indexPath row];
    
    cell.title.text = [_schedule objectAtIndex:row][@"name"];
    cell.date.text = [_schedule objectAtIndex:row][@"date"];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NotesRoundsViewController *nextController = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    int row = [indexPath row];
    nextController.roundID = row;
}


@end
