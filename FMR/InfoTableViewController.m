//
//  InfoTableViewController.m
//  FMR
//
//  Created by Kaitlyn Kwan on 8/22/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import "InfoTableViewController.h"
#import "InfoTableViewCell.h"
#import "InfoDetailsTableViewController.h"

@interface InfoTableViewController ()

@end

@implementation InfoTableViewController

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
    
    _infoCategories = @[ @{ @"Financial Breakdown": @[
                                    @{ @"title": @"Alpha Chi Omega (ΑΧΟ)",
                                       @"desc": @"Room/Semester: $1,575.00 \nBoard/Semester: $1,575.00 \nDues/Semester: $482.00 \nNew Member Fees: $265.00"
                                       },
                                    
                                    @{ @"title": @"Alpha Epsilon Phi (ΑΕΦ)",
                                       @"desc": @"Room/Semester: $3,150.00 \nBoard/Semester: $1,330.00 \nDues/Semester: $345.00 \nNew Member Fees: $160.00"
                                       },
                                    
                                    @{ @"title": @"Alpha Phi (ΑΦ)",
                                       @"desc": @"Room/Semester: $3,330.00 \nBoard/Semester: $940.00 \nDues/Semester: $410.00 \nNew Member Fees: $285.00"
                                       },
                                    
                                    @{ @"title": @"Alpha Xi Delta (ΑΞΔ)",
                                       @"desc": @"Room/Semester: $3,600.00 \nBoard/Semester: $2,112.50 \nDues/Semester: $450.00 \nNew Member Fees: $130.00"
                                       },
                                    
                                    @{ @"title": @"Delta Delta Delta (ΔΔΔ)",
                                       @"desc": @"Room/Semester: $2,470.00 \nBoard/Semester: $2,150.00 \nDues/Semester: $445.00 \nNew Member Fees: $155.00"
                                       },
                                    
                                    @{ @"title": @"Delta Gamma (ΔΓ)",
                                       @"desc": @"Room/Semester: $2,100.00 \nBoard/Semester: $950.00 \nDues/Semester: $121.00 \nNew Member Fees: $117.00"
                                       },
                                    
                                    @{ @"title": @"Kappa Alpha Theta (ΚΑΘ)",
                                       @"desc": @"Room/Semester: $2,460.00 \nBoard/Semester: $1,330.00 \nDues/Semester: $486.00 \nNew Member Fees: $175.00"
                                       },
                                    
                                    @{ @"title": @"Kappa Delta (ΚΔ)",
                                       @"desc": @"Room/Semester: $3,022.00 \nBoard/Semester: $2,358.00 \nDues/Semester: $292.00 \nNew Member Fees: $265.00"
                                       },
                                    
                                    @{ @"title": @"Kappa Kappa Gamma (ΚΚΓ)",
                                       @"desc": @"Room/Semester: $2,600.00 \nBoard/Semester: $2,050.00 \nDues/Semester: $347.00 \nNew Member Fees: $165.00"
                                       },
                                    
                                    @{ @"title": @"Phi Sigma Sigma (ΦΣΣ)",
                                       @"desc": @"Room/Semester: $3,550.00 \nBoard/Semester: $2,000.00 \nDues/Semester: $450.00 \nNew Member Fees: $350.00"
                                       },
                                    
                                    @{ @"title": @"Pi Beta Phi (ΠΒΦ)",
                                       @"desc": @"Room/Semester: $3,860.00 \nBoard/Semester: $3,860.00 \nDues/Semester: $586.00 \nNew Member Fees: $35.00"
                                       },
                                    
                                    @{ @"title": @"Sigma Delta Tau (ΣΔΤ)",
                                       @"desc": @"Room/Semester: $2,565.00 \nBoard/Semester: $1,950.00 \nDues/Semester: $415.00 \nNew Member Fees: $505.00"
                                       },
                                    
                                    @{ @"title": @"Average",
                                       @"desc": @"Room/Semester: $2,856.88 \nBoard/Semester: $1,883.79 \nDues/Semester: $402.42 \nNew Member Fees: $217.25"
                                       },
                                    
                                ]
                            },
                         
                         @{ @"PNM Bill of Rights": @[
                                    @{ @"title": @"The right to...",
                                       @"desc": @"be treated as an individual."
                                       },
                                    
                                    @{ @"title": @"The right to...",
                                       @"desc": @"be fully informated about the recruitment process."
                                       },
                                    
                                    @{ @"title": @"The right to...",
                                       @"desc": @"ask questions and receive true and objective answers from recruitment counselors and members."
                                       },
                                    
                                    @{ @"title": @"The right to...",
                                       @"desc": @"be treated with respect."
                                       },
                                    
                                    @{ @"title": @"The right to...",
                                       @"desc": @"be treated as a capable and mature person without being patronized."
                                       },
                                    
                                    @{ @"title": @"The right to...",
                                       @"desc": @"ask how and why and receive straight answers."
                                       },
                                    
                                    @{ @"title": @"The right to...",
                                       @"desc": @"have and express opinions to recruitment counselors."
                                       },
                                    
                                    @{ @"title": @"The right to...",
                                       @"desc": @"have inviolable confidentiality when sharing information with recruitment counselors."
                                       },
                                    
                                    @{ @"title": @"The right to...",
                                       @"desc": @"make informed choices without undue pressure from others."
                                       },
                                    
                                    @{ @"title": @"The right to...",
                                       @"desc": @"be fully informed about the binding agreements implicit in the acceptance card signing."
                                       },
                                    
                                    @{ @"title": @"The right to...",
                                       @"desc": @"make one's own choice and decision and accept full responsibility for the results of that decision."
                                       },
                                    
                                    @{ @"title": @"The right to...",
                                       @"desc": @"have a positive, safe, and enriching recruitment and new member experience."
                                       },
                                ]
                            },
                         
                         @{ @"Vocabulary": @[
                                    @{ @"title": @"Active",
                                       @"desc": @"A fully initiated member of a sorority with full chapter privileges and responsibilities."
                                       },
                                    
                                    @{ @"title": @"Alumna",
                                       @"desc": @"A member who has graduated from college. (aka alums)"
                                       },
                                    
                                    @{ @"title": @"Badge",
                                       @"desc": @"The pin or badge worn to designate an active or alumni member of a sorority. New members have a similar badge."
                                       },
                                    
                                    @{ @"title": @"Bid",
                                       @"desc": @"An official invitation to join a sorority."
                                       },
                                    
                                    @{ @"title": @"Big Sister",
                                       @"desc": @"An active member assigned to assist and advise a newer member."
                                       },
                                    
                                    @{ @"title": @"Chapter",
                                       @"desc": @"The local undergraduate group that represents a segment of the national organization."
                                       },
                                    
                                    @{ @"title": @"Initiation",
                                       @"desc": @"A ceremony during which a new member takes the vows of a chapter to become an active member."
                                       },
                                    
                                    @{ @"title": @"New Member",
                                       @"desc": @"A student who has accepted a bid from a sorority but has not yet been initiated."
                                       },
                                    
                                    @{ @"title": @"New Member Education Period",
                                       @"desc": @"The time of education about the sorority between accepting a bid and initiation."
                                       },
                                    
                                    @{ @"title": @"Potential New Member (PNM)",
                                       @"desc": @"A participant in recruitment."
                                       },
                                    
                                    @{ @"title": @"Preference",
                                       @"desc": @"The final round of recruitment event after which PNMs sign an agreement listing the remaining chapters in order of preference."
                                       },
                                    
                                    @{ @"title": @"Recruitment",
                                       @"desc": @"The time in whih sororities meet PNMs and seek out new members."
                                       },
                                ]
                            },
                         
                         @{ @"Tips for Recruitment": @[
                                    @{ @"title": @"Take note after each event.",
                                       @"desc": @"Write down the names of women you met, impressions, what you talked about, and anything else that may help you remember that sorority and that event."
                                       },
                                    
                                    @{ @"title": @"Be courteous and polite.",
                                       @"desc": @"Ask questions and show interest. If you are not interested, you should still be positive and thank your hostess."
                                       },
                                    
                                    @{ @"title": @"Look at each sorority as a whole.",
                                       @"desc": @"Do not judge the chapter by an individual member."
                                       },
                                    
                                    @{ @"title": @"Be mature in your decision-making.",
                                       @"desc": @"Be true to yourself about the chapter with which you feel most comfortable. Listen to your heart and not the opinions of others."
                                       },
                                    
                                    @{ @"title": @"Keep an open mind!",
                                       @"desc": @"You may be surprised that your opinions have changed or may change during the recruitment process."
                                       },
                                    
                                    @{ @"title": @"This is a mutual selection process.",
                                       @"desc": @"You are selecting a sorority and a sorority is selecting you. Make sure you make a good impression. Leave each event with the information you will need to make a decision."
                                       },
                                    
                                    @{ @"title": @"Do not interpret remarks as assurance.",
                                       @"desc": @"Any remarks made at an event should not be interpreted as assurance of an invitation to another event or an invitation to join the sorority. An indivicual member cannot ensure or promise either of these."
                                       },
                                    
                                    @{ @"title": @"All members have been through recruitment.",
                                       @"desc": @"They will try hard to make you feel comfortable and they are empathetic to your situation. They are nervous and anxious just like you are."
                                       },
                                    
                                    @{ @"title": @"Discuss feelings and opinions privately.",
                                       @"desc": @"This should be done in the privacy of your room or privately with your Rho Gamma to avoid hurting someone's feelings."
                                       }
                                    
                                ],
                            }
                         ];
    
    _infoDescriptions = @{@"Financial Breakdown": @"View the finances for each sorority.",
                          @"PNM Bill of Rights": @"Know your rights as a PNM.",
                          @"Vocabulary": @"Brush up on your recruitment terms.",
                          @"Tips for Recruitment": @"Learn how to be a successful PNM."};
    
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
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_infoCategories count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InfoTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    int row = (int)[indexPath row];
    
    NSArray *infoKeys = [[_infoCategories objectAtIndex:row] allKeys];
    
    cell.name.text = [infoKeys objectAtIndex:0];
    cell.desc.text = _infoDescriptions[[infoKeys objectAtIndex:0]];
    return cell;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    InfoDetailsTableViewController *infoDetailsViewController = [segue destinationViewController];

    NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
    int row = (int)[myIndexPath row];
    
    infoDetailsViewController.infoDetails = [_infoCategories objectAtIndex:row];
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


@end


















