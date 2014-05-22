//
//  TTFAppDelegate.m
//  iosferaltar
//
//  Created by Eduardo Tonini on 06/06/13.
//  Copyright (c) 2013 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import "TTFAppDelegate.h"
#import <AFNetworkReachabilityManager.h>
#import "TTFSessionManager.h"
#include <hipmob/HMService.h>

@implementation TTFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    // Method of Feraltar
    [self sleep];
    [self customizeNavigationBar];
    [self customizeTabBar];
    
    [[HMService sharedService] setup:@"5652b0919e7a47728c6da4903e4925e8" withLaunchOptions:launchOptions];
    
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - Notification observers

- (void)notesAPIReachabilityChangedNotification:(NSNotification *)notification
{
    NSLog(@"Rechability status: %ld", [TTFSessionManager sharedInstance].reachabilityManager.networkReachabilityStatus);
    NSLog(@"Rechability status string: %@", [[TTFSessionManager sharedInstance].reachabilityManager localizedNetworkReachabilityStatusString]);
    
    if ([TTFSessionManager sharedInstance].reachabilityManager.isReachableViaWiFi) {
        NSLog(@"La API está disponible vía WiFi");
    } else if ([TTFSessionManager sharedInstance].reachabilityManager.isReachableViaWWAN) {
        NSLog(@"La API está disponible vía WWAN (3G, LTE, GPRS…)");
    }
}

#pragma mark -
#pragma mark - Code App Feraltar

// Timeout launch image
- (void) sleep
{
    return [NSThread sleepForTimeInterval:2.0];
}

// Custom NatigationBar
- (void)customizeNavigationBar
{
    // Set the setBackgroundImage
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"header.png"] forBarMetrics:UIBarMetricsDefault];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"header.png"] forBarMetrics:UIBarMetricsDefault];
    
    // Set the setTintColor
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f]];
    
    // Title text for *all* UINavigationBars
    NSShadow *titleShadow = [[NSShadow alloc] init];
    titleShadow.shadowOffset = CGSizeMake(0.0f, -1.0f);
    titleShadow.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0f];
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName:[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f],
                                                                    NSShadowAttributeName:titleShadow,
                                                                      NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:20.0f]}];

    // Custom UIBarButtmItem
    [[UIBarButtonItem appearance] setTitleTextAttributes:@{
                                                          NSForegroundColorAttributeName:[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:1.0f],
                                                                     NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:14.0f]}
                                                forState:UIControlStateNormal];
}

// Custom TabBar
- (void)customizeTabBar
{
    // Assign tab bar item with titles
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UITabBar *tabBar = tabBarController.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    UITabBarItem *tabBarItem4 = [tabBar.items objectAtIndex:3];
    
    tabBarItem1.title = NSLocalizedString(@"Home",@"ir a Localizable.strings");
    tabBarItem2.title = NSLocalizedString(@"Info",@"ir a Localizable.strings");
    tabBarItem3.title = NSLocalizedString(@"Chat",@"ir a Localizable.strings");
    tabBarItem4.title = NSLocalizedString(@"About Us",@"ir a Localizable.strings");

    [tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@"home_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"home.png"]];
    [tabBarItem2 setFinishedSelectedImage:[UIImage imageNamed:@"info_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"info.png"]];
    [tabBarItem3 setFinishedSelectedImage:[UIImage imageNamed:@"chat_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"chat.png"]];
    [tabBarItem4 setFinishedSelectedImage:[UIImage imageNamed:@"feraltar_selected.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"feraltar.png"]];

    //[tabBarItem1 setImage:[[UIImage imageNamed:@"home.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    //[tabBarItem1 setSelectedImage:[[UIImage imageNamed:@"home_selected.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    // Tabbar
    UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar_selected.png"]];
    
    // StateNormal
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                   NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:10.0f]}
                                             forState:UIControlStateNormal];
    
    // StateHighlighted
    [[UITabBarItem appearance] setTitleTextAttributes:@{
                                                        NSForegroundColorAttributeName:[UIColor colorWithRed:15/255.0f green:113/255.0f blue:129/255.0f alpha:1.0f],
                                                                   NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:10.0f]}
                                             forState:UIControlStateSelected];

}

@end
