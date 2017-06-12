//
//  DataManager.h
//  DoAn
//
//  Created by nguyen anh thong on 6/12/17.
//  Copyright © 2017 nguyen anh thong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject
+(DataManager *) dataManager;
-(NSString *)getImageWith:(NSString *)text;
-(NSString *)getTitleWith:(NSArray *)item viTri:(int)i;
-(NSString *)getLinkWith:(NSArray *)item viTri:(int)i;

-(NSArray *)getItem:(NSDictionary *)dict;
-(NSString *)getText:(NSArray *)item viTri:(int )i;
@end
