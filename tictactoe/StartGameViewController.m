//
//  StartGameViewController.m
//  tictactoe
//
//  Created by Peter IJlst on 16-10-12.
//  Copyright (c) 2012 Peter IJlst. All rights reserved.
//

#import "StartGameViewController.h"
#import "GamePlayViewController.h"
#import "GameController.h"

@interface StartGameViewController ()

@end

@implementation StartGameViewController

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
    self.title = @"TitleScreen";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.player1Name.text = nil;
    self.player2Name.text = nil;
}

- (void)viewDidUnload {
    [self setPlayButton:nil];
    [self setPlayer1Name:nil];
    [self setPlayer2Name:nil];
    [super viewDidUnload];
}

- (void)dealloc {
    [_playButton release];
    [_player1Name release];
    [_player2Name release];
    [super dealloc];
}

#pragma mark - IBAction
- (IBAction)playButtonClicked:(UIButton *)sender {
    if(![self.player1Name.text isEqualToString:@""] && ![self.player1Name.text isEqualToString:@""]){
        [[GameController shared] addPlayer:1 withName:self.player1Name.text withGamesWon:0];
        [[GameController shared] addPlayer:2 withName:self.player2Name.text withGamesWon:0];
    } else {
        [[GameController shared] addPlayer:1 withName:@"Player1" withGamesWon:0];
        [[GameController shared] addPlayer:2 withName:@"Player2" withGamesWon:0];
    }
    GamePlayViewController * gamePlayViewController = [[GamePlayViewController alloc] init];
    [self.navigationController pushViewController:gamePlayViewController animated:YES];
    [gamePlayViewController release];
}
@end
