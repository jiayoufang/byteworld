//
//  JYWaterFallViewController.m
//  ByteWorld
//
//  Created by 方 on 15/3/31.
//  Copyright (c) 2015年 方. All rights reserved.
//

#import "JYWaterFallViewController.h"
#import "JYWaterFallCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "JYWaterFallFlowLayout.h"
#import "UIImage+MultiFormat.h"

static NSString *identifier = @"collectview";

@interface JYWaterFallViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property(nonatomic,strong) NSMutableArray *imgArray;
@property(nonatomic,strong) UICollectionView *collectionView;
@end

@implementation JYWaterFallViewController

-(NSMutableArray*)imgArray
{
    if (!_imgArray) {
        _imgArray = [[NSMutableArray alloc]init];
    }
    return _imgArray;
}

-(UICollectionView*)collectionView
{
    if (!_collectionView) {
        JYWaterFallFlowLayout *flowLayout = [[JYWaterFallFlowLayout alloc]init];
        _collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        //注册单元格
        [_collectionView registerClass:[JYWaterFallCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    }
    return _collectionView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    NSArray *array = @[@"http://h.hiphotos.baidu.com/news/q%3D100/sign=4e1bd173237f9e2f763519082f31e962/6a63f6246b600c3368d4bd5d1e4c510fd8f9a1f2.jpg",@"http://h.hiphotos.baidu.com/news/q%3D100/sign=090270170b2442a7a80ef9a5e142ad95/9f2f070828381f307e77c73dad014c086e06f03c.jpg",@"http://b.hiphotos.baidu.com/news/q%3D100/sign=856d9cbad61b0ef46ae89c5eedc551a1/b8014a90f603738d88d8d8b6b71bb051f919ec90.jpg",@"http://h.hiphotos.baidu.com/news/q%3D100/sign=1cc7894e11ce36d3a40487300af23a24/e4dde71190ef76c6e09d8ebf9916fdfaae5167d2.jpg",@"http://news.baidu.com/z/resource/r/image/2015-03-31/eddd9ad8983a228105d5252e94614a6a.jpg",@"http://t11.baidu.com/it/u=http://img.21sq.org/uploadfile/cover/201503310754308033.jpg&fm=36",@"http://f.hiphotos.baidu.com/news/pic/item/203fb80e7bec54e7339a588abd389b504fc26a2b.jpg",@"http://a.hiphotos.baidu.com/news/pic/item/a08b87d6277f9e2faba04f9c1b30e924b999f389.jpg",@"http://h.hiphotos.baidu.com/news/pic/item/0824ab18972bd40740a68e697f899e510eb309c4.jpg",@"http://g.hiphotos.baidu.com/news/pic/item/43a7d933c895d143cee255b777f082025baf0789.jpg",@"http://d.hiphotos.baidu.com/news/q=100/sign=c333ee2461380cd7e01ea6ed9145ad14/e1fe9925bc315c6047e57a7b89b1cb1349547735.jpg"];
    
//    [self.imgArray addObjectsFromArray:array];
    for (int i = 0; i<6; i++) {
        UIImage  *image = [UIImage imageNamed:[NSString stringWithFormat:@"huoying%d",i+1]];
        [self.imgArray addObject:image];
    }
    
    [self.view addSubview:self.collectionView];
    
//    UIImageView *imageView
    
}

#pragma mark-UICollection datasource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imgArray.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JYWaterFallCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[JYWaterFallCollectionViewCell alloc]init];
    }
    
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.imgArray[indexPath.row]]];
    [cell.imageView setImage:self.imgArray[indexPath.row]];
    cell.label.text = [NSString stringWithFormat:@"cell_%zd",indexPath.row];
    
//    cell.image = [UIImage im]
//    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.imgArray[indexPath.row]]] queue:NSOperationQueuePriorityNormal completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        if (connectionError) {
//            NSLog(@"error = %@",[connectionError description]);
//        }else{
//            NSLog(@"正常");
//        }
//        dispatch_async(dispatch_get_main_queue(), ^{
//            cell.image = [UIImage imageWithData:data];
//        });
//    }];
//    cell.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.imgArray[indexPath.row]]]];
    return cell;
}
- (float)imgHeight:(float)height width:(float)width{
    /*
     高度/宽度 = 压缩后高度/压缩后宽度（100）
     */
    float newHeight = height / width * 100;
    return newHeight;
}
#pragma mark - UICollectionView delegate flowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    UIImage *image = [UIImage sd_imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.imgArray[indexPath.item]]]];;
    UIImage *image = self.imgArray[indexPath.row];
    float height = [self imgHeight:image.size.height width:image.size.width];
    return CGSizeMake(100, height);
    
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    UIEdgeInsets edgeInsets = {5,5,5,5};
    return edgeInsets;
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
