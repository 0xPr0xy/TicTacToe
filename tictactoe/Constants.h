//
//  Constants.h
//  tictactoe
//
//  Created by Peter IJlst on 16-10-12.
//  Copyright (c) 2012 Peter IJlst. All rights reserved.
//

#define NCLog(s, ...) NCLog(@"%s:%d - %@", __FUNCTION__ , __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__])