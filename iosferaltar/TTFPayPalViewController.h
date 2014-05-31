//
//  TTFPayPalViewController.h
//  iosferaltar
//
//  Created by sistemas@feraltar.com on 19/05/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTFPayPalViewController : UIViewController <UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *viewWeb;
// Contiene reservatin_id para paypalMEC

@property (nonatomic, strong) NSString *amount;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *invnum;
@end
