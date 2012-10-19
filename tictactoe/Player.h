//
//  Player.h
//  tictactoe
//
//  Created by Peter IJlst on 18-10-12.
//  Copyright (c) 2012 Peter IJlst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, strong) NSString *name;
@property int gamesWon;

@end
