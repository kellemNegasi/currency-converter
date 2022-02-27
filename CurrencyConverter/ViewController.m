//
//  ViewController.m
//  CurrencyConverter
//
//  Created by kellem negasi on 2/27/22.
//

#import "ViewController.h"
#import "CurrencyRequest/CRCurrencyRequest.h"
#import "CurrencyRequest/CRCurrencyResults.h"


@interface ViewController ()<CRCurrencyRequestDelegate>
@property(nonatomic) CRCurrencyRequest *req;
@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *convertButton;
@property (weak, nonatomic) IBOutlet UILabel *currency1;
@property (weak, nonatomic) IBOutlet UILabel *currency2;
@property (weak, nonatomic) IBOutlet UILabel *currency3;

@end

@implementation ViewController
- (IBAction)buttonTapped:(id)sender {
    self.req = [[CRCurrencyRequest alloc] init];
    self.req.delegate=self;
    [self.req start];
    self.convertButton.enabled=NO;
    self.currency1.text=@"0.00";
    self.currency2.text=@"0.00";
    self.currency3.text=@"0.00";
   
}
- (void)currencyRequest:(CRCurrencyRequest *)req
    retrievedCurrencies:(CRCurrencyResults *)currencies{
    self.convertButton.enabled=YES;
    double inputValue = [self.inputField.text floatValue];
    double euro = inputValue*currencies.EUR;
    double yen = inputValue*currencies.JPY;
    double gbp = inputValue*currencies.GBP;
    NSString *formatedEuro = [NSString stringWithFormat:@"%.2f",euro];
    NSString *formatedYen = [NSString stringWithFormat:@"%.2f",yen];
    NSString *formatedGBP = [NSString stringWithFormat:@"%.2f",gbp];
    self.currency1.text=formatedEuro;
    self.currency2.text= formatedYen;
    self.currency3.text= formatedGBP;

    
    
}
@end
