//
//  GameResultViewController.m
//  tictactoe
//
//  Created by Peter IJlst on 16-10-12.
//  Copyright (c) 2012 Peter IJlst. All rights reserved.
//

#import "GameResultViewController.h"
#import "GameController.h"

@interface GameResultViewController ()
@end

@implementation GameResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Score";
    self.playerOneName.text = [[[GameController shared] player1] name];
    self.playerTwoName.text = [[[GameController shared] player2] name];
    self.playerOneScore.text = [NSString stringWithFormat:@"%i",[[[GameController shared] player1] gamesWon]];
    self.playerTwoScore.text = [NSString stringWithFormat:@"%i",[[[GameController shared] player2] gamesWon]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [_nextGameButton release];
    [_playerOneName release];
    [_playerTwoName release];
    [_playerOneScore release];
    [_playerTwoScore release];
    [super dealloc];
}

- (void)viewDidUnload {
    [self setNextGameButton:nil];
    [self setPlayerOneName:nil];
    [self setPlayerTwoName:nil];
    [self setPlayerOneScore:nil];
    [self setPlayerTwoScore:nil];
    [super viewDidUnload];
}

#pragma mark - IBAction
- (IBAction)nextGameClicked:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
