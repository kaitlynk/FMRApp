//
//  FMRAppDelegate.m
//  FMR
//
//  Created by Kaitlyn Kwan on 7/12/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import "FMRAppDelegate.h"

@implementation FMRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //[[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.7 green:0.012 blue:0.015 alpha:1]];
    NSShadow * shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor lightGrayColor];
    shadow.shadowOffset = CGSizeMake(0, 0);
    
    NSDictionary * navBarTitleTextAttributes =
      @{ NSForegroundColorAttributeName : [UIColor whiteColor],
         NSShadowAttributeName          : shadow,
         NSFontAttributeName            : [UIFont fontWithName:@"Optima" size:20.0] };
    
    [[UINavigationBar appearance] setTitleTextAttributes:navBarTitleTextAttributes];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"header.png"] forBarMetrics:UIBarMetricsDefault];
    
    UIOffset backButtonTextOffset = UIOffsetMake(0, -60);
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:backButtonTextOffset
                                                         forBarMetrics:UIBarMetricsDefault];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@{} forKey:@"sororities"];
    

    if ([[defaults objectForKey:@"schedule"] count] == 0) {
        NSArray *schedule = @[];
    
        [defaults setObject:schedule forKey:@"schedule"];
        [defaults synchronize];
    
    }
    
    if ([[defaults objectForKey:@"rankings"] count] == 0) {
        NSArray *rankings = [[[defaults objectForKey:@"sororities"] allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                
        [defaults setObject:rankings forKey:@"rankings"];
        [defaults synchronize];
        
    }
    
    if ([[defaults objectForKey:@"notes"] count] == 0) {
        NSArray *sororityKeys = [[[defaults objectForKey:@"sororities"] allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
        
        NSMutableDictionary *notes = [NSMutableDictionary new];
        
        for (NSString *sorority in sororityKeys) {
            [notes setObject:@"" forKey:sorority];
        }
        
        [defaults setObject:notes forKey:@"notes"];
        [defaults synchronize];
        
    }
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

/* @[@{@"name" : @"Orientation",
 @"date": @"Wednesday, January 14",
 @"meeting_info" : @"6:30 PM Bailey Hall",
 @"full_time" : @"",
 @"attire" : @"Casual",
 @"description" : @"During this meeting you will learn all about recruitment and will split up into your Rho Gamma groups. This is a mandatory meeting and you should attend. If you cannot be there expect a call from your Rho Gamma to go over the information shared. If you have not paid as yet, expect to pay at this meeting.",
 @"rounds": @[@{ @"Time": @"6:30 PM",
 @"Event": @"Orientation",
 @"House": @"Bailey Hall",
 },
 @{ @"Time": @"8:15 PM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ",
 },
 ]
 },
 
 @{@"name" : @"Open House I",
 @"date" : @"Thursday, January 15",
 @"meeting_info" : @"Meeting at 9:00 AM",
 @"full_time" : @"9:00 AM - 5:30 PM",
 @"attire" : @"Casual",
 @"description" : @"During this round you will visit all the chapters, and have one on one conversations with sisters. Many chapters share a story or two with you about their sisterhood. Chapters often share a non-alcoholic drink with you at this event. You can always ask for water as well. You have a scheduled break for lunch at which time you will eat on central or west campus. You will be provided lunch and this cost is already included in your recruitment fee.",
 @"rounds" : @[@{ @"Time": @"9:00 AM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ",
 },
 @{ @"Time": @"10:00 - 10:40 AM",
 @"Event": @"Round 1",
 @"House": @"",
 },
 @{ @"Time": @"11:00 - 11:40 AM",
 @"Event": @"Round 2",
 @"House": @"",
 },
 @{ @"Time": @"12:00 - 12:40 AM",
 @"Event": @"Round 3",
 @"House": @"",
 },
 @{ @"Time": @"12:40 - 1:50 PM",
 @"Event": @"Lunch",
 @"House": @"--",
 },
 @{ @"Time": @"1:50 - 2:30 PM",
 @"Event": @"Round 4",
 @"House": @"",
 },
 @{ @"Time": @"2:50 - 3:30 PM",
 @"Event": @"Round 5",
 @"House": @"",
 },
 @{ @"Time": @"3:50 - 4:30 PM",
 @"Event": @"Round 6",
 @"House": @"",
 },
 @{ @"Time": @"4:50 - 5:30 PM",
 @"Event": @"Round 7",
 @"House": @"",
 },
 @{ @"Time": @"6:00 PM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ",
 }
 ]
 },
 
 @{@"name" : @"Open House II",
 @"date" : @"Friday, January 16",
 @"meeting_info" : @"Meeting at 9:00 AM",
 @"full_time" : @"9:00 AM - 4:30 PM",
 @"attire" : @"Casual",
 @"description" : @"During this round you will visit all the chapters, and have one on one conversations with sisters. Many chapters share a story or two with you about their sisterhood. Chapters often share a non-alcoholic drink with you at this event. You can always ask for water as well. You have a scheduled break for lunch at which time you will eat on central or west campus. You will be provided lunch and this cost is already included in your recruitment fee.",
 @"rounds" : @[@{ @"Time": @"9:00 AM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ",
 },
 @{ @"Time": @"10:00 - 10:40 AM",
 @"Event": @"Round 8",
 @"House": @"",
 },
 @{ @"Time": @"11:00 - 11:40 AM",
 @"Event": @"Round 9",
 @"House": @"",
 },
 @{ @"Time": @"12:00 - 12:40 AM",
 @"Event": @"Round 10",
 @"House": @"",
 },
 @{ @"Time": @"12:40 - 1:50 PM",
 @"Event": @"Lunch",
 @"House": @"--",
 },
 @{ @"Time": @"1:50 - 2:30 PM",
 @"Event": @"Round 11",
 @"House": @"",
 },
 @{ @"Time": @"2:50 - 3:30 PM",
 @"Event": @"Round 12",
 @"House": @"", },
 @{ @"Time": @"3:50 - 4:30 PM",
 @"Event": @"Round 13",
 @"House": @"",
 },
 @{ @"Time": @"5:00 PM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ", }
 ]
 },
 
 @{@"name" : @"House Tours",
 @"date" : @"Saturday, January 17",
 @"meeting_info" : @"Meeting at 8:00 AM",
 @"full_time" : @"8:00 AM - 6:30 PM",
 @"attire" : @"Snappy Casual",
 @"description" : @"During this round you will get tours of the chapter houses, and you will be provided information on house finances and what it is like to live in a sorority house. You will go to a maximum of 8 chapters this day with one break.  Usually these tours are done in smaller groups. Feel free as always to ask questions. A non-alcoholic drink will be shared with you during this event. Again you can ask for water.  You have a scheduled break for lunch.",
 @"rounds" : @[ @{@"Time": @"8:00 AM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ",
 },
 @{ @"Time": @"9:00 - 9:35 AM",
 @"Event": @"Round 1",
 @"House": @"",
 },
 @{ @"Time": @"9:55 - 10:30 AM",
 @"Event": @"Round 2",
 @"House": @"",
 },
 @{ @"Time": @"10:50 - 11:25 AM",
 @"Event": @"Round 3",
 @"House": @"",
 },
 @{ @"Time": @"11:45 - 12:20 PM",
 @"Event": @"Round 4",
 @"House": @"",
 },
 @{ @"Time": @"12:20 - 1:20 PM",
 @"Event": @"Lunch",
 @"House": @"--",
 },
 @{ @"Time": @"1:20 - 2:50 PM",
 @"Event": @"Round 5",
 @"House": @"",
 },
 @{ @"Time": @"2:15 - 2:50 PM",
 @"Event": @"Round 5",
 @"House": @"",
 },
 @{ @"Time": @"3:10 - 3:45 PM",
 @"Event": @"Round 6",
 @"House": @"",
 },
 @{ @"Time": @"4:05 - 4:40 PM",
 @"Event": @"Round 7",
 @"House": @"",
 },
 @{ @"Time": @"5:00 - 5:35 PM",
 @"Event": @"Round 8",
 @"House": @"",
 },
 @{ @"Time": @"5:55 - 6:30 PM",
 @"Event": @"Round 9",
 @"House": @"",
 },
 @{ @"Time": @"7:00 PM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ",
 },
 ]
 },
 
 @{@"name" : @"Skit and Philanthropy",
 @"date" : @"Sunday, January 18",
 @"meeting_info" : @"Meeting at 9:00 AM",
 @"full_time" : @"9:00 AM - 6:20 PM",
 @"attire" : @"Dressy",
 @"description" : @"During this round you will learn the national and local organization's charity efforts. Each of the chapters host events to support their causes you will be able to learn more about these opportunities. You will also be entertained by the chapter's skit performance. From this event you will get a sense of the personality of each chapter through their skit. Again a non-alcoholic drink will be offered to you and you can opt for water. You will attend a maximum of 5 chapters this day.",
 @"rounds" : @[@{ @"Time": @"9:00 AM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ",
 },
 @{ @"Time": @"10:00 - 10:45 AM",
 @"Event": @"Round 1",
 @"House": @"",
 },
 @{ @"Time": @"11:10 - 11:55 AM",
 @"Event": @"Round 2",
 @"House": @"",
 },
 @{ @"Time": @"12:20 - 1:05 PM",
 @"Event": @"Round 3",
 @"House": @"",
 },
 @{ @"Time": @"1:05 - 2:05 PM",
 @"Event": @"Lunch",
 @"House": @"--",
 },
 @{ @"Time": @"2:05 - 2:50 PM",
 @"Event": @"Round 4",
 @"House": @"",
 },
 @{ @"Time": @"3:15 - 4:00 PM",
 @"Event": @"Round 5",
 @"House": @"",
 },
 @{ @"Time": @"4:25 - 5:10 PM",
 @"Event": @"Round 6",
 @"House": @"",
 },
 @{ @"Time": @"5:35 - 6:20 PM",
 @"Event": @"Round 7",
 @"House": @"",
 },
 @{ @"Time": @"6:35 PM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ",
 },
 ]
 },
 
 @{@"name" : @"Final Round",
 @"date" : @"Monday, January 19",
 @"meeting_info" : @"Meeting at 11:30 AM",
 @"full_time" : @"11:30 AM - 4:50 PM",
 @"attire" : @"Semi-formal",
 @"description" : @"During this round you will learn the national and local organization's charity efforts. Each of the chapters host events to support their causes you will be able to learn more about these opportunities. You will also be entertained by the chapter's skit performance. From this event you will get a sense of the personality of each chapter through their skit. Again a non-alcoholic drink will be offered to you and you can opt for water. You will attend a maximum of 5 chapters this day.",
 @"rounds" : @[@{ @"Time": @"11:30 AM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ",
 },
 @{ @"Time": @"12:30 - 1:40 PM",
 @"Event": @"Round 1",
 @"House": @"",
 },
 @{ @"Time": @"2:05 - 3:15 PM",
 @"Event": @"Round 2",
 @"House": @"",
 },
 @{ @"Time": @"3:40 - 4:50 PM",
 @"Event": @"Round 3",
 @"House": @"",
 },
 @{ @"Time": @"5:20 PM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ", },
 ]
 },
 
 @{@"name" : @"Bid Night",
 @"date" : @"Tuesday, January 20",
 @"meeting_info" : @"Meeting at 5:30 PM,",
 @"full_time" : @"",
 @"attire" : @"Casual",
 @"description" : @"During this round you will learn the national and local organization's charity efforts. Each of the chapters host events to support their causes you will be able to learn more about these opportunities. You will also be entertained by the chapter's skit performance. From this event you will get a sense of the personality of each chapter through their skit. Again a non-alcoholic drink will be offered to you and you can opt for water. You will attend a maximum of 5 chapters this day.",
 @"rounds" : @[@{ @"Time": @"5:30 PM",
 @"Event": @"Rho Gamma Meeting",
 @"House": @" ",
 },
 @{ @"Time": @"7:00 PM",
 @"Event": @"Bid Night",
 @"House": @"TBA",
 },
 ]
 },
 ];
*/


/* @{@"Alpha Chi Omega": @{
 @"name" : @"Alpha Chi Omega",
 @"color" : @[@0.91,@0.53,@0.53],
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
 @"color" : @[@0.36,@0.72,@0.25],
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
 @"color" : @[@1,@0.37,@0.21],
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
 @"color" : @[@0.53,@0.64,@0.91],
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
 @"color" : @[@0.77,@0.77,@0.77],
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
 @"color" : @[@0.62,@0.77,@0.91],
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
 @"color" : @[@0.93,@0.92,@0.45],
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
 @"color" : @[@0.42,@0.66,@0.31],
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
 @"color" : @[@0.24,@0.47,@0.85],
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
 
 @"Phi Mu": @{
 @"name" : @"Phi Mu",
 @"color" : @[@0.95,@0.76,@0.20],
 @"letters" : @"ΦΜ",
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


@"Phi Sigma Sigma": @{
                      @"name" : @"Phi Sigma Sigma",
                      @"color" : @[@0.95,@0.76,@0.20],
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
                  @"color" : @[@0.65,@0.11,@0.0],
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
                      @"color" : @[@0.77,@0.65,@0.53],
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

}; */

