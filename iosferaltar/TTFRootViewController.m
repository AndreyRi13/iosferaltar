//
//  TTFRootViewController.h
//  iosferaltar
//
//  Created by Eduardo Tonini on 26/06/13.
//  Copyright (c) 2013 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import "TTFRootViewController.h"
#import "TTFEditingViewController.h"
#import "TTFCustomCellBookNow.h"
#import "TTFServicesViewController.h"
#import "TTFData.h"

@interface TTFRootViewController ()

@property (nonatomic, strong) TTFData *data;

@end

@implementation TTFRootViewController

@synthesize dateFormatter = _dateFormatter;
@synthesize searchButton = _searchButton;

#pragma mark - Initialize

- (void)viewDidLoad
{
	[super viewDidLoad];
    
    // Fija titulo para UINavigationBar
    self.navigationItem.title = NSLocalizedString(@"Book Now", @"ir a Localizable.strings");
    
    // Fija imagen de fondo para UIViewController
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    
    // Incluye Custom Cell
    [self.tableView registerNib:[UINib nibWithNibName:@"TTFCustomCellBookNow" bundle:[NSBundle mainBundle]]
         forCellReuseIdentifier:@"CustomCell"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    // Asigna valores a @Property
    self.fromName = NSLocalizedString(@"Cancun Airport | Select your Hotel",@"ir a Localizable.strings");
    self.toName = @"";
    self.pax = @"1";
    self.date = [NSDate date];
    self.code = @"CAP";
    
    // Temp
    self.fromID = @"1361";
    self.fromName = @"CANCUN AIRPORT";
    //self.fromName = @"AKUMAL GRAND PALLADIUM RIVIERA";
    self.toID = @"12"; //12  1361
    self.toName = @"AKUMAL GRAND SIRENIS RESORT";
    self.fromDest = @"10";
    self.toDest = @"15";
    
    // Custom Search Button
    UIImage *btnNormal = [UIImage imageNamed:@"standar.png"];
    UIImage *btnHighlighted = [UIImage imageNamed:@"hover.png"];
    [self.searchButton setBackgroundColor:[UIColor clearColor]];
    [self.searchButton setBackgroundImage:btnNormal forState:UIControlStateNormal];
    [self.searchButton setBackgroundImage:btnHighlighted forState:UIControlStateHighlighted];
    [self.searchButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:25.0f]];
    [self.searchButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.searchButton setTitle:NSLocalizedString(@"Search",@"ir a Localizable.strings") forState:UIControlStateNormal];
    [self.searchButton setEnabled:NO];
}

