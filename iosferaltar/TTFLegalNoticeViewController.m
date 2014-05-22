//
//  TTFAvisoLegalViewController.m
//  iosferaltar
//
//  Created by sistemas@feraltar.com on 22/04/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import "TTFLegalNoticeViewController.h"

@interface TTFLegalNoticeViewController ()

@end

@implementation TTFLegalNoticeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.backButton setTitle:NSLocalizedString(@"Back", @"")];
    
	// Add code to load web content in UIWebView
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"TTFLegalNotice.html" ofType:nil]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)viewDidUnload
{
    self.backButton = nil;
    
	[super viewDidUnload];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
