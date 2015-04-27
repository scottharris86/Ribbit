//
//  SignupViewController.h
//  Ribbit
//
//  Created by scott harris on 12/11/14.
//  Copyright (c) 2014 scott harris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController


@property (strong, nonatomic) IBOutlet UITextField *emailField;

@property (strong, nonatomic) IBOutlet UITextField *usernameField;

@property (strong, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)dismiss:(id)sender;

- (IBAction)signup:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end
