//
//  TTFChat.m
//  iosferaltar
//
//  Created by sistemas@feraltar.com on 29/04/14.
//  Copyright (c) 2014 Transportes Turísticos Feraltar, S.A. de C.V. All rights reserved.
//

#import "TTFChat.h"
#import "hipmob/HMService.h"

@interface TTFChat ()

@end

@implementation TTFChat

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
    
    // Fija imagen de fondo para UIViewController
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]];

    /*
    [[HMService sharedService] openChat:self withSetup:^(HMChatViewController * controller){
        
        // set the title of the chat window
        controller.body.title = @"Chat with an Operator";
        
        // the HMChatViewController is a UINavigationController, so we have access to all the navigation controller fields
        // adjust the navigation bar's tint color to match the applications color
        controller.navigationBar.tintColor = [UIColor colorWithRed:145.0/255.0 green:18.0/255.0 blue:0.0 alpha:1];
        
        // make sure the input text field doesn't expand more than 4 lines
        controller.chatView.maxInputLines = 4;
        
        // set the placeholder text shown in the input text field and the color to use
        controller.chatView.placeholder = @"Start chatting";
        controller.chatView.placeholderColor = [UIColor grayColor];
        
        // make sure any URLs pushed open up in a
        controller.shouldUseSystemBrowser = FALSE;
        
        // set the context: this tells the operator who the user is and what action the user was taking
        [controller.chatView updateName:@"Eduardo Tonini Castillo"];
        [controller.chatView updateEmail:@"eduardo@feraltar.com"];
        [controller.chatView updateContext:@"Getting my Hipmob integration all set up"];
        
        // set a push token (if you have one saved: this allows Hipmob to send chat messages from the operator even when
        // the user is offline)
        //if(token){
        //    [controller.chatView setPushToken:token];
        //}
    
    }];
    */
    
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

- (IBAction)on_open_demo:(id)sender {
    
    
    [[HMService sharedService] openChat:self withSetup:^(HMChatViewController * controller){
        
        // set the title of the chat window
        controller.body.title = @"Chat with an Operator";
        
        // the HMChatViewController is a UINavigationController, so we have access to all the navigation controller fields
        // adjust the navigation bar's tint color to match the applications color
        controller.navigationBar.tintColor = [UIColor colorWithRed:145.0/255.0 green:18.0/255.0 blue:0.0 alpha:1];
        
        // make sure the input text field doesn't expand more than 4 lines
        controller.chatView.maxInputLines = 4;
        
        // set the placeholder text shown in the input text field and the color to use
        controller.chatView.placeholder = @"Start chatting";
        controller.chatView.placeholderColor = [UIColor grayColor];
        
        // make sure any URLs pushed open up in a
        controller.shouldUseSystemBrowser = FALSE;
        
        // set the context: this tells the operator who the user is and what action the user was taking
        [controller.chatView updateName:@"Eduardo Tonini Castillo"];
        [controller.chatView updateEmail:@"etoniinc@hotmil.com"];
        [controller.chatView updateContext:@"Getting my Hipmob integration all set up"];
        
        // set a push token (if you have one saved: this allows Hipmob to send chat messages from the operator even when
        // the user is offline)
        //if(token){
        //    [controller.chatView setPushToken:token];
        //}
        
    }];

}


@end
