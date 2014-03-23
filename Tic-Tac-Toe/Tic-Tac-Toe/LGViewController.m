//
//  LGViewController.m
//  Tic-Tac-Toe
//
//  Created by Holger Liesegang on 19.03.14.
//  Copyright (c) 2014 Holger Liesegang. All rights reserved.
//

#import "LGViewController.h"

@interface LGViewController ()
{
    UIImageView *tmpIV;
}

@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imageViewField;

@property (weak, nonatomic) UIImage *imageForTheXSign;
@property (weak, nonatomic) UIImage *imageForTheOSign;
@property (weak, nonatomic) UIImage *imageForTheXredSign;
@property (weak, nonatomic) UIImage *imageForTheOredSign;

@property (copy, nonatomic) NSString *activePlayer;
@property (assign) NSInteger countMove;

-(void) startNewGame;
-(NSString *) checkForWinner;

@end

@implementation LGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Assigning the O & X signs
    self.imageForTheXSign = [UIImage imageNamed:@"X.png"];
    self.imageForTheOSign = [UIImage imageNamed:@"O.png"];
    self.imageForTheXredSign = [UIImage imageNamed:@"X-red.png"];
    self.imageForTheOredSign = [UIImage imageNamed:@"O-red.png"];
    // Set X (1) as active player
    self.activePlayer = @"X";
    self.statusLabel.text = @"It's your turn, X";
    // Generate imageViewField
    self.countMove = 1;
    tmpIV = [UIImageView new];
    [self startNewGame];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    // check to see which imageViewField of type UIImage has been touched
    for (UIImageView *field in self.imageViewField)
    {
        if (CGRectContainsPoint(field.frame, [touch locationInView:self.view]))
        {
            if ([self.activePlayer isEqual:@"X"])
            {
                field.image = self.imageForTheXSign;
                self.activePlayer = @"O";
                self.statusLabel.text = @"It's you turn, O";
            }
            else
            {
                field.image = self.imageForTheOSign;
                self.activePlayer = @"X";
                self.statusLabel.text = @"It's you turn, X";
            }
        };
    };
    NSString *result = [self checkForWinner];
    if ([result isEqual:@"X"])
    {
        self.statusLabel.text = @"";
        UIActionSheet *winXSheet = [[UIActionSheet alloc] initWithTitle:@"X won!" delegate:self cancelButtonTitle:@"OK" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        [winXSheet showInView:self.view];
    };
    if ([result isEqual:@"O"])
    {
        self.statusLabel.text = @"";
        UIActionSheet *winXSheet = [[UIActionSheet alloc] initWithTitle:@"O won!" delegate:self cancelButtonTitle:@"OK" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        [winXSheet showInView:self.view];
    };
    self.countMove++;
    if (self.countMove > 9)
    {
        self.statusLabel.text = @"";
        UIActionSheet *winXSheet = [[UIActionSheet alloc] initWithTitle:@"No winner!" delegate:self cancelButtonTitle:@"OK" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
        [winXSheet showInView:self.view];
    };
}


- (void)startNewGame
{
    for (UIImageView *field in self.imageViewField) {
        field.image = NULL;
    }
    self.countMove = 1;
    self.activePlayer = @"X";
    self.statusLabel.text = @"It's you turn, X";
}


- (NSString *)checkForWinner {

	// Check horizontal
    if (([self.imageViewField[0] image] != NULL) &
        ([self.imageViewField[0] image] == [self.imageViewField[1] image]) &
        ([self.imageViewField[1] image] == [self.imageViewField[2] image]))
    {
        if ([[self.imageViewField[0] image] isEqual: self.imageForTheXSign])
        {
            tmpIV = self.imageViewField[0];
            tmpIV.image = self.imageForTheXredSign;
            tmpIV = self.imageViewField[1];
            tmpIV.image = self.imageForTheXredSign;
            tmpIV = self.imageViewField[2];
            tmpIV.image = self.imageForTheXredSign;
            return @"X";
        } else
        {
            tmpIV = self.imageViewField[0];
            tmpIV.image = self.imageForTheOredSign;
            tmpIV = self.imageViewField[1];
            tmpIV.image = self.imageForTheOredSign;
            tmpIV = self.imageViewField[2];
            tmpIV.image = self.imageForTheOredSign;
            return @"O";
        };
    };

    if (([self.imageViewField[3] image] != NULL) &
        ([self.imageViewField[3] image] == [self.imageViewField[4] image]) &
        ([self.imageViewField[4] image] == [self.imageViewField[5] image]))
    {
        if ([[self.imageViewField[3] image] isEqual: self.imageForTheXSign])
        {
            tmpIV = self.imageViewField[3];
            tmpIV.image = self.imageForTheXredSign;
            tmpIV = self.imageViewField[4];
            tmpIV.image = self.imageForTheXredSign;
            tmpIV = self.imageViewField[5];
            tmpIV.image = self.imageForTheXredSign;
            return @"X";
        } else
        {
            tmpIV = self.imageViewField[3];
            tmpIV.image = self.imageForTheOredSign;
            tmpIV = self.imageViewField[4];
            tmpIV.image = self.imageForTheOredSign;
            tmpIV = self.imageViewField[5];
            tmpIV.image = self.imageForTheOredSign;
            return @"O";
        };
    };

    if (([self.imageViewField[6] image] != NULL) &
        ([self.imageViewField[6] image] == [self.imageViewField[7] image]) &
        ([self.imageViewField[7] image] == [self.imageViewField[8] image]))
    {
        if ([[self.imageViewField[6] image] isEqual: self.imageForTheXSign])
        {
            tmpIV = self.imageViewField[6];
            tmpIV.image = self.imageForTheXredSign;
            tmpIV = self.imageViewField[7];
            tmpIV.image = self.imageForTheXredSign;
            tmpIV = self.imageViewField[8];
            tmpIV.image = self.imageForTheXredSign;
            return @"X";
        } else
        {
            tmpIV = self.imageViewField[6];
            tmpIV.image = self.imageForTheOredSign;
            tmpIV = self.imageViewField[7];
            tmpIV.image = self.imageForTheOredSign;
            tmpIV = self.imageViewField[8];
            tmpIV.image = self.imageForTheOredSign;
            return @"O";
        };
    };

	// Check vertical
    if (([self.imageViewField[0] image] != NULL) &
        ([self.imageViewField[0] image] == [self.imageViewField[3] image]) &
        ([self.imageViewField[3] image] == [self.imageViewField[6] image]))
    {
        if ([[self.imageViewField[0] image] isEqual: self.imageForTheXSign])
        {
            tmpIV = self.imageViewField[0];
            tmpIV.image = self.imageForTheXredSign;
            tmpIV = self.imageViewField[3];
            tmpIV.image = self.imageForTheXredSign;
            tmpIV = self.imageViewField[6];
            tmpIV.image = self.imageForTheXredSign;
            return @"X";
        } else
        {
            tmpIV = self.imageViewField[0];
            tmpIV.image = self.imageForTheOredSign;
            tmpIV = self.imageViewField[3];
            tmpIV.image = self.imageForTheOredSign;
            tmpIV = self.imageViewField[6];
            tmpIV.image = self.imageForTheOredSign;
            return @"O";
        };
    };

    if (([self.imageViewField[1] image] != NULL) &
        ([self.imageViewField[1] image] == [self.imageViewField[4] image]) &
        ([self.imageViewField[4] image] == [self.imageViewField[7] image]))
    {
        if ([[self.imageViewField[1] image] isEqual: self.imageForTheXSign])
        {
            tmpIV = self.imageViewField[1];
            tmpIV.image = self.imageForTheXredSign;
            tmpIV = self.imageViewField[4];
            tmpIV.image = self.imageForTheXredSign;
            tmpIV = self.imageViewField[7];
            tmpIV.image = self.imageForTheXredSign;
            return @"X";
        } else
        {
            tmpIV = self.imageViewField[1];
            tmpIV.image = self.imageForTheOredSign;
            tmpIV = self.imageViewField[4];
            tmpIV.image = self.imageForTheOredSign;
            tmpIV = self.imageViewField[7];
            tmpIV.image = self.imageForTheOredSign;
            return @"O";
        };
    };

    if (([self.imageViewField[2] image] != NULL) &
        ([self.imageViewField[2] image] == [self.imageViewField[5] image]) &
        ([self.imageViewField[5] image] == [self.imageViewField[8] image]))
    {
        if ([[self.imageViewField[2] image] isEqual: self.imageForTheXSign])
        {
            tmpIV = self.imageViewField[2];
            tmpIV.image = self.imageForTheXredSign;
            tmpIV = self.imageViewField[5];
            tmpIV.image = self.imageForTheXredSign;
            tmpIV = self.imageViewField[8];
            tmpIV.image = self.imageForTheXredSign;
            return @"X";
        } else
        {
            tmpIV = self.imageViewField[2];
            tmpIV.image = self.imageForTheOredSign;
            tmpIV = self.imageViewField[5];
            tmpIV.image = self.imageForTheOredSign;
            tmpIV = self.imageViewField[8];
            tmpIV.image = self.imageForTheOredSign;
            return @"O";
        };
    };

	// Check diagonal
    if (([self.imageViewField[0] image] != NULL) &
        ([self.imageViewField[0] image] == [self.imageViewField[4] image]) &
        ([self.imageViewField[4] image] == [self.imageViewField[8] image]))
    {
        if ([[self.imageViewField[0] image] isEqual: self.imageForTheXSign])
        {
            tmpIV = self.imageViewField[0];
            tmpIV.image = self.imageForTheXredSign;
            tmpIV = self.imageViewField[4];
            tmpIV.image = self.imageForTheXredSign;
            tmpIV = self.imageViewField[8];
            tmpIV.image = self.imageForTheXredSign;
            return @"X";
        } else
        {
            tmpIV = self.imageViewField[0];
            tmpIV.image = self.imageForTheOredSign;
            tmpIV = self.imageViewField[4];
            tmpIV.image = self.imageForTheOredSign;
            tmpIV = self.imageViewField[8];
            tmpIV.image = self.imageForTheOredSign;
            return @"O";
        };
    };

    if (([self.imageViewField[2] image] != NULL) &
        ([self.imageViewField[2] image] == [self.imageViewField[4] image]) &
        ([self.imageViewField[4] image] == [self.imageViewField[6] image]))
    {
        if ([[self.imageViewField[2] image] isEqual: self.imageForTheXSign])
        {
            tmpIV = self.imageViewField[2];
            tmpIV.image = self.imageForTheXredSign;
            tmpIV = self.imageViewField[4];
            tmpIV.image = self.imageForTheXredSign;
            tmpIV = self.imageViewField[6];
            tmpIV.image = self.imageForTheXredSign;
            return @"X";
        } else
        {
            tmpIV = self.imageViewField[2];
            tmpIV.image = self.imageForTheOredSign;
            tmpIV = self.imageViewField[4];
            tmpIV.image = self.imageForTheOredSign;
            tmpIV = self.imageViewField[6];
            tmpIV.image = self.imageForTheOredSign;
            return @"O";
        };
    };
    
    return nil;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    [self startNewGame];
}

-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [self startNewGame];
}

@end
