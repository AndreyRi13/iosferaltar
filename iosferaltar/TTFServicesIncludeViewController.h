//
//  TTFIncludeServicesViewController.h
//  iosferaltar
//
//  Created by sistemas@feraltar.com on 03/04/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTFServicesIncludeViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIBarButtonItem *backButton;
@property (nonatomic, weak) IBOutlet UILabel *label;
@property (nonatomic, weak) IBOutlet UIView *sview;
@property (nonatomic, strong) NSArray *include;
@property (nonatomic, strong) NSString *mPax;

- (IBAction)cancel:(id)sender;

@end
