//
//  TTFREservationsViewController.h
//  iosferaltar
//
//  Created by sistemas@feraltar.com on 14/03/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTFEditingViewController.h"

@interface TTFReservationsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, PropertyEditing>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (nonatomic, weak) IBOutlet UIToolbar *toolBar;
//@property (nonatomic, strong) IBOutlet UIBarButtonItem *legalNoticeButton;
//@property (nonatomic, strong) IBOutlet UIBarButtonItem *payonlineButton;
@property (nonatomic, strong) NSString *fromID;
@property (nonatomic, strong) NSString *fromName;
@property (nonatomic, strong) NSString *toID;
@property (nonatomic, strong) NSString *toName;
@property (nonatomic, strong) NSString *pax;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *fromDest;
@property (nonatomic, strong) NSString *toDest;
@property (nonatomic, strong) NSString *transfer;
@property (nonatomic, strong) NSString *serviceID;
@property (nonatomic, strong) NSString *vehicle;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *total;
@property (nonatomic, strong) NSString *primaryPassengerName;
@property (nonatomic, strong) NSString *emailAdress;
@property (nonatomic, strong) NSString *mobilPhone;
@property (nonatomic, strong) NSString *arrivalAirline;
@property (nonatomic, strong) NSString *arrivalFlight;
@property (nonatomic, strong) NSDate *arrivalDayAndTime;
@property (nonatomic, strong) NSString *departureAirline;
@property (nonatomic, strong) NSString *departureFlight;
@property (nonatomic, strong) NSDate *departureDayAndTime;
@property (nonatomic, strong) NSString *babyCarSeat;
@property (nonatomic, strong) NSString *bulkyLuggage;
@property (nonatomic, strong) NSString *other;

- (IBAction)stepperChanged:(UIStepper *)sender;
- (IBAction)toogleChanged:(UIButton *)sender;
- (IBAction)goToLegalNotice:(UIButton *)sender;
- (IBAction)goToPayPalPayment:(UIButton *)sender;

- (void)createToolbar;

+ (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block;

@end
