//
//  ViewController.m
//  SwiftExample
//
//  Created by Bandar Alruwaili on 27/02/2023.
//

#import "SWTestViewController.h"

@interface SWTestViewController ()
@property (nonatomic, strong) UserModel *model;
@property (weak, nonatomic) IBOutlet UISwitch *sw;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@end

@implementation SWTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[UserModel alloc] init];
    [self.sw setOn:[[NSUserDefaults standardUserDefaults] boolForKey:@"hook"]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (IBAction)switchHandler:(UISwitch *)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:sender.isOn forKey:@"hook"];
}

- (IBAction)getUserHandler:(UIButton *)sender {
    self.textView.text = [self.model getUser];
}
@end
