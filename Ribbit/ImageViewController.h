//
//  ImageViewController.h
//  Ribbit
//
//  Created by scott harris on 12/21/14.
//  Copyright (c) 2014 scott harris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ImageViewController : UIViewController

@property (nonatomic, strong) PFObject *message;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
