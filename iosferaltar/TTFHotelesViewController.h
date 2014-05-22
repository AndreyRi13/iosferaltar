//
//  TTFHotelesViewController.h
//  iosferaltar
//
//  Created by Simon Ng on 14/06/12 (RecipeBook Search Bar).
//  Adapted by Eduardo Tonini on 26/06/13.
//  Copyright (c) 2013 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

@class TTFHotelesViewController;

@protocol TTFHotelesViewControllerDelegate <NSObject>
- (void)ttfHotelesViewController:(TTFHotelesViewController *)controller
                     didSelectID:(NSString *)theID
                  didSelectHotel:(NSString *)theHotel
                   didSelectDest:(NSString *)theDest;
@end

@interface TTFHotelesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) id <TTFHotelesViewControllerDelegate> delegate;
@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *hotelID;
@property (nonatomic, strong) NSString *destID;


@end
