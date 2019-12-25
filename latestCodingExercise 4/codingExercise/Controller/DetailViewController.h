//
//  DetailViewController.h
//  codingExercise
//
//  Created by Ahsan Rizvi on 12/24/19.
//  Copyright © 2019 Macbook. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *price;
@property (nonatomic,strong) NSString *uId;
@property (nonatomic,strong) NSString *imageId;
@property (nonatomic,strong) NSString *imageUrl;
@property (nonatomic,strong) NSString *imageThumbnail;
@property (weak, nonatomic) IBOutlet UIImageView *itemfullimageview;
@property (weak, nonatomic) IBOutlet UIImageView *itemthumnailImgView;

@end

NS_ASSUME_NONNULL_END
