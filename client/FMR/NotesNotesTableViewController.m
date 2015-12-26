//
//  NotesNotesTableViewController.m
//  FMR
//
//  Created by Kwan, Kaitlyn on 10/4/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import "NotesNotesTableViewController.h"
#import "NotesNotesTableViewCell.h"

@interface NotesNotesTableViewController ()
@property (nonatomic, strong) NSUserDefaults *defaults;
@property (nonatomic, strong) NSMutableDictionary *notes;
@property (nonatomic, strong) NSArray *sororities;
@property (nonatomic, strong) NSDictionary *sororityInfo;
@end

@implementation NotesNotesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _defaults = [NSUserDefaults standardUserDefaults];
    _notes = [[_defaults objectForKey:@"notes"] mutableCopy];
    _sororities = [_defaults objectForKey:@"rankings"];
    _sororityInfo = [_defaults objectForKey:@"sororities"];
    
    if ([_notes count] == 0) {
        _notes = [NSMutableDictionary new];
        NSString *url = @"http://cu-recruitment.herokuapp.com/api/getSororityNames";
        NSString *escapedURL = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:escapedURL]];
        NSURLResponse *response;
        NSError *error;
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        _sororities = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        
        [_sororities sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        
        [_defaults setObject:_sororities forKey:@"rankings"];
        
        for (NSString *sorority in _sororities) {
            [_notes setValue:@"" forKey:sorority];
        }
                
        [_defaults setObject:_notes forKey:@"notes"];
        
        [_defaults synchronize];
    }
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
    
    return [_notes count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NotesNotesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NotesNotesTableViewCell" forIndexPath:indexPath];
    
    int row = (int) [indexPath row];
    cell.sororityName.text = _sororities[row];
    cell.sororityNotes.text = [_notes objectForKey:_sororities[row]];
    cell.sororityNotes.layer.borderWidth = 1;
    cell.sororityNotes.layer.cornerRadius = 10;
    
    NSArray *sororityColors = [ _sororityInfo[_sororities[row]][@"color"] componentsSeparatedByString:@"," ];
    
    float red =  [[sororityColors objectAtIndex:0] floatValue];
    float green = [[sororityColors objectAtIndex:1] floatValue];
    float blue = [[sororityColors objectAtIndex:2] floatValue];
    
    cell.sororityNotes.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:.1];

    //[UIColor colorWithRed:0.545 green:0.553 blue:0.545 alpha:1].CGColor;
    
    return cell;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view resignFirstResponder];
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
}

- (void)textViewDidChange:(UITextView *)textView {
    UITableViewCell *cell = (UITableViewCell*) textView.superview.superview;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSString *house = _sororities[ [indexPath row] ];
    [_notes setValue:textView.text forKey:house];
    [_defaults setObject:_notes forKey:@"notes"];
    [_defaults synchronize];
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    UITableViewCell *cell = (UITableViewCell*) textView.superview.superview;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSString *house = _sororities[ [indexPath row] ];
    [_notes setValue:textView.text forKey:house];
    [_defaults setObject:_notes forKey:@"notes"];
    [_defaults synchronize];
    [self.tableView reloadData];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
