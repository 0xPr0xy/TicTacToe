//
//  GameController.m
//  tictactoe
//
//  Created by Peter IJlst on 18-10-12.
//  Copyright (c) 2012 Peter IJlst. All rights reserved.
//

#import "GameController.h"

static GameController *sharedGameController = nil;

@implementation GameController

@synthesize player1Name = _player1Name;
@synthesize player2Name = _player2Name;
@synthesize player1;
@synthesize player2;

+ (GameController*)shared
{
    @synchronized(self) {
        if (sharedGameController == nil) {
            sharedGameController = [[self alloc] init];
        }
    }
    return sharedGameController;
}

#pragma mark addPlayer
- (void)addPlayer:(int)num withName:(NSString*)name withGamesWon:(int)gamesWon{
    if(num==1){
        player1 = [[Player alloc] init];
        player1.name = name;
        player1.gamesWon = gamesWon;
    }
    else{
        player2 = [[Player alloc] init];
        player2.name = name;
        player2.gamesWon = gamesWon;
    }
}
@end
