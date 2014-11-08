//
//  LoginViewController.h
//  LoginApp
//
//  Created by HAL on 11/6/14.
//  Copyright (c) 2014 com.prasad. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *txtUsername;

@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

- (IBAction)validateLogin:(id)sender;

- (IBAction)backgroundTap:(id)sender;
@end
