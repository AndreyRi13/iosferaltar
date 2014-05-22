//
//  TTFAvisoLegalViewController.h
//  iosferaltar
//
//  Created by sistemas@feraltar.com on 22/04/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTFLegalNoticeViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIWebView *webView;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *backButton;

- (IBAction)cancel:(id)sender;

@end
