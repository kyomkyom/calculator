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



- (IBAction)equalButton_down:(id)sender;{
    //直前に押された演算子で場合分け
    if( operation == 0){
       currentValue += [numberLabel.text intValue];
    } else if ( operation == 1){
        currentValue -= [numberLabel.text intValue];
    } else if ( operation == 2){
        currentValue *= [numberLabel.text intValue];
    } else if ( operation == 3){
        currentValue /= [numberLabel.text intValue];
    }
    //表示の更新
    numberLabel.text = [NSString stringWithFormat:@"%d", currentValue];
    startImput = YES;
    count = 0;
    currentValue = 0;
    
    
}

- (IBAction)opButton_down:(id)sender;{
    UIButton *b = (UIButton *)sender;
    count += 1;
    
    //現在値の保存及び演算    
    
    if( operation == 0){
        currentValue += [numberLabel.text intValue];
    } else if ( operation == 1){
        currentValue -= currentValue - [numberLabel.text intValue];
    } else if ( operation == 2){
        if (count >= 2){
            currentValue *= [numberLabel.text intValue];
        } else {currentValue = [numberLabel.text intValue];
            }
    } else if ( operation == 3){
        if (count >= 2){
            currentValue /= [numberLabel.text intValue];
        } else {currentValue = [numberLabel.text intValue];
            }
    }

    //演算の保存
    numberLabel.text = [NSString stringWithFormat:@"%d", currentValue];
    operation = b.tag;
    startImput = YES;
    
}
- (IBAction)clearButton_down:(id)sender;{
    numberLabel.text = @"0";
    startImput = YES;
}

- (IBAction)allClearbutton_down:(id)sender;{
    numberLabel.text = @"0";
    currentValue = 0;
    count = 0;
    startImput = YES;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
