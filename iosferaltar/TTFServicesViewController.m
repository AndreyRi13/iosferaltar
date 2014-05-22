//
//  TTFServicesViewController2.m
//  iosferaltar
//
//  Created by sistemas@feraltar.com on 15/03/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import "TTFServicesViewController.h"
#import "TTFSessionManager.h"
#import "TTFCustomCellServices.h"
#import "UIImageView+AFNetworking.h"
#import "TTFReservationsViewController.h"
#import "TTFServicesIncludeViewController.h"

@interface TTFServicesViewController ()
{
    NSArray *hoteles;
    NSArray *services;
    NSString *hth;
    NSString *ath;
    NSString *hta;
}
@end

@implementation TTFServicesViewController

#pragma mark - Initialize

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Init variables
    self->hoteles = [[NSArray alloc] init];
    self->services = [[NSArray alloc] init];
    self->hth = @"hth"; //hotel to hotel
    self->ath = @"ath"; //airport to hotel
    self->hta = @"hta"; //hotel to airport
    
    // Title
    self.navigationItem.title = NSLocalizedString(@"Services", @"");
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    
    // CustomCell
    [self.tableView registerNib:[UINib nibWithNibName:@"TTFCustomCellServices" bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"CustomCell"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // SVProgressHUD
    [SVProgressHUD showWithStatus:NSLocalizedString(@"Loading...", @"") maskType:SVProgressHUDMaskTypeBlack];
    
    // AFNetworking
    NSDictionary *parameters = @{ @"key" : @"b04b77ac5851224ac844547bc6e61915",
                                  @"fromID":self.fromID, @"toID":self.toID,
                                  @"pax":self.pax, @"code":self.code,
                                  @"fromDestID":self.fromDest, @"toDestID":self.toDest };
    [[TTFSessionManager sharedInstance] GET:@"services?"
                                 parameters:parameters
                                    success:^(NSURLSessionDataTask *task, id responseObject) {
                                        [SVProgressHUD dismiss];
                                        self->hoteles = [responseObject valueForKey:@"hoteles"];
                                        self->services = [responseObject valueForKey:@"services"];
                                        [self.tableView reloadData];
                                    } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                        [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"Failed with Error", @"")];
                                    }];
    
}

