//
//  InboxTableViewController.h
//  Ribbit
//
//  Created by scott harris on 12/11/14.
//  Copyright (c) 2014 scott harris. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MediaPlayer/MediaPlayer.h>

@interface InboxTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *messages;

@property (nonatomic, strong) PFObject *selectedMessage;

@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;

@property (nonatomic, strong) UIRefreshControl *refreshControl;

- (IBAction)logout:(id)sender;


@end
