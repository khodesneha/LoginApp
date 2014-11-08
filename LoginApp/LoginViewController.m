//
//  LoginViewController.m
//  LoginApp
//
//  Created by HAL on 11/6/14.
//  Copyright (c) 2014 com.prasad. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"
#import "AppConstants.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@", server_url);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"login_success"]) {
        HomeViewController *hvc = [segue destinationViewController];
        hvc.username = [self.txtUsername text];
    }
}

- (IBAction)validateLogin:(id)sender {
    if ([[self.txtUsername text] isEqualToString:@""] || [[self.txtPassword text] isEqualToString: @""]) {
        [self alertStatus:@"Please enter username & password" :@"Signin Failed" :0];
    } else if([[self.txtUsername text] isEqualToString: [self.txtPassword text]]) {
        [self performSegueWithIdentifier:@"login_success" sender:self];
    } else {
        [self alertStatus:@"Invalid login attempt" :@"Signin Failed" :1];
    }
}

- (void) alertStatus: (NSString *) msg : (NSString *) title : (int) tag {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
