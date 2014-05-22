//
//  TTFCustomCellServices.m
//  iosferaltar
//
//  Created by sistemas@feraltar.com on 10/03/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import "TTFCustomCellServices.h"

@implementation TTFCustomCellServices

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
    
    [self.title setShadowColor:[UIColor grayColor]];
    [self.title setTextColor:[UIColor blackColor]];
    [self.title setFont:[UIFont fontWithName:font size:16.0f]];
    
    [self.money setShadowColor:[UIColor blackColor]];
    [self.money setTextColor:[UIColor whiteColor]];
    [self.money setFont:[UIFont fontWithName:font size:10.0f]];
    
    [self.owLabel setTextColor:[UIColor whiteColor]];
    [self.owLabel setFont:[UIFont fontWithName:font size:14.0f]];
    
    [self.rtLabel setTextColor:[UIColor whiteColor]];
    [self.rtLabel setFont:[UIFont fontWithName:font size:14.0f]];
    
    [self.moreinfo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.moreinfo.titleLabel setFont:[UIFont fontWithName:font size:12.0f]];
    
}

@end
