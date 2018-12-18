//
//  AbstractPlayerViewController.h
//  TVOSSampleApp
//
//  Copyright © 2016 Ooyala. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PlayerSelectionOption;
@class OOOoyalaTVPlayerViewController;
@class OOOoyalaPlayer;

@interface AbstractPlayerViewController : UIViewController

@property (nonatomic) OOOoyalaTVPlayerViewController *ooyalaPlayerViewController;
@property (nonatomic) PlayerSelectionOption *option;
@property (nonatomic) OOOoyalaPlayer *player;

- (void)notificationHandler:(NSNotification *)notification;

@end
