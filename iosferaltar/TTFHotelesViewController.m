//
//  TTFHotelesViewController.h
//  iosferaltar
//
//  Created by Simon Ng on 14/06/12 (RecipeBook Search Bar).
//  Adapted by Eduardo Tonini on 26/06/13.
//  Copyright (c) 2013 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import "TTFHotelesViewController.h"
#import "TTFSessionManager.h"

@interface TTFHotelesViewController ()
@end

@implementation TTFHotelesViewController
{
    NSArray *hoteles;
    NSMutableArray *searchResults;
}

@synthesize tableView = _tableView;
@synthesize delegate;

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    
    //[[UISearchBar appearance] setBackgroundImage:[UIImage imageNamed:@"bg.png"]];
    [[UISearchBar appearance] setBackgroundColor:[UIColor colorWithRed:48.0f/255.0f green:101.0f/255.0f blue:123.0f/255.0f alpha:1.0f ]];
    
    ///*
    UISearchBar* sb =[[UISearchBar alloc] init];
    //sb.backgroundImage = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];
    sb.barTintColor= [UIColor colorWithRed:48.0f/255.0f green:101.0f/255.0f blue:123.0f/255.0f alpha:1.0f ];
    //*/
    
    self->hoteles = [[NSArray alloc] init];
    self->searchResults = [[NSMutableArray alloc] init];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table view delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RecipeCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        NSString* title = [[searchResults objectAtIndex:indexPath.row] valueForKey:@"value"];
        cell.textLabel.text = title;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        NSString* theID = [NSString stringWithFormat:@"%@", [[searchResults objectAtIndex:indexPath.row] valueForKey:@"hotelID"]];
        NSString* theHotel = [[searchResults objectAtIndex:indexPath.row] valueForKey:@"value"];
        NSString* theDest = [NSString stringWithFormat:@"%@", [[searchResults objectAtIndex:indexPath.row] valueForKey:@"destID"]];
        [self.delegate ttfHotelesViewController:self didSelectID:theID didSelectHotel:theHotel didSelectDest:theDest];
    }
}

- (BOOL) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    if ([searchString length] < 2) {
        [searchResults removeAllObjects];
        
    } else {
        //*
        NSDictionary *parameters = @{ @"key":@"b04b77ac5851224ac844547bc6e61915", @"term":searchString };
        [[TTFSessionManager sharedInstance] GET:@"hoteles?"
                                     parameters:parameters
                                        success:^(NSURLSessionDataTask *task, id responseObject) {
                                             self->hoteles = [responseObject valueForKey:@"hoteles"];
                                        } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                             [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"Failed with Error", @"")];
                                        }];
        //*/
        
        /*
        NSDictionary *parameters = @{ @"term":searchString };
        [[TTFSessionManager sharedInstance] GET:@"hoteles?"
                                     parameters:parameters
                                        success:^(NSURLSessionDataTask *task, id responseObject) {
                                            self->hoteles = [responseObject valueForKey:@"hoteles"];
                                        } failure:^(NSURLSessionDataTask *task, NSError *error) {
                                            [SVProgressHUD showErrorWithStatus:NSLocalizedString(@"Failed with Error", @"")];
                                        }];
        */
        
        [self->searchResults removeAllObjects];
        for (NSDictionary* item in self->hoteles) {
            NSString* string = [item valueForKey:@"value"];
            NSRange range = [string rangeOfString:searchString options:NSCaseInsensitiveSearch];
            if (range.location != NSNotFound) {
                [self->searchResults addObject:item];
            }
        }
    }
    
    return YES;
}

@end
