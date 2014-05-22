//
//  TTFFormCell.m
//  iosferaltar
//
//  Created by sistemas@feraltar.com on 05/03/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import "TTFCustomCellBookNow.h"

@implementation TTFCustomCellBookNow

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    NSString *font = @"Helvetica-Bold";
    
    self.stepper.maximumValue = 11;
    self.stepper.minimumValue = 1;
    self.stepper.wraps = NO;
    self.stepper.continuous = NO;
    self.stepper.stepValue = 1;
    [[UIButton appearanceWhenContainedIn:[UIStepper class], nil] setBackgroundColor:[UIColor colorWithRed:62/255.0f green:95/255.0f blue:138/255.0f alpha:1.0f]];
    [self.stepper setTintColor:[UIColor colorWithRed:93/255.0f green:155/255.0f blue:155/255.0f alpha:1.0f]];
    
    self.labelText.frame = CGRectMake(60, 4, 180, 21);
    [self.labelText setTextColor:[UIColor whiteColor]];
    [self.labelText setFont:[UIFont fontWithName:font size:16.0f]];
    
    self.labelField.frame = CGRectMake(95, 46, 195, 21);
    [self.labelField setTextColor:[UIColor whiteColor]];
    [self.labelField setFont:[UIFont fontWithName:font size:16.0f]];
}

- (IBAction)stepperChanged:(UIStepper *)sender
{
    NSUInteger value = sender.value;
    self.labelField.text = [NSString stringWithFormat:@"%lu",(unsigned long)value];
}

@end
