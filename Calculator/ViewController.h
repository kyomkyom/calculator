//
//  ViewController.h
//  Calculator
//
//  Created by 川本　恭平 on 13/11/14.
//  Copyright (c) 2013年 Univ Of Kitakyusyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{

    IBOutlet UILabel *numberLabel;
    IBOutletCollection(UIButton) NSArray *numberButton;
    BOOL startImput;
    int currentValue;
    int operation;
}

- (IBAction)numberButton_down:(id)sender;
- (IBAction)clearButton_down:(id)sender;
- (IBAction)equalButton_down:(id)sender;
- (IBAction)opButton_down:(id)sender;

@end
