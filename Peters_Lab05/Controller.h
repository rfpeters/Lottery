//
//  Controller.h
//  Peters_Lab05
//
//  Created by Student on 2/26/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Controller : NSObject
{
    IBOutlet UITextField *txtBalance;
    IBOutlet UITextField *txtPot;
    IBOutlet UIButton *btnPick1_1;
    IBOutlet UIButton *btnPick1_2;
    IBOutlet UIButton *btnPick1_3;
    IBOutlet UIButton *btnPick1_4;
    IBOutlet UIButton *btnPick1_5;
    IBOutlet UIButton *btnPick1_6;
    IBOutlet UITextField *txtPick1;
    IBOutlet UILabel *lblWarningPick1;
    IBOutlet UIButton *btnPick2_1;
    IBOutlet UIButton *btnPick2_2;
    IBOutlet UIButton *btnPick2_3;
    IBOutlet UIButton *btnPick2_4;
    IBOutlet UIButton *btnPick2_5;
    IBOutlet UIButton *btnPick2_6;
    IBOutlet UITextField *txtPick2;
    IBOutlet UILabel *lblWarningPick2;
    IBOutlet UIButton *btnDraw;
    IBOutlet UITextField *txtNumber1;
    IBOutlet UITextField *txtNumber2;
    IBOutlet UIButton *btnNewPick;
    IBOutlet UILabel *lblYouLose;
    NSInteger pick1;
    NSInteger pick2;
    NSInteger balance;
    NSInteger pot;
}

- (id) init;
- (IBAction)pick1: (id)sender;
- (IBAction)pick2: (id)sender;
- (IBAction)draw: (id)sender;
- (IBAction)newPick: (id)sender;
- (void) disableButtons;
- (void) enableButtons;
- (void) clearFields;
- (void) displayBalanceAndPot;



@end
