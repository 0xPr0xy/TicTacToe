//
//  GamePlayViewController.m
//  tictactoe
//
//  Created by Peter IJlst on 16-10-12.
//  Copyright (c) 2012 Peter IJlst. All rights reserved.
//

#import "GamePlayViewController.h"
#import "GameResultViewController.h"
#import "GameController.h"


@interface GamePlayViewController ()
@property (nonatomic, strong) UIView * aView;
@end


@implementation GamePlayViewController
@synthesize aView = _aView;
@synthesize gameFields = _gameFields;
@synthesize playerOneTurn = _playerOneTurn;
@synthesize numTurns = _numTurns;
@synthesize endGame = _endGame;
@synthesize board = _board, row1 = _row1, row2 = _row2, row3 = _row3;


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
    self.title = @"Game";
    [self setUpPlayer];
    [self setUpBoard];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self resetGame];
}

- (void)viewDidUnload
{
    for(id obj in self.gameFields){
        obj = nil;
    }
    [self setTurnLabel:nil];
    [self setBoard:nil];
    [self setRow1:nil];
    [self setRow2:nil];
    [self setRow3:nil];
    [self setP1Mark:nil];
    [self setP2Mark:nil];
    [self setGameFields:nil];
    [self setNextGameButton:nil];
    [self setBackButton:nil];
    [self setGameFields:nil];
    [self setAView:nil];
    [super viewDidUnload];
}

- (void)dealloc
{
    [_turnLabel release];
    [_p1Mark release];
    [_p2Mark release];
    [_nextGameButton release];
    [_backButton release];
    [_r1c1 release];
    [_r1c2 release];
    [_r1c3 release];
    [_r2c1 release];
    [_r2c2 release];
    [_r2c3 release];
    [_r3c1 release];
    [_r3c2 release];
    [_r3c3 release];
    [_board release];
    [_row1 release];
    [_row2 release];
    [_row3 release];
    [_gameFields release];
    [_aView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - pushViewController
-(void)goToGameResultView{
    GameResultViewController * gameResultViewController = [[GameResultViewController alloc] init];
    [self.navigationController pushViewController:gameResultViewController animated:YES];
    [gameResultViewController release];
}


#pragma mark - IBAction
- (IBAction)backClicked:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)nextClicked:(UIButton *)sender {
    [self goToGameResultView];
}

#pragma mark - game reset
-(void)resetGame{
    for(UIControl *field in self.gameFields){
        field.tag = 0;
        field.backgroundColor = [UIColor whiteColor];
        field.selected = 0;
    }
    self.numTurns = 0;
    self.endGame = NO;
}

#pragma mark - game setup
- (void)setUpBoard{
    self.board = [[[NSMutableArray alloc] init] autorelease];
    self.row1 = [[[NSMutableArray alloc] init] autorelease];
    self.row2 = [[[NSMutableArray alloc] init] autorelease];
    self.row3 = [[[NSMutableArray alloc] init] autorelease];
    self.gameFields = [NSArray arrayWithObjects:self.r1c1, self.r1c2, self.r1c3, self.r2c1, self.r2c2, self.r2c3, self.r3c1, self.r3c2, self.r3c3, nil];
    for(int i = 0; i <= 2; i++){
        [self.row1 insertObject:[self.gameFields objectAtIndex:i] atIndex:i];
    }
    for(int i = 3; i <= 5; i++){
        [self.row2 insertObject:[self.gameFields objectAtIndex:i] atIndex:i-3];
    }
    for(int i = 6; i <= 8; i++){
        [self.row3 insertObject:[self.gameFields objectAtIndex:i] atIndex:i-6];
    }
    [self.board insertObject:self.row1 atIndex:0];
    [self.board insertObject:self.row2 atIndex:1];
    [self.board insertObject:self.row3 atIndex:2];
}

-(void)setUpPlayer{
    self.playerOneTurn = YES;
    self.numTurns = 0;
    self.turnLabel.text = [[[GameController shared] player1]name];
    self.p1Mark = [UIColor colorWithPatternImage:[UIImage imageNamed:@"p1.png"]];
    self.p2Mark = [UIColor colorWithPatternImage:[UIImage imageNamed:@"p2.png"]];
}

#pragma mark - game logic
- (IBAction)gameFieldClicked:(UIControl *)sender{

    //player one turn, and empty field
    if(self.playerOneTurn && !sender.selected){
        [sender setTag:1];
        [sender setSelected:YES];
        [sender setBackgroundColor:self.p1Mark];
        [self setPlayerOneTurn:NO];
        self.numTurns++;
        self.turnLabel.text = [[[GameController shared] player2]name];
    }
    //player two turn and empty field
    if(!self.playerOneTurn && !sender.selected){
        [sender setTag:2];
        [sender setSelected:YES];
        [sender setBackgroundColor:self.p2Mark];
        [self setPlayerOneTurn:YES];
        self.numTurns++;
        self.turnLabel.text = [[[GameController shared] player1]name];
    }
    if([self checkForWin]){
        [self saveScore];
        [self goToGameResultView];
    }
}

- (void)saveScore{
    
    //save p1 score
    if([self checkForWin] == 1){
        int gamesWon = [[[GameController shared] player1] gamesWon];
        gamesWon++;
        [[[GameController shared] player1] setGamesWon:gamesWon];
    }
    //save p2 score
    if([self checkForWin] == 2){
        int gamesWon = [[[GameController shared] player2] gamesWon];
        gamesWon++;
        [[[GameController shared] player2] setGamesWon:gamesWon];
    }
}

-(int)checkForWin{
    
    for(int i = 0; i<=2; i++){
        
        //rows
        if([self.board[0][i]tag] && [self.board[0][i]tag] == [self.board[1][i]tag] && [self.board[1][i]tag] == [self.board[2][i]tag]){
            [self setEndGame:YES];
            return [self.board[0][i]tag];
        }
        //cols
        if([self.board[i][0]tag] && [self.board[i][0]tag] == [self.board[i][1]tag] && [self.board[i][1]tag] == [self.board[i][2]tag]){
           [self setEndGame:YES];
            return [self.board[i][0]tag];
        }
    }
    //diagonals
    if(([self.board[0][0]tag] && [self.board[0][0]tag] == [self.board[1][1]tag] && [self.board[1][1]tag] == [self.board[2][2]tag]) || ([self.board[0][2]tag] && [self.board[0][2]tag] == [self.board[1][1]tag] && [self.board[1][1]tag] == [self.board[2][0]tag])){
        [self setEndGame:YES];
        return [self.board[1][1]tag];
    }
    //tie
    if(self.numTurns == 9 && !self.endGame){
        return 3;
    }
    return 0;
}

@end
