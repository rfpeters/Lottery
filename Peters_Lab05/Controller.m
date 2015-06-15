//
//  Controller.m
//  Peters_Lab05
//
//  App is used to play a lottery game.  The player has to pick two numbers and
//  then draw the winning numbers.
//
//  Created by Student on 2/26/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "Controller.h"

@implementation Controller

// Sets random
- (void) awakeFromNib
{
    srandom(time(NULL));
}

- (id) init
{
    self = [super init];
    balance = 5;
    pot = 5;
    pick1 = 0;
    pick2 = 0;
    return self;
}

// Action is used to pick the first number
- (IBAction) pick1: (id) sender
{
    NSString *pick = [(UIButton*)sender currentTitle];
    txtNumber1.text = @"";
    txtNumber2.text = @"";
    lblWarningPick1.text = @"";
    
    if([pick integerValue] != pick2)
    {
        pick1 = [pick integerValue];
        txtPick1.text = [NSString stringWithFormat:@"%ld", (long)pick1];
        
    }
}

// Action is used to pick the second number
- (IBAction) pick2: (id) sender
{
    NSString *pick = [(UIButton*)sender currentTitle];
    txtNumber1.text = @"";
    txtNumber2.text = @"";
    lblWarningPick2.text = @"";
    
    if([pick integerValue] != pick1)
    {
        pick2 = [pick integerValue];
        txtPick2.text = [NSString stringWithFormat:@"%ld", (long)pick2];
    }
}

// Action is used to pick the winning numbers and check to see if the player won or lost
- (IBAction)draw: (id) sender
{
    NSInteger numbersPicked[2] = {0, 0};
    NSInteger numbers[2] = {0, 0};
    NSInteger numbersMatched = 0;
    
    if(pick1 != 0 && pick2 != 0)
    {
        numbersPicked[0] = pick1;
        numbersPicked[1] = pick2;
        do {
            numbers[0] = random() % 6 + 1;
            numbers[1] = random() % 6 + 1;
        } while (numbers[0] == numbers[1]);
        
        numbersPicked[0] = pick1;
        numbersPicked[1] = pick2;
        
        txtNumber1.text = [NSString stringWithFormat:@"%ld", (long)numbers[0]];
        txtNumber2.text = [NSString stringWithFormat:@"%ld", (long)numbers[1]];
        
        for(int i = 0; i < 2; i++)
        {
            for(int j = 0; j < 2; j++)
            {
                if(numbersPicked[i] == numbers[j])
                {
                    numbersMatched++;
                }
            }
        }
        
        if(numbersMatched == 0)
        {
            balance -= 1;
            pot += 1;
        }
        else if(numbersMatched == 2)
        {
            balance += pot;
            pot = 10;
        }
        
        [self disableButtons];
    }
    if(pick1 == 0)
    {
        lblWarningPick1.text = @"You must pick a number";
    }
    if(pick2 == 0)
    {
        lblWarningPick2.text = @"You must pick a number";
    }
    if(balance == 0)
    {
        lblYouLose.text = @"You Lose";
    }
    
    [self displayBalanceAndPot];
}

// Action is used to allow the play to pikc new numbers
- (IBAction)newPick: (id) sender
{
    [self enableButtons];
    [self clearFields];
    pick1 = 0;
    pick2 = 0;
    if(balance == 0)
    {
        balance = 5;
    }
}

// Diables all buttons
- (void) disableButtons
{
    [btnPick1_1 setEnabled: NO];
    [btnPick1_2 setEnabled: NO];
    [btnPick1_3 setEnabled: NO];
    [btnPick1_4 setEnabled: NO];
    [btnPick1_5 setEnabled: NO];
    [btnPick1_6 setEnabled: NO];
    [btnPick2_1 setEnabled: NO];
    [btnPick2_2 setEnabled: NO];
    [btnPick2_3 setEnabled: NO];
    [btnPick2_4 setEnabled: NO];
    [btnPick2_5 setEnabled: NO];
    [btnPick2_6 setEnabled: NO];
    [btnDraw setEnabled: NO];
}

// Enables all buttons
- (void) enableButtons
{
    [btnPick1_1 setEnabled: YES];
    [btnPick1_2 setEnabled: YES];
    [btnPick1_3 setEnabled: YES];
    [btnPick1_4 setEnabled: YES];
    [btnPick1_5 setEnabled: YES];
    [btnPick1_6 setEnabled: YES];
    [btnPick2_1 setEnabled: YES];
    [btnPick2_2 setEnabled: YES];
    [btnPick2_3 setEnabled: YES];
    [btnPick2_4 setEnabled: YES];
    [btnPick2_5 setEnabled: YES];
    [btnPick2_6 setEnabled: YES];
    [btnDraw setEnabled: YES];
}

// Clears the text fields
- (void) clearFields
{
    txtNumber1.text = @"";
    txtNumber2.text = @"";
    lblWarningPick1.text = @"";
    txtPick1.text = @"";
    lblWarningPick2.text = @"";
    txtPick2.text = @"";
    lblYouLose.text = @"";
}

// Displays the balance and pot
- (void) displayBalanceAndPot
{
    txtBalance.text = [NSString stringWithFormat:@"%ld", (long)balance];
    txtPot.text = [NSString stringWithFormat:@"%ld", (long)pot];}

@end
