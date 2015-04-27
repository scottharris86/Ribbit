//
//  EditFriendsTableViewController.m
//  Ribbit
//
//  Created by scott harris on 12/20/14.
//  Copyright (c) 2014 scott harris. All rights reserved.
//

#import "EditFriendsTableViewController.h"
#import "MSCellAccessory.h"

@interface EditFriendsTableViewController ()

@end

@implementation EditFriendsTableViewController

UIColor *disclosureColor;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    PFQuery *query = [PFUser query];
    self.currentUser = [PFUser currentUser];
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error: %@, %@", error, [error userInfo]);
        } else {
            self.allUsers = objects;
            [self.tableView reloadData];
        }
    }];
    
    disclosureColor = [UIColor colorWithRed:0.553 green:0.439 blue:0.718 alpha:1.0];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.allUsers.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    
    if ([self isFriend:user]) {
        cell.accessoryView = [MSCellAccessory accessoryWithType:FLAT_CHECKMARK color:disclosureColor];
    } else {
        cell.accessoryView = nil;
    }
    
    return cell;
}

#pragma mark - Table View Delagate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Removes Gray background after selecting
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    // Sets the selected cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    // Get the user object in the select cell
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    
    // Create relation for current user
    PFRelation *friendsRelation = [self.currentUser relationForKey:@"friendsRelation"];
    
    
    // Check if user selected is already a friend.. if they are we uncheck and unfriend
    if ([self isFriend:user]) {
        
        // Removes Checkmark
        cell.accessoryView = nil;
        
        // Loop through friends and remove them from friends array
        for (PFUser *friend in self.friends) {
            
            if ([friend.objectId isEqualToString:user.objectId]) {
                [self.friends removeObject:friend];
                break;
            }
        }
        
        // Parse function to remove selected user from relations on parse backend.
        [friendsRelation removeObject:user];
      // Else we add the checkmark and the friend relationship on backend
    } else {
        
        // Add Checkmark
        cell.accessoryView = [MSCellAccessory accessoryWithType:FLAT_CHECKMARK color:disclosureColor];
        
        // Add user to local array.
        [self.friends addObject:user];
        
        // Parse function to add selected user to relationships on parse backend.
        [friendsRelation addObject:user];
        
    }
    
    // depending on whether they are being added or removed.. we now save the changes to the relationships for the current user.
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            NSLog(@"Error: %@, %@", error, [error userInfo]);
        }
    }];
    
    
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Helper Methods


- (BOOL)isFriend:(PFUser *)user {
    for (PFUser *friend in self.friends) {
        
        if ([friend.objectId isEqualToString:user.objectId]) {
            return true;
        }
    }
    
    return false;
    
}

@end
