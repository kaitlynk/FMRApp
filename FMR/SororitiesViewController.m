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
    
    _sororities = @{@"Alpha Chi Omega": @{
                             @"name" : @"Alpha Chi Omega",
                             @"letters" : @"ΑΧΟ",
                             @"crestImg" : @"AXO.png",
                             @"address" : @"509 Wyckoff Road",
                             @"nickname" : @"Alpha Chi",
                             @"national founding" : @"1885",
                             @"cornell founding" : @"1984",
                             @"colors" : @"Scarlet Red and Olive Green",
                             @"symbol" : @"Lyre",
                             @"flower" : @"Red Carnation",
                             @"philanthropy" : @"Victims of Domestic Violence",
                             @"coordinates" : @"42.457139, -76.486958",
                             },
                         
                         @"Alpha Epsilon Phi" : @{
                             @"name" : @"Alpha Epsilon Phi",
                             @"letters" : @"ΑΕΦ",
                             @"crestImg" : @"AEPhi.png",
                             @"address" : @"435 Wyckoff Avenue",
                             @"nickname" : @"AEPhi",
                             @"national founding" : @"1909",
                             @"cornell founding" : @"1920",
                             @"colors" : @"Green and White",
                             @"symbol" : @"Giraffe",
                             @"flower" : @"Lily of the Valley",
                             @"philanthropy" : @"Elizabeth Glaser Pediatric, AIDS Foundation and Sharsharet",
                             @"coordinates" : @"42.456656, -76.485473",
                             },
                         
                         @"Alpha Phi" : @{
                             @"name" : @"Alpha Phi",
                             @"letters" : @"ΑΦ",
                             @"crestImg" : @"AlphaPhi.png",
                             @"address" : @"411 Thurston Avenue",
                             @"nickname" : @"Alpha Phi",
                             @"national founding" : @"1872",
                             @"cornell founding" : @"1889",
                             @"colors" : @"Silver and Bordeaux",
                             @"symbol" : @"Ivy Leaf & Teddy Bear",
                             @"flower" : @"Lily of the Valley and Forget-me-nots",
                             @"philanthropy" : @"Cardiac Care Research",
                             @"coordinates" : @"42.453293, -76.483892",
                             },
                         
                         @"Alpha Xi Delta" : @{
                             @"name" : @"Alpha Xi Delta",
                             @"letters" : @"ΑΞΔ",
                             @"crestImg" : @"AZD.png",
                             @"address" : @"40 Ridgewood Road",
                             @"nickname" : @"AXiD",
                             @"national founding" : @"1893",
                             @"cornell founding" : @"1918",
                             @"colors" : @"Double (dark, light) Blue and Gold",
                             @"symbol" : @"Teddy Bear \"Betsy\"",
                             @"flower" : @"Pink Rose",
                             @"philanthropy" : @"Autism Speaks",
                             @"coordinates" : @"42.455389, -76.489696",
                             },

                        @"Delta Delta Delta": @{
                             @"name" : @"Delta Delta Delta",
                             @"letters" : @"ΔΔΔ",
                             @"crestImg" : @"TriDelt.png",
                             @"address" : @"118 Triphammer Road",
                             @"nickname" : @"Tri Delta",
                             @"national founding" : @"1889",
                             @"cornell founding" : @"1913",
                             @"colors" : @"Silver, Gold, and Cerulean Blue",
                             @"symbol" : @"Dolphin",
                             @"flower" : @"Pansy",
                             @"philanthropy" : @"St. Judes Children Research Hospital",
                             @"coordinates" : @"42.455406, -76.481376",
                             },
                         
                         @"Delta Gamma": @{
                             @"name" : @"Delta Gamma",
                             @"letters" : @"ΔΓ",
                             @"crestImg" : @"DG.png",
                             @"address" : @"117 Triphammer Road",
                             @"nickname" : @"DG",
                             @"national founding" : @"1873",
                             @"cornell founding" : @"1885",
                             @"colors" : @"Bronze, Pink, and Blue",
                             @"symbol" : @"Anchor",
                             @"flower" : @"Cream Colored Rose",
                             @"philanthropy" : @"Service for Sight",
                             @"coordinates" : @"42.455491, -76.480454",
                             },
                         
                         @"Kappa Alpha Theta": @{
                             @"name" : @"Kappa Alpha Theta",
                             @"letters" : @"ΚΑΘ",
                             @"crestImg" : @"Theta.png",
                             @"address" : @"519 Stewart Avenue",
                             @"nickname" : @"Theta",
                             @"national founding" : @"1870",
                             @"cornell founding" : @"1881",
                             @"colors" : @"Black and Gold",
                             @"symbol" : @"Kite",
                             @"flower" : @"Black and Gold Pansy",
                             @"philanthropy" : @"CASA — Court Appointed Special Advocates",
                             @"coordinates" : @"42.444563, -76.488975",
                             },
                         
                         @"Kappa Delta" : @{
                             @"name" : @"Kappa Delta",
                             @"letters" : @"KΔ",
                             @"crestImg" : @"KD.png",
                             @"address" : @"109 Triphammer Road",
                             @"nickname" : @"KD",
                             @"national founding" : @"1897",
                             @"cornell founding" : @"1917",
                             @"colors" : @"Olive Green and Pearl White",
                             @"symbol" : @"Nautilus Shell",
                             @"flower" : @"White Rose",
                             @"philanthropy" : @"Prevent Child Abuse America",
                             @"coordinates" : @"42.454868, -76.480469",
                             },
                         
                         @"Kappa Kappa Gamma" : @{
                             @"name" : @"Kappa Kappa Gamma",
                             @"letters" : @"ΚΚΓ",
                             @"crestImg" : @"Kappa.png",
                             @"address" : @"508 Thurston Avenue",
                             @"nickname" : @"Kappa, KKG",
                             @"national founding" : @"1870",
                             @"cornell founding" : @"1883",
                             @"colors" : @"Sapphire Blue and Cerulean Blue",
                             @"symbol" : @"Key and Owl",
                             @"flower" : @"Fleur-de-lis",
                             @"philanthropy" : @"Reading is Fundamental",
                             @"coordinates" : @"42.453918, -76.483146",
                             },

                         @"Phi Sigma Sigma": @{
                             @"name" : @"Phi Sigma Sigma",
                             @"letters" : @"ΦΣΣ",
                             @"crestImg" : @"PhiSigSig.png",
                             @"address" : @"14 South Avenue",
                             @"nickname" : @"Phi Sig",
                             @"national founding" : @"1913",
                             @"cornell founding" : @"1954",
                             @"colors" : @"King Blue and Gold",
                             @"symbol" : @"Sphinx",
                             @"flower" : @"American Beauty Rose",
                             @"philanthropy" : @"National Kidney Foundation",
                             @"coordinates" : @"42.445036, -76.487844",
                             },
                         
                         @"Pi Beta Phi": @{
                             @"name" : @"Pi Beta Phi",
                             @"letters" : @"ΠΒΦ",
                             @"crestImg" : @"PiPhi.png",
                             @"address" : @"330 Triphammer Road",
                             @"nickname" : @"Pi Phi",
                             @"national founding" : @"1867",
                             @"cornell founding" : @"1919",
                             @"colors" : @"Wine and Silver Blue",
                             @"symbol" : @"Arrow and Angel",
                             @"flower" : @"Wine Carnation",
                             @"philanthropy" : @"Arrowmount School of the Arts, Links to Literacy, Champions Are Readers (CAR)",
                             @"coordinates" : @"42.458168, -76.482588",
                             },
                         
                         @"Sigma Delta Tau": @{
                             @"name" : @"Sigma Delta Tau",
                             @"letters" : @"ΣΔΤ",
                             @"crestImg" : @"SDT.png",
                             @"address" : @"115 Ridgewood Road",
                             @"nickname" : @"SDT",
                             @"national founding" : @"1917",
                             @"cornell founding" : @"1917",
                             @"colors" : @"Café au Lait and Old Blue",
                             @"symbol" : @"Torch",
                             @"flower" : @"Golden Tea Rose",
                             @"philanthropy" : @"National Committee for the Prevention of Child Abuse",
                             @"coordinates" : @"42.456060, -76.488472",
                             },
                    
                         };
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
    
    // Configure the cell...
    
    NSArray *sororityKeys = [_sororities allKeys];
    NSArray *sortedKeys = [sororityKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    int row = (int)[indexPath row];
    
    cell.nameLabel.text = _sororities[sortedKeys[row]][@"name"];
    cell.letterLabel.text = _sororities[sortedKeys[row]][@"letters"];
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
