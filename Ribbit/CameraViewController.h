//
//  CameraViewController.h
//  Ribbit
//
//  Created by scott harris on 12/20/14.
//  Copyright (c) 2014 scott harris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface CameraViewController : UITableViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (nonatomic, strong) UIImagePickerController *imagePicker;

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) NSString *videoFilePath;

@property (nonatomic, strong) NSArray *friends;

@property (nonatomic, strong) PFRelation *friendsRelation;

@property (nonatomic, strong) NSMutableArray *recipients;

-(void) uploadMessage;

-(UIImage *)resizeImage:(UIImage *)image toWidth:(float)width andHeight:(float)height;

- (IBAction)send:(id)sender;

- (IBAction)cancel:(id)sender;

@end
