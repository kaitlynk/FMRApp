//
//  NotesRankingsTableViewController.m
//  FMR
//
//  Created by Kwan, Kaitlyn on 10/4/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import "NotesRankingsTableViewController.h"
#import "NotesRankingsTableViewCell.h"

@interface NotesRankingsTableViewController ()
@property (strong, nonatomic) NSUserDefaults *defaults;
@property (strong, nonatomic) IBOutlet UIButton *resetRankings;
@property (strong, nonatomic) NSMutableArray *rankings;
@end

@implementation NotesRankingsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    _defaults = [NSUserDefaults standardUserDefaults];
    _rankings = [[_defaults objectForKey:@"rankings"] mutableCopy];
    
    if ([_rankings count] == 0) {
        NSString *url = @"http://cu-recruitment.herokuapp.com/api/getSororityNames";
        NSString *escapedURL = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:escapedURL]];
        NSURLResponse *response;
        NSError *error;
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        _rankings = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        [_defaults setObject:_rankings forKey:@"rankings"];
        [_defaults synchronize];
    }
    
    [self.tableView setEditing:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [_rankings count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NotesRankingsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotesRankingsTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    int row = (int)[indexPath row];
    
    cell.sororityName.text = [NSString stringWithFormat:@"%d. %@", row+1, _rankings[row]];
    cell.showsReorderControl = YES;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleNone;
}
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    int startRow = (int)[sourceIndexPath row];
    int destRow = (int)[destinationIndexPath row];
    
    if (startRow < destRow) {
        NSString *startVal = _rankings[startRow];
        for (int i = startRow; i < destRow; i++) {
            _rankings[i] = _rankings[i+1];
        }
        _rankings[destRow] = startVal;
    } else {
        NSString *startVal = _rankings[startRow];
        for (int i = startRow; i > destRow; i--) {
            _rankings[i] = _rankings[i-1];
        }
        _rankings[destRow] = startVal;
    }
    
    [tableView reloadData];
    [_defaults setObject:_rankings forKey:@"rankings"];
    [_defaults synchronize];
}


- (IBAction)resetRankings:(id)sender {
    _rankings = [[[[_defaults objectForKey:@"sororities"] allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] mutableCopy];
    [_defaults setObject:_rankings forKey:@"rankings"];
    [_defaults synchronize];
    [self.tableView reloadData];

}


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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
