//
//  GameResultViewController.h
//  tictactoe
//
//  Created by Peter IJlst on 16-10-12.
//  Copyright (c) 2012 Peter IJlst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameResultViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIButton *nextGameButton;
@property (retain, nonatomic) IBOutlet UILabel *playerOneName;
@property (retain, nonatomic) IBOutlet UILabel *playerTwoName;
@property (retain, nonatomic) IBOutlet UILabel *playerOneScore;
@property (retain, nonatomic) IBOutlet UILabel *playerTwoScore;

- (IBAction)nextGameClicked:(UIButton *)sender;

@end
