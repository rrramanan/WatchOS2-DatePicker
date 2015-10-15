//
//  InterfaceController.h
//  watchDatePicker WatchKit Extension
//
//  Created by Vinod Ramanathan on 15/10/15.
//  Copyright © 2015 Vinod Ramanathan. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController


@property (strong, nonatomic) IBOutlet WKInterfacePicker *Month;

@property (strong, nonatomic) IBOutlet WKInterfacePicker *Day;

@property (strong, nonatomic) IBOutlet WKInterfacePicker *Year;


- (IBAction)Month_Action:(NSInteger)value;

- (IBAction)Day_Action:(NSInteger)value;

- (IBAction)Year_Action:(NSInteger)value;


@property (strong, nonatomic) IBOutlet WKInterfaceLabel *Month_Label;

@property (strong, nonatomic) IBOutlet WKInterfaceLabel *Day_Label;

@property (strong, nonatomic) IBOutlet WKInterfaceLabel *Year_Label;

@property (strong, nonatomic) IBOutlet WKInterfaceButton *DateButton;

- (IBAction)DateAction;

@end
