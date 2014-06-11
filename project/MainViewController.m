//
//  MainViewController.m
//  FacebookFeed
//
//  Created by Nathan Romero on 6/6/14.
//  Copyright (c) 2014 naromero. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIView *post;
@property (weak, nonatomic) IBOutlet UIView *actions;
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UIView *commentImageView;
@property (weak, nonatomic) IBOutlet UIView *textInput;

- (IBAction)onTap:(id)sender;

// Declare some methods that will be called when the keyboard is about to be shown or hidden
- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;



@end

@implementation MainViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Register the methods for the keyboard hide/show events
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Post Styling
    self.post.layer.cornerRadius = 3;
    self.post.layer.borderColor = [UIColor colorWithRed:0.745 green:0.757 blue:0.773 alpha:1].CGColor;
    self.post.layer.borderWidth = 1;
    
    self.post.layer.shadowColor = [UIColor colorWithRed:0.153 green:0.239 blue:0.298 alpha:1].CGColor;
    self.post.layer.shadowOffset = CGSizeMake(0,0);
    self.post.layer.shadowOpacity = .1;
    self.post.layer.shadowRadius = 3;
    
    // Action Bar Styling
    self.actions.layer.borderWidth= 1;
    self.actions.layer.borderColor= [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1].CGColor;
    
    // Post Image Styling
    
    // Text Input Styling
    self.textInput.layer.borderWidth= 1;
    self.textInput.layer.borderColor= [UIColor colorWithRed:0.933 green:0.933 blue:0.933 alpha:1].CGColor;
    
    // Navigation Settings
    self.navigationItem.title = @"Post";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.commentImageView.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.commentImageView.frame.size.height, self.commentImageView.frame.size.width, self.commentImageView.frame.size.height);
                     }
                     completion:nil];
}

- (void)willHideKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         self.commentImageView.frame = CGRectMake(0, 477, self.commentImageView.frame.size.width, self.commentImageView.frame.size.height);
                     }
                     completion:nil];
}


- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

@end
