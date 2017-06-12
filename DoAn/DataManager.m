//
//  DataManager.m
//  DoAn
//
//  Created by nguyen anh thong on 6/12/17.
//  Copyright © 2017 nguyen anh thong. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager
+(DataManager *)dataManager
{
    static DataManager *dataManager;
    if (dataManager==nil)
    {
        dataManager=[[DataManager alloc] init];
    }
    return dataManager;
}
//Truyền vào chuỗi text để subsstring ra cái hình
-(NSString *)getImageWith:(NSString *)text
{
    NSRange viTriHinh=[text rangeOfString:@"src=\""];
    NSRange viTriCuoiHinh=[text rangeOfString:@".jpg\""];
    if (viTriCuoiHinh.location==NSNotFound)
    {
        viTriCuoiHinh=[text rangeOfString:@".png\""];
    }
    NSString *catChuoi1=[text substringToIndex:NSMaxRange(viTriCuoiHinh)-1];
    NSString *catChuoi2=[catChuoi1 substringFromIndex:NSMaxRange(viTriHinh)];
    return catChuoi2;
}
-(NSArray *)getItem:(NSDictionary *)dict
{
    NSDictionary *rss=[dict objectForKey:@"rss" ];
    NSDictionary *channel=[rss objectForKey:@"channel"];
    NSArray *item=[channel objectForKey:@"item"];
    return item;
}
-(NSString *)getText:(NSArray *)item viTri:(int )i
{
    NSDictionary *duLieu=item[i];
    NSDictionary *description=[duLieu objectForKey:@"description"];
    
    NSString *chuoi=[description objectForKey:@"text"];
    return chuoi;
}
-(NSString *)getTitleWith:(NSArray *)item viTri:(int)i
{
    NSDictionary *duLieu=item[i];
    NSDictionary *title=[duLieu objectForKey:@"title"];
    return [title objectForKey:@"text"];
}
-(NSString *)getLinkWith:(NSArray *)item viTri:(int)i
{
    NSDictionary *duLieu=item[i];
    NSDictionary *link=[duLieu objectForKey:@"link"];
    return [link objectForKey:@"text"];
}
@end
