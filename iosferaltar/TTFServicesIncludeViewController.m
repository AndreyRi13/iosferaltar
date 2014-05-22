//
//  TTFIncludeServicesViewController.m
//  iosferaltar
//
//  Created by sistemas@feraltar.com on 03/04/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import "TTFServicesIncludeViewController.h"

@interface TTFServicesIncludeViewController ()
@end

@implementation TTFServicesIncludeViewController

NSString *font = @"Helvetica-Bold";

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    
    [self.backButton setTitle:NSLocalizedString(@"Back", @"")];
    
    self.sview.backgroundColor = [UIColor colorWithRed:202/255.0f green:196/255.0f blue:176/255.0f alpha:0.5f];
    
    self.label.text = NSLocalizedString(@"Your service include", @"");
    [self.label setBackgroundColor:[UIColor clearColor]];
    [self.label setTextColor:[UIColor blackColor]];
    [self.label setFont:[UIFont fontWithName:font size:20.0f]];
}

- (void)viewDidUnload
{
    self.backButton = nil;
    self.label = nil;
    
	[super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    self.include = nil;
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    int y = 10;
    for(int i=0; i<self.include.count; i++) {
        UIView *ssview = [[UIView alloc] initWithFrame: CGRectMake (10, y, 260, 30)];
        ssview.backgroundColor = [UIColor clearColor];
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(10, y, 14, 14)];
        [image setImage:[UIImage imageNamed:@"check.png"]];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(33, y, 220, 30)];
        [label setBackgroundColor:[UIColor clearColor]];
        [label setTextColor:[UIColor whiteColor]];
        label.textAlignment = NSTextAlignmentLeft;
        label.lineBreakMode = NSLineBreakByCharWrapping;
        label.numberOfLines = 2;
        [label setFont:[UIFont fontWithName:font size:16.0f]];
        [label setText:[self.include objectAtIndex:i]];
        if (i == 0) {
            [label setText:[NSString stringWithFormat:@"%@ %@ %@",[self.include objectAtIndex:i], self.mPax, @"people"]];
        }
        [label sizeToFit];
        
        [self.sview addSubview:ssview];
        [self.sview addSubview:image];
        [self.sview addSubview:label];
        
        y = y+35;
    }
}

- (IBAction)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:Nil];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