- (void)viewDidUnload
{
    self.tableView = nil;
	[super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    self->hoteles = nil;
    self->services = nil;
    self->hth = nil;
    self->ath = nil;
    self->hta = nil;
    self.transfer = nil;
    self.type = nil;
    self.fromID = nil;
    self.toID = nil;
    self.pax = nil;
    self.code = nil;
    self.fromDest = nil;
    self.toDest = nil;
    self.vehicle = nil;
    self.oneWay = nil;
    self.roundTrip = nil;
    self.discount = nil;
    self.owDiscount = nil;
    self.rtDiscount = nil;
    self.include = nil;
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)oneWayButton:(UIButton *)sender
{
    self.type = @"One Way";
    [self performSegueWithIdentifier:@"pushReservations" sender:sender];
}

- (IBAction)roundTripButton:(UIButton *)sender
{
    self.type = @"Round Trip";
    [self performSegueWithIdentifier:@"pushReservations" sender:sender];
}

- (IBAction)goToMoreInfo:(id)sender
{
    [self performSegueWithIdentifier:@"modalInclude" sender:sender];
}

#pragma mark - Rotation device

#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
#endif

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self->services count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CustomCell";
    
    TTFCustomCellServices *cell = (TTFCustomCellServices *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[TTFCustomCellServices alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.shouldIndentWhileEditing = NO;
    }
    
    // Configure the cell...
    
    // Set value
    NSDictionary *serv = [self->services objectAtIndex:indexPath.row];
    self.vehicle = [serv objectForKey:@"vehicle"];
    self.oneWay = [serv objectForKey:@"ow"];
    self.roundTrip = [serv objectForKey:@"rt"];
    self.discount = [serv objectForKey:@"discount"];
    self.owDiscount = [serv objectForKey:@"owDiscount"];
    self.rtDiscount = [serv objectForKey:@"rtDiscount"];
    
    // Population Cells
    NSString *simbol = @"$ ";
    
    UIImage *btnHighlighted = [UIImage imageNamed:@"push-blue.png"];
    [cell.owButton setBackgroundImage:btnHighlighted forState:UIControlStateHighlighted];
    [cell.rtButton setBackgroundImage:btnHighlighted forState:UIControlStateHighlighted];
    
    cell.title.text = self.vehicle;
    cell.money.text = NSLocalizedString(@"USD", @"");
    [cell.owButton setTitle:[simbol stringByAppendingString:self.oneWay] forState:UIControlStateNormal];
    [cell.rtButton setTitle:[simbol stringByAppendingString:self.roundTrip] forState:UIControlStateNormal];
    
    NSURL *urlLarge = [NSURL URLWithString:[serv objectForKey:@"urlImageLarge"]];
    NSURL *urlSmall = [NSURL URLWithString:[serv objectForKey:@"urlImageSmall"]];
    if ([UIScreen mainScreen].scale >= 2.0f) {
        [cell.image setImageWithURL:urlLarge placeholderImage:[UIImage imageNamed:@"placeholderImage.png"]];
    } else {
        [cell.image setImageWithURL:urlSmall placeholderImage:[UIImage imageNamed:@"placeholderImage.png"]];
    }
    // end
    
    // Section coupon
    NSString *textOne = NSLocalizedString(@"Discount of", @"");
    NSString *textTwo = NSLocalizedString(@"dollar on normal price", @"");
    
    UIImage *btnCodeNormal = [UIImage imageNamed:@"standar-orange.png"];
    UIImage *btnCodeHighlighted = [UIImage imageNamed:@"push-orange.png"];
    
    if (self.transfer == self->hth || self.transfer == self->ath) {
        
        if (![self.owDiscount isEqual: @"0"] && ![self.rtDiscount isEqual: @"0"]) {
            
            [cell.owButton setBackgroundImage:btnCodeNormal forState:UIControlStateNormal];
            [cell.owButton setBackgroundImage:btnCodeHighlighted forState:UIControlStateHighlighted];
            [cell.owButton setTitle:[simbol stringByAppendingString:self.owDiscount] forState:UIControlStateNormal];
            [cell.rtButton setBackgroundImage:btnCodeNormal forState:UIControlStateNormal];
            [cell.rtButton setBackgroundImage:btnCodeHighlighted forState:UIControlStateHighlighted];
            [cell.rtButton setTitle:[simbol stringByAppendingString:self.rtDiscount] forState:UIControlStateNormal];
            cell.msg.text = [NSString stringWithFormat:@"%@ %@ %@ %@ / %@", textOne, self.discount, textTwo, self.oneWay, self.roundTrip];
            
        } else if (![self.owDiscount isEqual: @"0"] && [self.rtDiscount isEqual: @"0"]) {
            
            [cell.owButton setBackgroundImage:btnCodeNormal forState:UIControlStateNormal];
            [cell.owButton setBackgroundImage:btnCodeHighlighted forState:UIControlStateHighlighted];
            [cell.owButton setTitle:[simbol stringByAppendingString:self.owDiscount] forState:UIControlStateNormal];
            cell.msg.text = [NSString stringWithFormat:@"%@ %@ %@ %@", textOne, self.discount, textTwo, self.oneWay];
            
        } else if ([self.owDiscount isEqual: @"0"] && ![self.rtDiscount isEqual: @"0"]) {
            
            [cell.rtButton setBackgroundImage:btnCodeNormal forState:UIControlStateNormal];
            [cell.rtButton setBackgroundImage:btnCodeHighlighted forState:UIControlStateHighlighted];
            [cell.rtButton setTitle:[simbol stringByAppendingString:self.rtDiscount] forState:UIControlStateNormal];
            cell.msg.text = [NSString stringWithFormat:@"%@ %@ %@ %@", textOne, self.discount, textTwo, self.roundTrip];
        }
        
    } else if (self.transfer == self->hta) {
        
        [cell.rtLabel removeFromSuperview];
        [cell.rtButton removeFromSuperview];
        
        if (![self.owDiscount isEqual: @"0"]) {
            
            [cell.owButton setBackgroundImage:btnCodeNormal forState:UIControlStateNormal];
            [cell.owButton setBackgroundImage:btnCodeHighlighted forState:UIControlStateHighlighted];
            [cell.owButton setTitle:[simbol stringByAppendingString:self.owDiscount] forState:UIControlStateNormal];
            cell.msg.text = [NSString stringWithFormat:@"%@ %@ %@ %@", textOne, self.discount, textTwo, self.oneWay];
        }
    }
    // end
    
    // Selector
    [cell.owButton addTarget:self action:@selector(oneWayButton:) forControlEvents:UIControlEventTouchUpInside];
    [cell.rtButton addTarget:self action:@selector(roundTripButton:) forControlEvents:UIControlEventTouchUpInside];
    [cell.moreinfo addTarget:self action:@selector(goToMoreInfo:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 130;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"pushReservations"]) {
        CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
        
        TTFReservationsViewController* dvc = segue.destinationViewController;
        dvc.transfer = self.transfer;
        dvc.fromID = self.fromID;
        dvc.toID = self.toID;
        dvc.fromDest = self.fromDest;
        dvc.toDest = self.toDest;
        dvc.date = self.date;
        dvc.type = self.type;
        dvc.fromName = [[self->hoteles valueForKey:@"fromName"] componentsJoinedByString:@""];
        dvc.toName = [[self->hoteles valueForKey:@"toName"] componentsJoinedByString:@""];
        dvc.pax = [[self->hoteles valueForKey:@"pax"] componentsJoinedByString:@""];
        NSDictionary *serv = [self->services objectAtIndex:selectedIndexPath.row];
        dvc.serviceID = [serv valueForKey:@"servicesID"];
        dvc.vehicle = [serv valueForKey:@"vehicle"];
        if ([self.type isEqual: @"One Way"]) {
            if ([[serv valueForKey:@"owDiscount"] isEqual: @"0"]) {
                dvc.total = [serv valueForKey:@"ow"];
            } else {
                dvc.total = [serv valueForKey:@"owDiscount"];
            }
        }
        if ([self.type isEqual: @"Round Trip"]) {
            if ([[serv valueForKey:@"rtDiscount"] isEqual: @"0"]) {
                dvc.total = [serv valueForKey:@"rt"];
            } else {
                dvc.total = [serv valueForKey:@"rtDiscount"];
            }
        }
        
    } else if ([segue.identifier isEqualToString:@"modalInclude"]) {
        CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
        NSIndexPath *selectedIndexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
        
        TTFServicesIncludeViewController* dvc = segue.destinationViewController;
        dvc.mPax = [[self->services objectAtIndex:selectedIndexPath.row] valueForKey:@"mPax"];
        dvc.include = [[self->services objectAtIndex:selectedIndexPath.row] valueForKey:@"include"];
    }
}

@end
