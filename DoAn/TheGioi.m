//
//  TheGioi.m
//  DoAn
//
//  Created by nguyen anh thong on 6/12/17.
//  Copyright © 2017 nguyen anh thong. All rights reserved.
//

#import "TheGioi.h"
#import "DataManager.h"
#import "ActivityRead.h"
#import "XMLReader.h"
#import "CellBao.h"
@interface TheGioi ()
{
    NSMutableArray *dsTitle,*dsHinh,*dsLink;
    DataManager *dataManager;
    NSDictionary *dict;
    NSInteger index;
}
@end

@implementation TheGioi

- (void)viewDidLoad {
    [super viewDidLoad];
    
       
    
    index=0;
    dsTitle=[[NSMutableArray alloc] init];
    dsHinh=[[NSMutableArray alloc] init];
    dsLink=[[NSMutableArray alloc] init];
    
    NSURL *url=[[NSURL alloc] initWithString:@"http://tuoitre.vn/rss/tt-the-gioi.rss"];
    NSData *data=[[NSData alloc] initWithContentsOfURL:url];
    NSError *error = nil;
    dict=[XMLReader dictionaryForXMLData:data error:&error];
    dataManager=[DataManager dataManager];
    
    NSArray *dsItem=[dataManager getItem:dict];
    for (int i=0;i<dsItem.count;i++){
        NSString *text=[dataManager getText:dsItem viTri:i];
        NSString *title=[dataManager getTitleWith:dsItem viTri:i];
        [dsTitle addObject:title];
        [dsHinh addObject:[dataManager getImageWith:text]];
        [dsLink addObject:[dataManager getLinkWith:dsItem viTri:i]];
    }
    
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return dsHinh.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CellBao *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell2" forIndexPath:indexPath];
    NSData *data=[NSData dataWithContentsOfURL:[NSURL URLWithString:dsHinh[indexPath.row]]];
    cell.imgHinh.image=[UIImage imageWithData:data];
    cell.lbl_title.text=dsTitle[indexPath.row];
    
    UIView* shadowView = [cell viewWithTag:99];
    shadowView.backgroundColor=[UIColor colorWithRed:255 green:255 blue:255 alpha:0.5];
    [shadowView.layer setCornerRadius:10.0f];
    /*[shadowView.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [shadowView.layer setBorderWidth:0.1f];
    [shadowView.layer setShadowColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1.0].CGColor];
    [shadowView.layer setShadowOpacity:1.0];
    [shadowView.layer setShadowRadius:1.0];
    [shadowView.layer setShadowOffset:CGSizeMake(5.0f, 5.0f)];*/
    
    
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width/2 -10, 200);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //index=indexPath.row;
}
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    index=indexPath.row;
    return TRUE;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath;
    indexPath = [self.collection indexPathForItemAtPoint:[self.collection convertPoint:[sender center] fromView:[sender superview]]];

    if ([segue.identifier isEqualToString:@"segueDoc"])
    {
        ActivityRead *ui=[segue destinationViewController];
        ui.link=dsLink[indexPath.row];
    }
}


@end
