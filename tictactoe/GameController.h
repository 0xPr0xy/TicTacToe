//
//  GameController.h
//  tictactoe
//
//  Created by Peter IJlst on 18-10-12.
//  Copyright (c) 2012 Peter IJlst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameController : NSObject

@property (nonatomic, strong) Player *player1;
@property (nonatomic, strong) Player *player2;
@property (nonatomic, strong) NSString *player1Name;
@property (nonatomic, strong) NSString *player2Name;

+ (GameController*)shared;
- (void)addPlayer:(int)num withName:(NSString*)name withGamesWon:(int)gamesWon;

@end
