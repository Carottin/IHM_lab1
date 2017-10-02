//
//  SecondViewController.m
//  HockeyCosom
//
//  Created by Peyrot, Michael on 17-09-28.
//  Copyright © 2017 Peyrot, Michael. All rights reserved.
//
#import "ThirdViewController.h"
#import "SecondViewController.h"
#import "ViewController.h"
#import "MyCell.h"


@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *numPeriod;
@property (weak, nonatomic) IBOutlet UITableView *tableViewTeam1;
@property (weak, nonatomic) IBOutlet UITableView *tableViewTeam2;
@property (weak, nonatomic) IBOutlet UILabel *team1NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *team2NameLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *teamPickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *marqueurPickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *passeur1PickerView;
@property (weak, nonatomic) IBOutlet UIPickerView *passeur2PickerView;
@property (weak, nonatomic) IBOutlet UILabel *team1ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *team2ScoreLabel;

- (IBAction)decPeriod:(UIButton *)sender;
- (IBAction)incPeriod:(UIButton *)sender;
- (IBAction)addGoal:(UIButton *)sender;



@end


@implementation SecondViewController 
NSMutableArray *statsArray;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _team1NameLabel.text = _t1->name;
    _team2NameLabel.text = _t2->name;
    statsArray = [[NSMutableArray alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//TABLEVIEW

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCell *cell = (MyCell *)[tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    if(cell == nil) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"MyCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    if(tableView == _tableViewTeam1){
        cell.numLabel.text = [NSString stringWithFormat:@"%i", ((Player *)[self.t1->playerArray objectAtIndex:indexPath.row])->number];
        cell.nomLabel.text = ((Player *)[self.t1->playerArray objectAtIndex:indexPath.row])->name;
        cell.butLabel.text = [NSString stringWithFormat:@"%i", ((Player *)[self.t1->playerArray objectAtIndex:indexPath.row])->but];
        cell.passLabel.text = [NSString stringWithFormat:@"%i", ((Player *)[self.t1->playerArray objectAtIndex:indexPath.row])->pass];
    }
    else{
        cell.numLabel.text = [NSString stringWithFormat:@"%i", ((Player *)[self.t2->playerArray objectAtIndex:indexPath.row])->number];
        cell.nomLabel.text = ((Player *)[self.t2->playerArray objectAtIndex:indexPath.row])->name;
        cell.butLabel.text = [NSString stringWithFormat:@"%i", ((Player *)[self.t2->playerArray objectAtIndex:indexPath.row])->but];
        cell.passLabel.text = [NSString stringWithFormat:@"%i", ((Player *)[self.t2->playerArray objectAtIndex:indexPath.row])->pass];
    }
    // TO DO

    return cell;
}

//PICKERVIEW

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(pickerView == _teamPickerView)
        return 2;
    else //Marqueur, passeurs
        return 5;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(pickerView == _teamPickerView){
        if(row == 0)
            return _t1->name;
        else
            return _t2->name;
    }
    else{
        if([_teamPickerView selectedRowInComponent:0] == 0){
            return ((Player *)[_t1->playerArray objectAtIndex:row])->name;
        }
        if([_teamPickerView selectedRowInComponent:0] == 1){
            return ((Player *)[_t2->playerArray objectAtIndex:row])->name;
        }
    }
    return @"erwe";

}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(pickerView == _teamPickerView){
        [_marqueurPickerView reloadAllComponents];
        [_passeur1PickerView reloadAllComponents];
        [_passeur2PickerView reloadAllComponents];
    }
}


- (IBAction)decPeriod:(UIButton *)sender {
    if ([_numPeriod.text integerValue] > 1)
        _numPeriod.text = [NSString stringWithFormat:@"%li", [_numPeriod.text integerValue] -1];
}

- (IBAction)incPeriod:(UIButton *)sender {
    if ([_numPeriod.text integerValue] < 3)
        _numPeriod.text = [NSString stringWithFormat:@"%li", [_numPeriod.text integerValue] + 1];
}

- (IBAction)addGoal:(UIButton *)sender {
    if([_teamPickerView selectedRowInComponent:0] == 0){
        [[_t1->playerArray objectAtIndex: [_marqueurPickerView selectedRowInComponent:0]] addGoal];
        [[_t1->playerArray objectAtIndex: [_passeur1PickerView selectedRowInComponent:0]] addPass];
        [[_t1->playerArray objectAtIndex: [_passeur1PickerView selectedRowInComponent:0]] addPass];
        _team1ScoreLabel.text = [NSString stringWithFormat:@"%li", [_team1ScoreLabel.text integerValue] + 1];
        [_tableViewTeam1 reloadData];
        [self addStats:_t1 marqueur: [_t1->playerArray objectAtIndex: [_marqueurPickerView selectedRowInComponent:0]]
              passeur1:[_t1->playerArray objectAtIndex: [_passeur1PickerView selectedRowInComponent:0]]
                        passeur2:[_t1->playerArray objectAtIndex: [_passeur1PickerView selectedRowInComponent:0]]
                                  period:_numPeriod.text];
    }
    if([_teamPickerView selectedRowInComponent:0] == 1){
        [[_t2->playerArray objectAtIndex: [_marqueurPickerView selectedRowInComponent:0]] addGoal];
        [[_t2->playerArray objectAtIndex: [_passeur1PickerView selectedRowInComponent:0]] addPass];
        [[_t2->playerArray objectAtIndex: [_passeur2PickerView selectedRowInComponent:0]] addPass];
        _team2ScoreLabel.text = [NSString stringWithFormat:@"%li", [_team2ScoreLabel.text integerValue] + 1];
        [_tableViewTeam2 reloadData];
        [self addStats:_t2 marqueur: [_t2->playerArray objectAtIndex: [_marqueurPickerView selectedRowInComponent:0]]
              passeur1:[_t2->playerArray objectAtIndex: [_passeur1PickerView selectedRowInComponent:0]]
              passeur2:[_t2->playerArray objectAtIndex: [_passeur1PickerView selectedRowInComponent:0]]
                period:_numPeriod.text];
    }
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"GOAL" message:@"le but est bien entré" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];





}


- (void)addStats:(Team *)team marqueur:(Player *)marqueur passeur1:(Player *)passeur1 passeur2:(Player *)passeur2 period:(NSString *) period{
    [statsArray addObject: [NSString stringWithFormat: @"period %@, Equipe : %@ -BUT : %@, AIDES : %@ %@", period, team->name, marqueur->name, passeur1->name, passeur2->name]];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    ThirdViewController *myThirdViewController = (ThirdViewController *)segue.destinationViewController;
    myThirdViewController.statsArray = statsArray;
    myThirdViewController.t1 = _t1;
    myThirdViewController.t2 = _t2;
    
}
@end
