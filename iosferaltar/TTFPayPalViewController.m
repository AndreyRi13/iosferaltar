//
//  TTFPayPalViewController.m
//  iosferaltar
//
//  Created by sistemas@feraltar.com on 19/05/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import "TTFPayPalViewController.h"

@interface TTFPayPalViewController ()

@end

@implementation TTFPayPalViewController

- (void) loadView {
    [super loadView];
    
    // Creates a UIWebView instance
    //UIWebView *aWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 00, 320,450)];
    //self.aWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 00, 320,450)];
    //self.aWebView.scalesPageToFit = YES;
    //[self.aWebView setDelegate:self];
    
    // PayPal Values needed for the checkout/transaction
    // In this case, the item is Gum with the amount of 1
    NSString *item = @"Gum";
    NSInteger amount = 168;
    
    NSString *itemParameter = @"itemName=";
    itemParameter = [itemParameter stringByAppendingString:item];
    
    NSString *amountParameter = @"456";
    amountParameter = [amountParameter stringByAppendingFormat:@"%ld",(long)amount];

    /*
    NSString *urlString = @"http://haifa.baluyos.net/dev/PayPal/SetExpressCheckout.php?";
    //NSString *urlString = @"http://www.api.cancunreservation.net/PayPal/SetExpressCheckout.php?";
    //NSString *urlString = @"http://localhost/projrestful/paypal/SetExpressCheckout.php?";
    urlString = [urlString stringByAppendingString:amountParameter];
    urlString = [urlString stringByAppendingString:@"&"];
    urlString = [urlString stringByAppendingString:itemParameter];
    */
     
    NSString *urlString = @"http://localhost/projrestful/paypal/SetExpressCheckout.php?amount=480&itemName=Suburban";
    //NSString *urlString = @"http://www.api.cancunreservation.net/paypal/SetExpressCheckout.php?amount=480&itemName=Suburban";
    
    /* Appending these string will result to this:
        http://haifa.baluyos.net/dev/PayPal/SetExpressCheckout.php?amount=1&;itemName=Gum
    */
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlString];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //load the URL into the web view.
    [self.viewWeb loadRequest:requestObj];
    
    NSLog(@"requestObj %@", requestObj);
    
    //[self.view addSubview:myLabel];
    //[self.view addSubview:aWebView];
    
}

@end
