//
//  KinhTe.h
//  DoAn
//
//  Created by nguyen anh thong on 6/12/17.
//  Copyright © 2017 nguyen anh thong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KinhTe : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collection;


@end
