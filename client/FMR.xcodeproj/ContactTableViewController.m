//
//  ContactTableViewController.m
//  
//
//  Created by Kaitlyn Kwan on 12/25/15.
//
//

#import "ContactTableViewController.h"
#import "ContactTableViewCell.h"

@interface ContactTableViewController ()

@end

@implementation ContactTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    _contactInfo = [[defaults objectForKey:@"contactInfo"] mutableCopy];
    
    NSDictionary *rhoGammaInfo = [defaults objectForKey:@"rhoGammaInfo"];
    
    if ([_contactInfo count] == 0) {
        NSString *url = @"http://cu-recruitment.herokuapp.com/api/getContactInfo";
        NSString *escapedURL = [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:escapedURL]];
        NSURLResponse *response;
        NSError *error;
        
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        _contactInfo = [[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL] mutableCopy];
        [defaults setObject:_contactInfo forKey:@"contactInfo"];
        [defaults synchronize];
    }
    
    
    if (rhoGammaInfo.count > 0) {
        NSLog(@"here");
        [_contactInfo addObject:rhoGammaInfo];
    }
    
    NSLog(@"%@", _contactInfo);

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return _contactInfo.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactTableViewCell" forIndexPath:indexPath];
    
    
    int row = (int)[indexPath row];
    NSDictionary *currContact = _contactInfo[row];
    
    for (id keyID in currContact) {
        NSString *key = [keyID description];
        if (![key isEqualToString:@"location"]) {
            UITextView *currLabel = [cell valueForKey:key];
            currLabel.text = [currContact objectForKey:key];
        }
    }
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