- (void)viewDidUnload
{
	[super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Release any properties that can be recreated lazily.
    self.fromID = nil;
    self.fromName = nil;
    self.toID = nil;
    self.toName = nil;
    self.pax = nil;
    self.code = nil;
    self.date = nil;
    self.fromDest = nil;
    self.toDest = nil;
    self.data = nil;
	self.dateFormatter = nil;
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:SVProgressHUDWillAppearNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:SVProgressHUDDidAppearNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:SVProgressHUDWillDisappearNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:SVProgressHUDDidDisappearNotification
                                               object:nil];
    
    // Redisplay the data.
    [self.tableView reloadData];
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

- (void)handleNotification:(NSNotification *)notif
{
    //NSLog(@"Notification recieved: %@", notif.name);
    //NSLog(@"Status user info key: %@", [notif.userInfo objectForKey:SVProgressHUDStatusUserInfoKey]);
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CustomCell";
    
    TTFCustomCellBookNow *cell = (TTFCustomCellBookNow *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[TTFCustomCellBookNow alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.shouldIndentWhileEditing = NO;
    }
    
    [cell.stepper setHidden:YES];
    
    switch (indexPath.row) {
        case 0:
            cell.image.image=[UIImage imageNamed:@"from-icon.png"];
            cell.image.frame = CGRectMake(10, 13, 35, 48);
            cell.image.contentMode = UIViewContentModeScaleAspectFit;
            cell.labelText.text = NSLocalizedString(@"From", @"ir a Localizable.strings");
            cell.labelField.text = self.fromName;
            break;
        case 1:
            cell.image.image=[UIImage imageNamed:@"to-icon.png"];
            cell.image.frame = CGRectMake(10, 13, 31, 42);
            cell.image.contentMode = UIViewContentModeScaleAspectFit;
            cell.labelText.text = NSLocalizedString(@"To", @"ir a Localizable.strings");
            cell.labelField.text = self.toName;
            break;
        case 2:
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.accessoryType = UITableViewCellAccessoryNone;
            
            [cell.stepper setHidden:NO];
            
            cell.image.image=[UIImage imageNamed:@"Personas.png"];
            cell.image.frame = CGRectMake(10, 13, 40, 34);
            cell.image.contentMode = UIViewContentModeScaleAspectFit;
            cell.labelText.text = NSLocalizedString(@"People", @"ir a Localizable.strings");
            cell.labelField.text = cell.labelField.text;
            self.pax = cell.labelField.text;
            break;
        case 3:
            cell.image.image=[UIImage imageNamed:@"Calendario.png"];
            cell.image.frame = CGRectMake(10, 13, 34, 37);
            cell.image.contentMode = UIViewContentModeScaleAspectFit;
            cell.labelText.text = NSLocalizedString(@"Date", @"ir a Localizable.strings");
            cell.labelField.text = [NSString stringWithFormat:@"%@", [self.dateFormatter stringFromDate:self.date]];
            break;
        case 4:
            cell.image.image=[UIImage imageNamed:@"cupon.png"];
            cell.image.frame = CGRectMake(10, 13, 37, 37);
            cell.image.contentMode = UIViewContentModeScaleAspectFit;
            cell.labelText.text = NSLocalizedString(@"Discount Code", @"ir a Localizable.strings");
            cell.labelField.text = self.code;
            break;
    }
    
    if (self.fromID != nil && self.toID != nil && self.pax != nil && self.date != nil) {
        [self.searchButton setEnabled:YES];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    return 72;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return UITableViewCellEditingStyleNone;
}

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
	return NO;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch ([indexPath row]) {
        case 0:
            [self performSegueWithIdentifier:@"pushSegueHotelName" sender:indexPath];
            break;
        case 1:
            [self performSegueWithIdentifier:@"pushSegueHotelName" sender:indexPath];
            break;
        case 3:
            [self performSegueWithIdentifier:@"pushSegueEditionControls" sender:indexPath];
            break;
        case 4:
            [self performSegueWithIdentifier:@"pushSegueEditionControls" sender:indexPath];
            break;
        default:
            break;
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Lookup the cell's index path so we know which row was selected.
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    
    if ([segue.identifier isEqualToString:@"pushSegueHotelName"]) {
        TTFHotelesViewController* dvc = segue.destinationViewController;
        self.navigationItem.title = NSLocalizedString(@"Book Now", @"ir a Localizable.strings");
        dvc.delegate = self;
        if (selectedIndexPath.row == 0) {
            [segue.destinationViewController setTitle:NSLocalizedString(@"From", @"ir a Localizable.strings")];
        } else {
            [segue.destinationViewController setTitle:NSLocalizedString(@"To", @"ir a Localizable.strings")];
        }
        
    } else if ([segue.identifier isEqualToString:@"pushSegueEditionControls"]) {
        
        TTFEditingViewController* editingController = (TTFEditingViewController *)segue.destinationViewController;
        editingController.sourceController = self;
        editingController.editedObject = self.data;
        
        switch (selectedIndexPath.row) {
            case 3:
                editingController.editedPropertyKey = @"date";
                editingController.editedPropertyDisplayName = NSLocalizedString(@"Date", @"ir a Localizable.strings");
                editingController.editingDate = YES;
                editingController.editingTextView = NO;
                break;
            case 4:
                editingController.editedPropertyKey = @"code";
                editingController.editedPropertyDisplayName = NSLocalizedString(@"Discount Code", @"ir a Localizable.strings");
                editingController.editingDate = NO;
                editingController.editingTextView = NO;
                break;
        }
        
    } else if ([[segue identifier] isEqualToString:@"pushSegueServicies"]) {
        NSString *airport = @"CANCUN AIRPORT";
        
        TTFServicesViewController* dvc = [segue destinationViewController];
        [segue.destinationViewController setTitle:NSLocalizedString(@"Services", @"ir a Localizable.strings")];
        dvc.fromID = self.fromID;
        dvc.toID = self.toID;
        dvc.pax = self.pax;
        dvc.date = self.date;
        dvc.code = self.code;
        dvc.fromDest = self.fromDest;
        dvc.toDest = self.toDest;
        if (![self.fromName isEqual:airport] && ![self.toName isEqual:airport]) {
            dvc.transfer = @"hth";
        } else if ([self.fromName isEqual:airport] && ![self.toName isEqual:airport]) {
            dvc.transfer = @"ath";
        } else if (![self.fromName isEqual:airport] && [self.toName isEqual:airport]) {
            dvc.transfer = @"hta";
        }
    }
}

#pragma mark - Hoteles delegate

- (void)ttfHotelesViewController:(TTFHotelesViewController *)controller
                     didSelectID:(NSString *)theID
                  didSelectHotel:(NSString *)theHotel
                   didSelectDest:(NSString *)theDest
{
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    if (selectedIndexPath.row == 0) {
        self.fromID = theID;
        self.fromName = theHotel;
        self.fromDest = theDest;
    } else if (selectedIndexPath.row == 1) {
        self.toID = theID;
        self.toName = theHotel;
        self.toDest = theDest;
    }
    [self.tableView reloadData];
    
	[self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Editing controls

- (void)setValue:(id)newValue forEditedProperty:(NSString *)field
{
	id currentValueforEditedProperty = [self.data valueForKey:field];
	[[self.undoManager prepareWithInvocationTarget:self] setValue:currentValueforEditedProperty forEditedProperty:field];
    
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    if (selectedIndexPath.row == 3) {
      	[self.data setValue:newValue forKey:field];
        self.date = newValue;
    } else if (selectedIndexPath.row == 4) {
      	[self.data setValue:newValue forKey:field];
        self.code = newValue;
    }
    
    [self.tableView reloadData];
}

#pragma mark - Date formatter

- (NSDateFormatter *)dateFormatter
{
	if (_dateFormatter == nil) {
		_dateFormatter = [[NSDateFormatter alloc] init];
		[_dateFormatter setDateStyle:NSDateFormatterMediumStyle];
		[_dateFormatter setTimeStyle:NSDateFormatterNoStyle];
	}
	return _dateFormatter;
}

@end
