//
//  ViewController.m
//  HockeyCosom
//
//  Created by Peyrot, Michael on 17-09-14.
//  Copyright © 2017 Peyrot, Michael. All rights reserved.
//

#import "ViewController.h"
#import "Player.h"
#import "Team.h"

@interface ViewController ()
- (IBAction)goToGameView:(id)sender;


// Team 1
@property(nonatomic, retain) Team *t1;
@property (weak, nonatomic) IBOutlet UITextField *team1Name;
//Players
@property (weak, nonatomic) IBOutlet UITextField *team1Player1;
@property (weak, nonatomic) IBOutlet UITextField *team1Player1Number;

@property (weak, nonatomic) IBOutlet UITextField *team1Player2;
@property (weak, nonatomic) IBOutlet UITextField *team1Player2Number;

@property (weak, nonatomic) IBOutlet UITextField *team1Player3;
@property (weak, nonatomic) IBOutlet UITextField *team1Player3Number;

@property (weak, nonatomic) IBOutlet UITextField *team1Player4;
@property (weak, nonatomic) IBOutlet UITextField *team1Player4Number;

@property (weak, nonatomic) IBOutlet UITextField *team1Player5;
@property (weak, nonatomic) IBOutlet UITextField *team1Player5Number;



// Team 2
@property(nonatomic, retain) Team *t2;
@property (weak, nonatomic) IBOutlet UITextField *team2Name;
//Players
@property (weak, nonatomic) IBOutlet UITextField *team2Player1;
@property (weak, nonatomic) IBOutlet UITextField *team2Player1Number;

@property (weak, nonatomic) IBOutlet UITextField *team2Player2;
@property (weak, nonatomic) IBOutlet UITextField *team2Player2Number;

@property (weak, nonatomic) IBOutlet UITextField *team2Player3;
@property (weak, nonatomic) IBOutlet UITextField *team2Player3Number;

@property (weak, nonatomic) IBOutlet UITextField *team2Player4;
@property (weak, nonatomic) IBOutlet UITextField *team2Player4Number;

@property (weak, nonatomic) IBOutlet UITextField *team2Player5;
@property (weak, nonatomic) IBOutlet UITextField *team2Player5Number;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goToGameView:(id)sender {
    self.t1 = [[Team alloc] initialize:_team1Name.text];
    self.t2 = [[Team alloc] initialize:_team2Name.text];
    
    Player * p1t1 = [[Player alloc] initialize:_team1Player1.text number:[_team1Player1Number.text intValue]];
    [self.t1->playerArray addObject:p1t1];
    Player * p2t1 = [[Player alloc] initialize:_team1Player2.text number:[_team1Player2Number.text intValue]];
    [self.t1->playerArray addObject:p2t1];
    Player * p3t1 = [[Player alloc] initialize:_team1Player3.text number:[_team1Player3Number.text intValue]];
    [self.t1->playerArray addObject:p3t1];
    Player * p4t1 = [[Player alloc] initialize:_team1Player4.text number:[_team1Player4Number.text intValue]];
    [self.t1->playerArray addObject:p4t1];
    Player * p5t1 = [[Player alloc] initialize:_team1Player5.text number:[_team1Player5Number.text intValue]];
    [self.t1->playerArray addObject:p5t1];
    
    Player * p1t2 = [[Player alloc] initialize:_team2Player1.text number:[_team2Player1Number.text intValue]];
    [self.t2->playerArray addObject:p1t2];
    Player * p2t2 = [[Player alloc] initialize:_team2Player2.text number:[_team2Player2Number.text intValue]];
    [self.t2->playerArray addObject:p2t2];
    Player * p3t2 = [[Player alloc] initialize:_team2Player3.text number:[_team2Player3Number.text intValue]];
    [self.t2->playerArray addObject:p3t2];
    Player * p4t2 = [[Player alloc] initialize:_team2Player4.text number:[_team2Player4Number.text intValue]];
    [self.t2->playerArray addObject:p4t2];
    Player * p5t2 = [[Player alloc] initialize:_team2Player5.text number:[_team2Player5Number.text intValue]];
    [self.t2->playerArray addObject:p5t2];
    
    for(int i=0 ; i<[self.t1->playerArray count]; i++) {
        Player *test1 = [self.t1->playerArray objectAtIndex:i];
        NSLog(test1->name);
    }
}
@end
