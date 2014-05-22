//
//  TTFRootViewController.h
//  iosferaltar
//
//  Created by Eduardo Tonini on 26/06/13.
//  Copyright (c) 2013 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.

#import <UIKit/UIKit.h>
#import "TTFHotelesViewController.h"
#import "TTFEditingViewController.h"

@interface TTFRootViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, TTFHotelesViewControllerDelegate, PropertyEditing>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIButton *searchButton;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, strong) UILabel *counter;
@property (nonatomic, strong) NSString *fromID;
@property (nonatomic, strong) NSString *fromName;
@property (nonatomic, strong) NSString *toID;
@property (nonatomic, strong) NSString *toName;
@property (nonatomic, strong) NSString *pax;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *fromDest;
@property (nonatomic, strong) NSString *toDest;

@end

