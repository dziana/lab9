//
//  ViewController.m
//  Flappy
//
//  Created by Pepsi Max on 26/05/17.
//  Copyright © 2017 Pepsi Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    highestScoreNumber = [[NSUserDefaults standardUserDefaults]integerForKey:@"highScoreSaved"];
    highScore.text = [NSString stringWithFormat:@"High Score = %li",(long)highestScoreNumber];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
