//
//  DetailViewController.m
//  codingExercise
//
//  Created by Ahsan Rizvi on 12/24/19.
//  Copyright © 2019 Macbook. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()


@property (weak, nonatomic) IBOutlet UILabel *priceLbl;
@property (weak, nonatomic) IBOutlet UILabel *dateLbl;
@property (weak, nonatomic) IBOutlet UILabel *uidLbl;
@property (weak, nonatomic) IBOutlet UILabel *imgIdLbl;



@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.priceLbl.text = self.price;
    self.navigationItem.title = self.name;
    self.dateLbl.text = self.date;
    self.uidLbl.text = self.uId;
    self.imgIdLbl.text = self.imageId;
    

 
    
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
