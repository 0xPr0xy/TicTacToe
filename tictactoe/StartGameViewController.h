//
//  StartGameViewController.h
//  tictactoe
//
//  Created by Peter IJlst on 16-10-12.
//  Copyright (c) 2012 Peter IJlst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartGameViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIButton *playButton;
@property (assign, nonatomic) IBOutlet UITextField *player1Name, *player2Name;

- (IBAction)playButtonClicked:(UIButton *)sender;

@end
