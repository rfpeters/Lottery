//
//  Player.m
//  Peters_Lab05
//
//  Created by Student on 2/26/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "Player.h"

@implementation Player

@synthesize balance;

// Constructor for player.  Sets player balance to 5 if balance passed in is less than 5.
-(id) init: (CGFloat) startBalance
{
    self = [super init];
    
    if(self != NULL)
    {
        if(startBalance < 5.0)
        {
            balance = 5.0;
        }
        else
        {
            balance = startBalance;
        }
    }
    return self;
}

@end
