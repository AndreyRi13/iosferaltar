//
//  TTFServicesViewController2.h
//  iosferaltar
//
//  Created by sistemas@feraltar.com on 15/03/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTFServicesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSString *transfer;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *fromID;
@property (nonatomic, strong) NSString *toID;
@property (nonatomic, strong) NSString *fromName;
@property (nonatomic, strong) NSString *toName;
@property (nonatomic, strong) NSString *pax;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *fromDest;
@property (nonatomic, strong) NSString *toDest;
@property (nonatomic, strong) NSString *serviceID;
@property (nonatomic, strong) NSString *vehicle;
@property (nonatomic, strong) NSString *oneWay;
@property (nonatomic, strong) NSString *roundTrip;
@property (nonatomic, strong) NSString *discount;
@property (nonatomic, strong) NSString *owDiscount;
@property (nonatomic, strong) NSString *rtDiscount;
@property (nonatomic, strong) NSArray *include;

- (IBAction)oneWayButton:(UIButton*)sender;
- (IBAction)roundTripButton:(UIButton*)sender;
- (IBAction)goToMoreInfo:(UIButton*)sender;

@end
