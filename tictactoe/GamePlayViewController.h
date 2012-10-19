//
//  GamePlayViewController.h
//  tictactoe
//
//  Created by Peter IJlst on 16-10-12.
//  Copyright (c) 2012 Peter IJlst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GamePlayViewController : UIViewController

@property (retain, nonatomic) NSArray *gameFields;
@property (retain, nonatomic) IBOutlet UILabel *turnLabel;
@property (retain, nonatomic) IBOutlet UIButton *nextGameButton, *backButton;
@property (retain, nonatomic) IBOutlet UIControl *r1c1, *r1c2, *r1c3, *r2c1, *r2c2, *r2c3, *r3c1, *r3c2, *r3c3;
@property (retain, nonatomic) UIColor *p1Mark,*p2Mark;
@property (retain, nonatomic) NSMutableArray *board, *row1, *row2, *row3;
@property BOOL endGame, playerOneTurn;
@property int numTurns;

- (IBAction)backClicked:(UIButton *)sender;
- (IBAction)nextClicked:(UIButton *)sender;
- (IBAction)gameFieldClicked:(UIControl*)sender;
- (int)checkForWin;
- (void)setUpBoard;
- (void)setUpPlayer;
- (void)resetGame;
- (void)saveScore;

@end
