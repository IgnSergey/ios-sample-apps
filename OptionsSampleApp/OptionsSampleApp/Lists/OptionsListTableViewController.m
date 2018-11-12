//
//  OptionsListTableViewController.m
//  OptionsSampleApp
//
//  Created on 12/18/14.
//  Copyright (c) 2014 ooyala. All rights reserved.
//

#import "IQConfigurationPlayerViewController.h"
#import "OptionsListTableViewController.h"
#import "TVRatingsPlayerViewController.h"
#import "OptionsViewController.h"
#import "PlayerSelectionOption.h"


@interface OptionsListTableViewController ()
@property (nonatomic) NSMutableArray *options;
@property BOOL qaLogEnabled;
@end

@implementation OptionsListTableViewController

static NSString *cellId = @"pickerCell";

- (id)init {
    self = [super init];
    self.title = @"Options Configuration";
    return self;
}

- (void)addAllPlayerSelectionOptions {
    [self insertNewObject: [[PlayerSelectionOption alloc] initWithTitle:@"IQ Configuration Sample"
                                                              embedCode:@"Y1ZHB1ZDqfhCPjYYRbCEOz0GR8IsVRm1"
                                                                  pcode:@"c0cTkxOqALQviQIGAHWY5hP0q9gU"
                                                                 domain:@"http://www.ooyala.com"
                                                         viewController: [IQConfigurationPlayerViewController class]]];
    [self insertNewObject: [[PlayerSelectionOption alloc] initWithTitle:@"Preload/Promo Image with Preroll"
                                                              embedCode:@"Zlcmp0ZDrpHlAFWFsOBsgEXFepeSXY4c"
                                                                  pcode:@"BidTQxOqebpNk1rVsjs2sUJSTOZc"
                                                                 domain:@"http://www.ooyala.com"
                                                         viewController: [OptionsViewController class]]];
    [self insertNewObject: [[PlayerSelectionOption alloc] initWithTitle:@"Preload/Promo Image with Midroll"
                                                              embedCode:@"pncmp0ZDp7OKlwTPJlMZzrI59j8Imefa"
                                                                  pcode:@"BidTQxOqebpNk1rVsjs2sUJSTOZc"
                                                                 domain:@"http://www.ooyala.com"
                                                         viewController: [OptionsViewController class]]];
    [self insertNewObject: [[PlayerSelectionOption alloc] initWithTitle:@"Preload/Promo Image with Postroll"
                                                              embedCode:@"Zpcmp0ZDpaB-90xK8MIV9QF973r1ZdUf"
                                                                  pcode:@"BidTQxOqebpNk1rVsjs2sUJSTOZc"
                                                                 domain:@"http://www.ooyala.com"
                                                         viewController: [OptionsViewController class]]];
    [self insertNewObject: [[PlayerSelectionOption alloc] initWithTitle:@"Preload/Promo Image with HLS Video"
                                                              embedCode:@"Y1ZHB1ZDqfhCPjYYRbCEOz0GR8IsVRm1"
                                                                  pcode:@"c0cTkxOqALQviQIGAHWY5hP0q9gU"
                                                                 domain:@"http://www.ooyala.com"
                                                         viewController: [OptionsViewController class]]];
    [self insertNewObject: [[PlayerSelectionOption alloc] initWithTitle:@"Preload/Promo Image with InitialTime"
                                                              embedCode:@"Y1ZHB1ZDqfhCPjYYRbCEOz0GR8IsVRm1"
                                                                  pcode:@"c0cTkxOqALQviQIGAHWY5hP0q9gU"
                                                                 domain:@"http://www.ooyala.com"
                                                         viewController: [OptionsViewController class]]];
    PlayerSelectionOption *option = [[PlayerSelectionOption alloc] initWithTitle:@"HLS Video with timeout"
                                                                       embedCode:@"Y1ZHB1ZDqfhCPjYYRbCEOz0GR8IsVRm1"
                                                                           pcode:@"c0cTkxOqALQviQIGAHWY5hP0q9gU"
                                                                          domain:@"http://www.ooyala.com"
                                                                  viewController: [OptionsViewController class]];
    option.nib = @"PlayerDoubleText";
    [self insertNewObject: option];
    
    [self insertNewObject: [[PlayerSelectionOption alloc] initWithTitle:@"TV Ratings Configuration"
                                                              embedCode:@"c4eHZjcjqNetoCDCmzY_ApifO3qBuWpi"
                                                                  pcode:@"c0cTkxOqALQviQIGAHWY5hP0q9gU"
                                                                 domain:@"http://www.ooyala.com"
                                                         viewController: [TVRatingsPlayerViewController class]]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    UISwitch *swtLog = [[UISwitch alloc] init];
    [swtLog addTarget:self action:@selector(changeSwitch:) forControlEvents:UIControlEventValueChanged];
    UILabel *lblLog = [[UILabel alloc]  initWithFrame:CGRectMake(0,0,44,44)];
    [lblLog setText:@"QA"];
    UIBarButtonItem * btn = [[UIBarButtonItem alloc] initWithCustomView:swtLog];
    UIBarButtonItem * lbl = [[UIBarButtonItem alloc] initWithCustomView:lblLog];
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:btn,lbl, nil] ;
    [self.tableView registerNib:[UINib nibWithNibName:@"TableCell" bundle:nil]forCellReuseIdentifier:@"TableCell"];
    [self addAllPlayerSelectionOptions];
}

- (void)changeSwitch:(id)sender{
    if([sender isOn]){
        self.qaLogEnabled=YES;
    } else{
        self.qaLogEnabled=NO;
    }
    //  self.qaLogEnabled = [sender isOn];
}


- (void)insertNewObject:(PlayerSelectionOption *)selectionObject {
    if (!self.options) {
        self.options = [[NSMutableArray alloc] init];
    }
    [self.options insertObject:selectionObject atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.options.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableCell" forIndexPath:indexPath];
    
    PlayerSelectionOption *selection = self.options[indexPath.row];
    cell.textLabel.text = [selection title];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // When a row is selected, load its desired PlayerViewController
    PlayerSelectionOption *selection = self.options[indexPath.row];
    SampleAppPlayerViewController *controller = [(SampleAppPlayerViewController *)[[selection viewController] alloc] initWithPlayerSelectionOption:selection qaModeEnabled:self.qaLogEnabled];
    [self.navigationController pushViewController:controller animated:YES];
}

@end
