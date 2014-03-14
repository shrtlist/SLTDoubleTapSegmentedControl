//
//  SLTViewController.m
//  SLTDoubleTapSegmentedControl
//
//  Created by Marco Abundo on 3/11/14.
//  Copyright (c) 2014 shrtlist. All rights reserved.
//

#import "SLTViewController.h"
#import "SLTDoubleTapSegmentedControl.h"

@interface SLTViewController () // Class extension
@property (nonatomic, weak) IBOutlet SLTDoubleTapSegmentedControl *doubleTapSegmentedControl;
@end

@implementation SLTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    [self.doubleTapSegmentedControl setTintColor:[UIColor greenColor] forSegmentAtIndex:0];
    [self.doubleTapSegmentedControl setTintColor:[UIColor redColor] forSegmentAtIndex:1];
    [self.doubleTapSegmentedControl setTintColor:[UIColor blueColor] forSegmentAtIndex:2];
}

#pragma mark - Private methods

@end
