//
//  CalendarTableViewController.m
//  FMR
//
//  Created by Kaitlyn Kwan on 8/6/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import "CalendarTableViewController.h"
#import "CalendarTableViewCell.h"
#import "ScheduleTableViewController.h"
#import "MainCalendarViewController.h"

@interface CalendarTableViewController ()
@property (nonatomic, strong) NSArray *schedule;
@end

@implementation CalendarTableViewController


- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    _schedule = [defaults objectForKey:@"schedule"];
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _schedule.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CalendarTableViewCell";
    CalendarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    // NSArray *sortedKeys = [sororityKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    int row = (int)[indexPath row];
    
    cell.titleLabel.text = _schedule[row][@"name"];
    cell.dateLabel.text = [NSString stringWithFormat:@"Date: %@", _schedule[row][@"date"]];
    cell.timeLabel.text = [NSString stringWithFormat:@"Time: %@", _schedule[row][@"meeting_info"]];
    cell.attireLabel.text = [NSString stringWithFormat:@"Attire: %@", _schedule[row][@"attire"]];
    
    cell.bgImage.layer.cornerRadius = 15;
    cell.bgImage.layer.borderWidth = .25;
    cell.bgImage.layer.borderColor = [UIColor colorWithRed:0.545 green:0.553 blue:0.545 alpha:1].CGColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
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
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    MainCalendarViewController *mainCalendarViewController = [segue destinationViewController];
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    int row = (int)[indexPath row];
        
    mainCalendarViewController.dateRow = row;
    
}


@end
