//
//  PDViewController.m
//  PickingDesserts
//
//  Created by Sergio Perez on 9/27/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "PDViewController.h"

@interface PDViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) UILabel *dessertLabel;

@end

@implementation PDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPickerView *pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0,100, self.view.frame.size.width, 500)];
    
    pickerView.delegate = self;
    pickerView.dataSource = self;
    
    [self.view addSubview:pickerView];
    
}
    
#pragma mark - PickerView DataSource Methods
    
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
        
    return [[self data][component]count];
    
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return self.data.count;
}

#pragma mark - PickerView Delegate Methods


- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    self.dessertLabel.text = [NSString stringWithFormat:@"%@ %@ %@",
                         [self data][0][[pickerView selectedRowInComponent:0]],
                         [self data][0][[pickerView selectedRowInComponent:1]],
                         [self data][0][[pickerView selectedRowInComponent:2]]];
    
}

- (NSString *) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return self.data[component][row];
}

#pragma mark - Picker View Data Arrays

- (NSArray *)data {
    
    return @[
             [self fruits],
             [self liquids],
             [self desserts]
             ];
    
}

- (NSArray *)fruits {
    
    return @[@"banana",
             @"orange",
             @"apple"];
}

- (NSArray *)liquids {
    return @[@"milk",
             @"soda",
             @"coffee"];
}

- (NSArray *)desserts {
    return @[@"shake",
             @"sundae",
             @"cookie"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
