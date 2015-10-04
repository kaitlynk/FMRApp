//
//  FMRFirstViewController.m
//  FMR
//
//  Created by Kaitlyn Kwan on 7/12/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import "SororitiesViewController.h"
#import "SororityTableViewCell.h"
#import "SororityDetailsViewController.h"

@interface SororitiesViewController ()

@end

@implementation SororitiesViewController

- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
    //return UIInterfaceOrientationLandscapeLeft;
}

- (id)initWithStyle:(UITableViewStyle)style
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
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _sororities = [defaults objectForKey:@"sororities"];
    
    if ([_sororities count] == 0) {
        NSString *url = @"http://cu-recruitment.herokuapp.com/api/getSororitiesDict";
        NSString *escapedURL = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:escapedURL]];
        NSURLResponse *response;
        NSError *error;
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        _sororities = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        [defaults setObject:_sororities forKey:@"sororities"];
        [defaults synchronize];
    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return _sororities.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SororityTableViewCell";
    SororityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSArray *sororityKeys = [_sororities allKeys];
    NSArray *sortedKeys = [sororityKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    int row = (int)[indexPath row];
    
    cell.nameLabel.text = _sororities[sortedKeys[row]][@"name"];
    cell.letterLabel.text = _sororities[sortedKeys[row]][@"letters"];
    cell.thumbBG.layer.cornerRadius = 29;
    NSArray *sororityColors = [ _sororities[sortedKeys[row]][@"color"] componentsSeparatedByString:@"," ];
    float red =  [[sororityColors objectAtIndex:0] floatValue];
    float green = [[sororityColors objectAtIndex:1] floatValue];
    float blue = [[sororityColors objectAtIndex:2] floatValue];
    //cell.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:.2];
    cell.thumbBG.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    //cell.letterLabel.textColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    cell.thumbCrest.image = [UIImage imageNamed: _sororities[sortedKeys[row]][@"crestImg"]];
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ShowSororityDetails"]) {
        SororityDetailsViewController *sororitydetailviewcontroller = [segue destinationViewController];
        
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        NSArray *sororityKeys = [_sororities allKeys];
        NSArray *sortedKeys = [sororityKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        int row = (int)[myIndexPath row];
        
        sororitydetailviewcontroller.sorority = _sororities[sortedKeys[row]];
    }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end


/* [NSURLConnection sendAsynchronousRequest:request
 queue:[NSOperationQueue mainQueue]
 completionHandler:^(NSURLResponse *response,
 NSData *data, NSError *connectionError) {
 if (data.length > 0 && connectionError == nil) {
 _sororities = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
 [defaults setObject:sororities forKey:@"sororities"];
 [defaults synchronize];
 }
 }];*/
