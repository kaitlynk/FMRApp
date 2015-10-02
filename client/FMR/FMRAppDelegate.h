//
//  FMRAppDelegate.h
//  FMR
//
//  Created by Kaitlyn Kwan on 7/12/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FMRAppDelegate : UIResponder <UIApplicationDelegate>
{
    NSURLConnection *currentConnection;
}
@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) NSMutableData *returnData;
@property (nonatomic) NSInteger status;

@end
