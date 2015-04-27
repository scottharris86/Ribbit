//
//  LoginViewController.h
//  Ribbit
//
//  Created by scott harris on 12/11/14.
//  Copyright (c) 2014 scott harris. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)signin:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end
