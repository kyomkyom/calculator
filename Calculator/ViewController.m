//
//  ViewController.m
//  Calculator
//
//  Created by 川本　恭平 on 13/11/14.
//  Copyright (c) 2013年 Univ Of Kitakyusyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    startImput = YES;
}
- (IBAction)numberButton_down:(id)sender;{
    UIButton *b = (UIButton *)sender;
    if(startImput) {
        //最初の1桁目が0ならば表示しない。
        if(b.tag == 0) return;
        //新しく表示する文字列を作成。
        numberLabel.text = [NSString stringWithFormat:@"%d", b.tag];
        startImput = NO;
    } else {
        //既に表示されている文字列に連結。
        numberLabel.text = [NSString stringWithFormat:@"%@%d", numberLabel.text, b.tag];
    }
}

- (IBAction)clearButton_down:(id)sender;{
    numberLabel.text = @"0";
    startImput = YES;
    
}



    
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
