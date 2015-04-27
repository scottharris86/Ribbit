//
//  EditFriendsTableViewController.h
//  Ribbit
//
//  Created by scott harris on 12/20/14.
//  Copyright (c) 2014 scott harris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditFriendsTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *allUsers;

@property (nonatomic, strong) PFUser *currentUser;

@property (nonatomic, strong) NSMutableArray *friends;


- (BOOL)isFriend:(PFUser *)user;

@end
