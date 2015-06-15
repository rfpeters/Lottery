//
//  Player.h
//  Peters_Lab05
//
//  Created by Student on 2/26/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
{
    CGFloat balance;
}

@property(nonatomic, readwrite) CGFloat balance;

-(id) init: (CGFloat) startBalance;

@end
