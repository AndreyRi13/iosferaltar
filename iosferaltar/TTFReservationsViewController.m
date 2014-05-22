//
//  TTFREservationsViewController.m
//  iosferaltar
//
//  Created by sistemas@feraltar.com on 14/03/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import "TTFReservationsViewController.h"
#import "TTFSessionManager.h"
#import "TTFEditingViewController.h"
#import "TTFLegalNoticeViewController.h"
#import "TTFData.h"

@interface TTFReservationsViewController ()
{
    NSMutableArray *valueArray;
    NSString *hth;
    NSString *ath;
    NSString *hta;
    NSString *oneWay;
    NSString *roundTrip;
}
@property (nonatomic, strong) TTFData *data;

@end

@implementation TTFReservationsViewController

#pragma mark - Initialize

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // Set value for UIStepper
    self->valueArray=[[NSMutableArray alloc]initWithObjects:[NSNumber numberWithInt:0],[NSNumber numberWithInt:0],[NSNumber numberWithInt:0], nil];
    
    // Set value for variables
    self->hth = @"hth";
    self->ath = @"ath";
    self->hta = @"hta";
    self->oneWay = @"One Way";
    self->roundTrip = @"Round Trip";
    self.arrivalDayAndTime = self.date;
    self.departureDayAndTime = self.arrivalDayAndTime;
    
    // Custom NavBar
    self.navigationItem.title = NSLocalizedString(@"Reservations", @"");
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    
    // Custom ToolBar
    [self createToolbar];
    
    // Atributos de tableView
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)viewDidUnload
{
	[super viewDidUnload];
    
    self.tableView = nil;
    self.dateFormatter = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
	[super viewDidAppear:animated];
    
    // We must be the first responder to receive shake events for undo.
	[self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    
    // You should resign first responder status when exiting the screen.
	[self resignFirstResponder];
}

#pragma mark - ToolBar Actions and Methods

- (void)createToolbar {
    UIBarButtonItem *legalNotice = [[UIBarButtonItem alloc] initWithTitle:@"Legal Notice" style:UIBarButtonItemStyleBordered target:self action:@selector(goToLegalNotice:)];
    UIBarButtonItem *payonline = [[UIBarButtonItem alloc] initWithTitle:@"Pay" style:UIBarButtonItemStyleBordered target:self action:@selector(goToPayPalPayment:)];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    NSArray *buttonItems = [NSArray arrayWithObjects:legalNotice, spacer, payonline, nil];
    [self.toolBar setItems:buttonItems];
}

- (IBAction)goToLegalNotice:(UIButton *)sender
{
    static NSString *segueToLegalNotice = @"modalLegalNotice";
    [self performSegueWithIdentifier:segueToLegalNotice sender:nil];
}

- (IBAction)goToPayPalPayment:(UIButton *)sender
{
    /*
     NSDictionary *parameters = @{@"siteid":@"1",
     @"ptype":@"2",
     @"services_id":self.serviceID,
     @"from_id":self.fromID,
     @"to_id":self.toID,
     @"creation_date":self.date,
     @"service_type":@"arrival",
     @"customer_name":self.primaryPassengerName,
     @"arrival_date":self.arrivalDayAndTime,
     @"arrival_airline":self.arrivalAirline,
     @"arrival_flight":self.arrivalFlight,
     @"pax":self.pax,
     @"total":self.total,
     @"idcodes":@"null",
     @"contact_email":self.emailAdress,
     @"contact_phone":self.mobilPhone,
     @"special_request":self.other,
     @"baby_car_seat":self.babyCarSeat,
     @"bulky_luggage":self.bulkyLuggage};
     */
    /*
    NSDictionary *parameters = @{@"siteid":@"1",
                                 @"ptype":@"2",
                                 @"services_id":@"1",
                                 @"from_id":@"10",
                                 @"to_id":@"1022",
                                 @"service_type":@"arrival",
                                 @"customer_name":@"Eduardo Tonineitor",
                                 @"arrival_date":@"2014-03-22 20:00:00",
                                 @"arrival_airline":@"(AA) American Airlin",
                                 @"arrival_flight":@"AA-345",
                                 @"pax":@"2",
                                 @"total":@"129.000000",
                                 @"idcodes":@"null",
                                 @"contact_email":@"eduardo@feraltar.com",
                                 @"contact_phone":@"9982441459",
                                 @"special_request":@"",
                                 @"baby_car_seat":@"0",
                                 @"bulky_luggage":@"No"};
    [[TTFSessionManager sharedInstance] POST:@"services"
                                  parameters:parameters
                                     success:^(NSURLSessionDataTask *task, id responseObject) {
                                         static NSString *segueToPayPalPayment = @"modalPaypalMEC";
                                         [self performSegueWithIdentifier:segueToPayPalPayment sender:self];
                                     } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                         UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Ocurrio un error"
                                                                                             message:@"Intente mas tarde"
                                                                                            delegate:self
                                                                                   cancelButtonTitle:@"Cancel"
                                                                                   otherButtonTitles:@"OK", nil];
                                         
                                         [alertView show];
                                     }];
    */
    static NSString *segueToPayPalPayment = @"modalPaypalMEC";
    [self performSegueWithIdentifier:segueToPayPalPayment sender:self];
    
}

#pragma mark - IBActions

- (IBAction)stepperChanged:(UIStepper *)sender
{
    int row = [sender.superview tag];
    int value = (int)[sender value];
    [self->valueArray replaceObjectAtIndex:row withObject:[NSNumber numberWithInt:value]];
    if (value == 0){
        [(UILabel*)[(UITableViewCell *)sender.superview viewWithTag:456] setText:[NSString stringWithFormat:NSLocalizedString(@"No", @"") ]];
    } else {
        [(UILabel*)[(UITableViewCell *)sender.superview viewWithTag:456] setText:[NSString stringWithFormat:@"%d", value]];
    }
}

- (IBAction)toogleChanged:(UIButton *)sender
{
    if ([sender.titleLabel.text isEqualToString:NSLocalizedString(@"No", @"")]) {
        sender.backgroundColor = [UIColor colorWithRed:93/255.0f green:155/255.0f blue:155/255.0f alpha:1.0f];
        sender.layer.borderColor = [UIColor colorWithRed:62/255.0f green:95/255.0f blue:138/255.0f alpha:1.0f].CGColor;
        [sender setTitle:NSLocalizedString(@"Yes", @"") forState:UIControlStateNormal];
        [(UILabel*)[(UITableViewCell *)sender.superview viewWithTag:789] setText:NSLocalizedString(@"Yes", @"")];
        
    } else {
        sender.backgroundColor = [UIColor colorWithRed:62/255.0f green:95/255.0f blue:138/255.0f alpha:1.0f];
        sender.layer.borderColor = [UIColor colorWithRed:93/255.0f green:155/255.0f blue:155/255.0f alpha:1.0f].CGColor;
        [sender setTitle:NSLocalizedString(@"No", @"") forState:UIControlStateNormal];
        [(UILabel*)[(UITableViewCell *)sender.superview viewWithTag:789] setText:NSLocalizedString(@"No", @"")];
    }
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 4;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *title = @"";
    switch (section) {
        case 0:
            title = NSLocalizedString(@"Booking Summary", @"");
            break;
        case 1:
            title = NSLocalizedString(@"Primary Passenger Information", @"");
            break;
        case 2:
            title = [NSString stringWithFormat:@"%@ %@", NSLocalizedString(@"Travel Details", @""), self.type];
            break;
        case 3:
            title = NSLocalizedString(@"Special request and instructions", @"");
            break;
    }
    
    return title;
}

- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 0)];
    [headerView setBackgroundColor:[UIColor colorWithRed:48.0f/255.0f green:101.0f/255.0f blue:123.0f/255.0f alpha:0.9f]];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(15, 0,300, 36);
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentNatural;
    [label setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16.0f]];
    label.text = [self tableView:tableView titleForHeaderInSection:section];
    [headerView addSubview:label];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 36;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    int numberRows = 0;
    switch (section) {
        case 0:
            numberRows = 6;
            break;
        case 1:
            numberRows = 3;
            break;
        case 2:
            if (self.transfer == self->hth && self.type == self->oneWay) {
                numberRows = 2;
            } else if (self.transfer == self->hth && self.type == self->roundTrip) {
                numberRows = 4;
            } else if (self.transfer == self->ath && self.type == self->oneWay) {
                numberRows = 3;
            } else if (self.transfer == self->ath && self.type == self->roundTrip) {
                numberRows = 6;
            } else {
                numberRows = 3;
            }
            break;
        case 3:
            numberRows = 3;
            break;
    }
    return numberRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CustomCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.detailTextLabel.textColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell.textLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:16.0f]];
        [cell.detailTextLabel setFont:[UIFont fontWithName:@"Arial" size:16.0f]];
        
        /*
         UIStepper* stepper = [[UIStepper alloc] init];
         stepper.frame = CGRectMake(156, 7, 100, 10);
         stepper.maximumValue = 5;
         stepper.minimumValue = 0;
         stepper.wraps = NO;
         stepper.continuous = NO;
         stepper.stepValue = 1;
         [[UIButton appearanceWhenContainedIn:[UIStepper class], nil] setBackgroundColor:[UIColor colorWithRed:62/255.0f green:95/255.0f blue:138/255.0f alpha:1.0f]];
         [stepper setTintColor:[UIColor colorWithRed:93/255.0f green:155/255.0f blue:155/255.0f alpha:1.0f]];
         [cell.contentView addSubview:stepper];
         
         UIButton *toogleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
         toogleButton.frame = CGRectMake(200, 5, 50, 30);
         toogleButton.backgroundColor = [UIColor colorWithRed:62/255.0f green:95/255.0f blue:138/255.0f alpha:1.0f];
         toogleButton.layer.cornerRadius = 5;
         toogleButton.layer.borderWidth = 1.0f;
         toogleButton.layer.borderColor = [UIColor colorWithRed:93/255.0f green:155/255.0f blue:155/255.0f alpha:1.0f].CGColor;
         [toogleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
         [toogleButton setTitle:NSLocalizedString(@"No", @"") forState:UIControlStateNormal];
         [cell.contentView addSubview:toogleButton];
         */
    }
    
    if (indexPath.section == 0) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryNone;
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = NSLocalizedString(@"From", @"");
                cell.detailTextLabel.text = self.fromName;
                break;
            case 1:
                cell.textLabel.text =  NSLocalizedString(@"To", @"");
                cell.detailTextLabel.text = self.toName;
                break;
            case 2:
                cell.textLabel.text = NSLocalizedString(@"People", @"");
                cell.detailTextLabel.text = self.pax;
                break;
            case 3:
                cell.textLabel.text = NSLocalizedString(@"Vehicle", @"");
                cell.detailTextLabel.text = self.vehicle;
                break;
            case 4:
                cell.textLabel.text = NSLocalizedString(@"Type", @"");
                cell.detailTextLabel.text = self.type;
                break;
            case 5:
                cell.textLabel.text = [NSString stringWithFormat:@" %@ %@", NSLocalizedString(@"Total", @""), NSLocalizedString(@"USD", @"")];
                cell.detailTextLabel.text = self.total;
                break;
        }
        
    } else if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = NSLocalizedString(@"Name", @"");
                cell.detailTextLabel.text = self.primaryPassengerName;
                break;
            case 1:
                cell.textLabel.text =  NSLocalizedString(@"Email adress", @"");
                cell.detailTextLabel.text = self.emailAdress;
                break;
            case 2:
                cell.textLabel.text = NSLocalizedString(@"Mobil Phone", @"");
                cell.detailTextLabel.text = self.mobilPhone;
                break;
        }
        
    } else if (indexPath.section == 2) {
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (self.transfer == self->hth && self.type == self->oneWay) {
            switch (indexPath.row) {
                case 0:
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell.accessoryType = UITableViewCellAccessoryNone;
                    cell.textLabel.text = NSLocalizedString(@"Pickup From", @"");
                    cell.detailTextLabel.text = self.fromName;
                    break;
                case 1:
                    cell.textLabel.text = NSLocalizedString(@"Day and time", @"");
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [self.dateFormatter stringFromDate:self.arrivalDayAndTime]];
                    break;
            }
            
        } else if (self.transfer == self->hth && self.type == self->roundTrip) {
            switch (indexPath.row) {
                case 0:
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell.accessoryType = UITableViewCellAccessoryNone;
                    cell.textLabel.text = NSLocalizedString(@"Pickup From", @"");
                    cell.detailTextLabel.text = self.fromName;
                    break;
                case 1:
                    cell.textLabel.text = NSLocalizedString(@"Day and time", @"");
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [self.dateFormatter stringFromDate:self.arrivalDayAndTime]];
                    break;
                case 2:
                    cell.selectionStyle = UITableViewCellSelectionStyleNone;
                    cell.accessoryType = UITableViewCellAccessoryNone;
                    cell.textLabel.text = NSLocalizedString(@"Pickup From", @"");
                    cell.detailTextLabel.text = self.toName;
                    break;
                case 3:
                    cell.textLabel.text = NSLocalizedString(@"Day and time", @"");
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [self.dateFormatter stringFromDate:self.departureDayAndTime]];
                    break;
            }
            
        } else if (self.transfer == self->ath && self.type == self->oneWay) {
            cell.selectionStyle = UITableViewCellSelectionStyleDefault;
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = NSLocalizedString(@"Arrival Airline", @"");
                    cell.detailTextLabel.text = self.arrivalAirline;
                    break;
                case 1:
                    cell.textLabel.text = NSLocalizedString(@"Flight", @"");
                    cell.detailTextLabel.text = self.arrivalFlight;
                    break;
                case 2:
                    cell.textLabel.text = NSLocalizedString(@"Day and time", @"");
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [self.dateFormatter stringFromDate:self.arrivalDayAndTime]];
                    break;
                default:
                    cell.detailTextLabel.text = @"";
                    break;
            }
            
        } else if (self.transfer == self->ath && self.type == self->roundTrip) {
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = NSLocalizedString(@"Arrival Airline", @"");
                    cell.detailTextLabel.text = self.arrivalAirline;
                    break;
                case 1:
                    cell.textLabel.text = NSLocalizedString(@"Flight", @"");
                    cell.detailTextLabel.text = self.arrivalFlight;
                    break;
                case 2:
                    cell.textLabel.text = NSLocalizedString(@"Day and time", @"");
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [self.dateFormatter stringFromDate:self.arrivalDayAndTime]];
                    break;
                case 3:
                    cell.textLabel.text = NSLocalizedString(@"Departure Airline", @"");
                    cell.detailTextLabel.text = self.departureAirline;
                    break;
                case 4:
                    cell.textLabel.text = NSLocalizedString(@"Flight", @"");
                    cell.detailTextLabel.text = self.departureFlight;
                    break;
                case 5:
                    cell.textLabel.text = NSLocalizedString(@"Day and time", @"");
                    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", [self.dateFormatter stringFromDate:self.departureDayAndTime]];
                    break;
            }
            
        } else {
            // hta
            switch (indexPath.row) {
                case 0:
                    cell.textLabel.text = NSLocalizedString(@"Departure Airline", @"");
                    cell.detailTextLabel.text = self.departureAirline;
                    break;
                case 1:
                    cell.textLabel.text = NSLocalizedString(@"Flight", @"");
                    cell.detailTextLabel.text = self.departureFlight;
                    break;
                case 2:
                    cell.textLabel.text = NSLocalizedString(@"Day and time", @"");
                    cell.detailTextLabel.text =  [NSString stringWithFormat:@"%@", [self.dateFormatter stringFromDate:self.departureDayAndTime]];
                    break;
            }
            
        }
        
    } else if (indexPath.section == 3) {
        
        // Section == 3
        UIStepper* stepper = [[UIStepper alloc] init];
        stepper.frame = CGRectMake(156, 7, 100, 10);
        stepper.maximumValue = 5;
        stepper.minimumValue = 0;
        stepper.wraps = NO;
        stepper.continuous = NO;
        stepper.stepValue = 1;
        [[UIButton appearanceWhenContainedIn:[UIStepper class], nil] setBackgroundColor:[UIColor colorWithRed:62/255.0f green:95/255.0f blue:138/255.0f alpha:1.0f]];
        [stepper setTintColor:[UIColor colorWithRed:93/255.0f green:155/255.0f blue:155/255.0f alpha:1.0f]];
        
        UIButton *toogleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        toogleButton.frame = CGRectMake(200, 5, 50, 30);
        toogleButton.backgroundColor = [UIColor colorWithRed:62/255.0f green:95/255.0f blue:138/255.0f alpha:1.0f];
        toogleButton.layer.cornerRadius = 5;
        toogleButton.layer.borderWidth = 1.0f;
        toogleButton.layer.borderColor = [UIColor colorWithRed:93/255.0f green:155/255.0f blue:155/255.0f alpha:1.0f].CGColor;
        [toogleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [toogleButton setTitle:NSLocalizedString(@"No", @"") forState:UIControlStateNormal];
        
        switch (indexPath.row) {
            case 0:
                //[cell.contentView addSubview:stepper];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.accessoryType = UITableViewCellAccessoryNone;
                cell.textLabel.text = NSLocalizedString(@"Baby Car Seat", @"");
                cell.detailTextLabel.text = @"No";
                [cell.detailTextLabel setTag:456];
                [stepper addTarget:self
                            action:@selector(stepperChanged:)
                  forControlEvents:UIControlEventValueChanged];
                [stepper setTag:indexPath.section+indexPath.row];
                break;
            case 1:
                //[cell.contentView addSubview:toogleButton];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.accessoryType = UITableViewCellAccessoryNone;
                cell.textLabel.text = NSLocalizedString(@"Bulky Luggage", @"");
                cell.detailTextLabel.text = @"No";
                [cell.detailTextLabel setTag:789];
                [toogleButton addTarget:self
                                 action:@selector(toogleChanged:)
                       forControlEvents:UIControlEventTouchDown];
                [toogleButton setTag:indexPath.section+indexPath.row];
                break;
            case 2:
                cell.textLabel.text = NSLocalizedString(@"Other", @"");
                cell.detailTextLabel.text = self.other;
                cell.detailTextLabel.lineBreakMode = NSLineBreakByCharWrapping;
                cell.detailTextLabel.numberOfLines = 0;
                [cell.detailTextLabel sizeToFit];
                break;
        }
        
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (indexPath.section == 3 && indexPath.row == 2) {
        return 44*3;
    }
    return 44;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].textLabel.textColor = [UIColor orangeColor];
    
    return indexPath;
    
}
- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView cellForRowAtIndexPath:indexPath].textLabel.textColor = [UIColor whiteColor];
    
    return indexPath;
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        [self performSegueWithIdentifier:@"pushSegueEditionControls2" sender:indexPath];
        
    } else if (indexPath.section == 2) {
        if (self.transfer == self->hth && self.type == self->oneWay) {
            if (indexPath.row == 1) [self performSegueWithIdentifier:@"pushSegueEditionControls2" sender:indexPath];
            
        } else if (self.transfer == self->hth && self.type == self->roundTrip) {
            [self performSegueWithIdentifier:@"pushSegueEditionControls2" sender:indexPath];
            
        } else {
            //hta
            [self performSegueWithIdentifier:@"pushSegueEditionControls2" sender:indexPath];
        }
        
    } else if (indexPath.section == 3) {
        if (indexPath.row == 2) [self performSegueWithIdentifier:@"pushSegueEditionControls2" sender:indexPath];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Lookup the cell's index path so we know which row was selected.
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    
    if ([segue.identifier isEqualToString:@"pushSegueEditionControls2"]) {
        TTFEditingViewController* editingController = (TTFEditingViewController *)segue.destinationViewController;
        editingController.sourceController = self;
        editingController.editedObject = self.data;
        if (selectedIndexPath.section == 1) {
            switch (selectedIndexPath.row) {
                case 0:
                    editingController.editedPropertyKey = @"primaryPassengerName";
                    editingController.editedPropertyDisplayName = NSLocalizedString(@"Name", @"");
                    editingController.editingDate = NO;
                    editingController.editingTextView = NO;
                    break;
                case 1:
                    editingController.editedPropertyKey = @"emailAdress";
                    editingController.editedPropertyDisplayName = NSLocalizedString(@"Email Adress", @"");
                    editingController.editingDate = NO;
                    editingController.editingTextView = NO;
                    break;
                case 2:
                    editingController.editedPropertyKey = @"mobilPhone";
                    editingController.editedPropertyDisplayName = NSLocalizedString(@"Mobil Phone", @"");
                    editingController.editingDate = NO;
                    editingController.editingTextView = NO;
                    break;
            }
            
        } else if (selectedIndexPath.section == 2) {
            
            if (self.transfer == self->hth && self.type == self->oneWay) {
                if (selectedIndexPath.row == 1) {
                    editingController.editedPropertyKey = @"dayAndTime";
                    editingController.editedPropertyDisplayName = NSLocalizedString(@"Day and time", @"");
                    editingController.editingDate = YES;
                    editingController.editingTextView = NO;
                }
            } else if (self.transfer == self->hth && self.type == self->roundTrip) {
                if (selectedIndexPath.row == 1 || selectedIndexPath.row == 3) {
                    editingController.editedPropertyKey = @"dayAndTime";
                    editingController.editedPropertyDisplayName = NSLocalizedString(@"Day and time", @"");
                    editingController.editingDate = YES;
                    editingController.editingTextView = NO;
                }
                
            } else if (self.transfer == self->ath && self.type == self->oneWay) {
                switch (selectedIndexPath.row) {
                    case 0:
                        editingController.editedPropertyKey = @"airline";
                        editingController.editedPropertyDisplayName = NSLocalizedString(@"Arrival Airline", @"");
                        editingController.editingDate = NO;
                        editingController.editingTextView = NO;
                        break;
                    case 1:
                        editingController.editedPropertyKey = @"flight";
                        editingController.editedPropertyDisplayName = NSLocalizedString(@"Flight", @"");
                        editingController.editingDate = NO;
                        editingController.editingTextView = NO;
                        break;
                    case 2:
                        editingController.editedPropertyKey = @"dayAndTime";
                        editingController.editedPropertyDisplayName = NSLocalizedString(@"Day and time", @"");
                        editingController.editingDate = YES;
                        editingController.editingTextView = NO;
                        break;
                }
                
            } else if (self.transfer == self->ath && self.type == self->roundTrip) {
                switch (selectedIndexPath.row) {
                    case 0:
                        editingController.editedPropertyKey = @"airline";
                        editingController.editedPropertyDisplayName = NSLocalizedString(@"Arrival Airline", @"");
                        editingController.editingDate = NO;
                        editingController.editingTextView = NO;
                        break;
                    case 1:
                        editingController.editedPropertyKey = @"flight";
                        editingController.editedPropertyDisplayName = NSLocalizedString(@"Flight", @"");
                        editingController.editingDate = NO;
                        editingController.editingTextView = NO;
                        break;
                    case 2:
                        editingController.editedPropertyKey = @"dayAndTime";
                        editingController.editedPropertyDisplayName = NSLocalizedString(@"Day and time", @"");
                        editingController.editingDate = YES;
                        editingController.editingTextView = NO;
                        break;
                    case 3:
                        editingController.editedPropertyKey = @"airline";
                        editingController.editedPropertyDisplayName = NSLocalizedString(@"Departure Airline", @"");
                        editingController.editingDate = NO;
                        editingController.editingTextView = NO;
                        break;
                    case 4:
                        editingController.editedPropertyKey = @"flight";
                        editingController.editedPropertyDisplayName = NSLocalizedString(@"Flight", @"");
                        editingController.editingDate = NO;
                        editingController.editingTextView = NO;
                        break;
                    case 5:
                        editingController.editedPropertyKey = @"dayAndTime";
                        editingController.editedPropertyDisplayName = NSLocalizedString(@"Day and time", @"");
                        editingController.editingDate = YES;
                        editingController.editingTextView = NO;
                        break;
                }
                
            } else {
                // hta
                switch (selectedIndexPath.row) {
                    case 0:
                        editingController.editedPropertyKey = @"airline";
                        editingController.editedPropertyDisplayName = NSLocalizedString(@"Departure Airline", @"");
                        editingController.editingDate = NO;
                        editingController.editingTextView = NO;
                        break;
                    case 1:
                        editingController.editedPropertyKey = @"flight";;
                        editingController.editedPropertyDisplayName = NSLocalizedString(@"Flight", @"");
                        editingController.editingDate = NO;
                        editingController.editingTextView = NO;
                        break;
                    case 2:
                        editingController.editedPropertyKey = @"dayAndTime";;
                        editingController.editedPropertyDisplayName = NSLocalizedString(@"Day and time", @"");
                        editingController.editingDate = YES;
                        editingController.editingTextView = NO;
                        break;
                }
            }
            
        } else if (selectedIndexPath.section == 3) {
            // Section 3
            if (selectedIndexPath.row == 2) {
                editingController.editedPropertyKey = @"other";
                editingController.editedPropertyDisplayName = NSLocalizedString(@"Other", @"");
                editingController.editingDate = NO;
                editingController.editingTextView = YES;
            }
        }
        
    } /*else if ([segue.identifier isEqualToString:@"modalPaypalMEC"]) {
        TTFPaypalPaymentViewController *dvc = [segue destinationViewController];
         dvc.total = self.total;
         if (self.transfer == self->ath) {
         dvc.description = [NSString stringWithFormat:@"Arrival %@", self.type];
         }
    }*/
    
}

