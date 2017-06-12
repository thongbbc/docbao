//
//  ActivityRead.m
//  DoAn
//
//  Created by nguyen anh thong on 6/12/17.
//  Copyright © 2017 nguyen anh thong. All rights reserved.
//

#import "ActivityRead.h"
#import "TFHpple.h"
#import "TFHppleElement.h"
@interface ActivityRead ()
{
    NSString *noiDung;
}
@end

@implementation ActivityRead

- (void)viewDidLoad {
    [super viewDidLoad];
    noiDung=@"";
    NSURL *url = [NSURL URLWithString:self.link];
    NSData *HtmlData = [NSData dataWithContentsOfURL:url];
    TFHpple *Parser = [TFHpple hppleWithHTMLData:HtmlData];
    
    NSString *XpathQueryString = @"//div[@class='wrapper detail ']/section/section/div[@class='detail-content']/div[@class='left-side']/div[@class='fck ']/p";
    
    NSArray *Nodes = [Parser searchWithXPathQuery:XpathQueryString];
   // NSLog(@"%@",Nodes);
    for (TFHppleElement *element in Nodes)
    {
        noiDung=[NSString stringWithFormat:@"%@\n%@",noiDung,element.content];
        NSLog(@"%@",element.content);
    }
    self.txtNoiDung.text=noiDung;
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
