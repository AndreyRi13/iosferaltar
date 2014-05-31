//  Original scripts by Haifa Carina from the Philippines
//  Website: http://haifa.baluyos.net/index.php?option=com_content&view=article&id=64:objective-c-ios-paypal-integration-tutorial&catid=1:programming&Itemid=5
//
//  TTFPayPalViewController.m
//  iosferaltar
//
//  Modified by Eduardo Tonini Castillo on 19/05/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import "TTFPayPalViewController.h"

@interface TTFPayPalViewController ()

@end

@implementation TTFPayPalViewController

- (void) loadView {
    [super loadView];
    
    NSString *keyAmount = @"amount=";
    NSString *keyDescription = @"desc=";
    NSString *keyInvnum = @"invnum=";
    NSString *urlString = @"http://localhost/projrestful/paypal/SetExpressCheckout.php?";
    //NSString *urlString = @"http://www.api.cancunreservation.net/paypal/SetExpressCheckout.php?";
    urlString = [urlString stringByAppendingString:keyAmount];
    urlString = [urlString stringByAppendingString:self.amount];
    urlString = [urlString stringByAppendingString:@"&"];
    urlString = [urlString stringByAppendingString:keyDescription];
    urlString = [urlString stringByAppendingString:self.desc];
    urlString = [urlString stringByAppendingString:@"&"];
    urlString = [urlString stringByAppendingString:keyInvnum];
    urlString = [urlString stringByAppendingString:self.invnum];
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlString];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //load the URL into the web view.
    [self.viewWeb loadRequest:requestObj];
    
    NSLog(@"requestObj %@", requestObj);
    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