- (void)setValue:(id)newValue forEditedProperty:(NSString *)field
{
	id currentValueforEditedProperty = [self.data valueForKey:field];
	[[self.undoManager prepareWithInvocationTarget:self] setValue:currentValueforEditedProperty forEditedProperty:field];
    
    //[self.data setValue:newValue forKey:field];
    
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    if (selectedIndexPath.section == 1) {
        switch (selectedIndexPath.row) {
            case 0:
                self.primaryPassengerName = newValue;
                break;
            case 1:
                self.emailAdress = newValue;
                break;
            case 2:
                self.mobilPhone = newValue;
                break;
        }
        
    } else if (selectedIndexPath.section == 2) {
        
        if (self.transfer == self->hth && self.type == self->oneWay) {
            if (selectedIndexPath.row == 1) self.arrivalDayAndTime = newValue;
            
        } else if (self.transfer == self->hth && self.type == self->roundTrip) {
            switch (selectedIndexPath.row) {
                case 1:
                    self.arrivalDayAndTime = newValue;
                    break;
                case 3:
                    self.departureDayAndTime = newValue;
                    break;
            }
            
        } else if (self.transfer == self->ath && self.type == self->oneWay) {
            switch (selectedIndexPath.row) {
                case 0:
                    self.arrivalAirline = newValue;
                    break;
                case 1:
                    self.arrivalFlight = newValue;
                    break;
                case 2:
                    self.arrivalDayAndTime = newValue;
                    break;
            }
            
        } else if (self.transfer == self->ath && self.type == self->roundTrip) {
            switch (selectedIndexPath.row) {
                case 0:
                    self.arrivalAirline = newValue;
                    break;
                case 1:
                    self.arrivalFlight = newValue;
                    break;
                case 2:
                    self.arrivalDayAndTime = newValue;
                    break;
                case 3:
                    self.departureAirline = newValue;
                    break;
                case 4:
                    self.departureFlight = newValue;
                    break;
                case 5:
                    self.departureDayAndTime = newValue;
                    break;
            }
            
        } else {
            switch (selectedIndexPath.row) {
                case 0:
                    self.departureAirline = newValue;
                    break;
                case 1:
                    self.departureFlight = newValue;
                    break;
                case 2:
                    self.departureDayAndTime = newValue;
                    break;
            }
        }
        
    } else if (selectedIndexPath.section == 3) {
        if (selectedIndexPath.row == 2) self.other = newValue;
    }
    
    [self.tableView reloadData];
}

#pragma mark - Date formatter

- (NSDateFormatter *)dateFormatter
{
	if (_dateFormatter == nil) {
		_dateFormatter = [[NSDateFormatter alloc] init];
		[_dateFormatter setDateStyle:NSDateFormatterMediumStyle];
		[_dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
	}
	return _dateFormatter;
}

@end
