//
//  MapViewController.h
//  FMR
//
//  Created by Kaitlyn Kwan on 7/26/14.
//  Copyright (c) 2014 Kaitlyn Kwan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController {
    MKMapView *mapview;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapview;

@property (strong, nonatomic) NSDictionary *sorority;
@property (strong, nonatomic) NSArray *coordinates;

-(IBAction)SetMap:(id)sender;
-(IBAction)GetLocation:(id)sender;

@end
