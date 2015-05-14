//
//  IndexViewControllerTableViewController.m
//  date_iOS
//
//  Created by BooleanMac on 15/5/13.
//  Copyright (c) 2015年 Boolean93. All rights reserved.
//

#import "IndexViewController.h"

@interface IndexViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) NSMutableArray *data;
@end

@implementation IndexViewController

-(void)viewWillAppear:(BOOL)animated{
    _data = [NSMutableArray arrayWithArray:
            @[@{
              @"nickname":@"Boolean93",
              @"avatarURL":@"http://202.202.43.41/market/public/img/home/select.png",
              @"subtitle":@"啊哈哈哈哈哈哈啊哈哈哈哈哈",
              @"gender":[NSNumber numberWithInt:1],
              @"content":@"约不约约不约约不约约不约约不约约不约约不约约不约约不约我们去约把!!!好好久没有约过了好桑心的!!!呜呜呜呜呜呜呜喵喵喵喵喵",
              @"address":@"老校门",
              @"date":@"今天晚上",
              @"price":@"10元",
             }]];
}

-(void)loadView{
    [super loadView];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _tableview.dataSource = self;
    _tableview.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"
                                                            forIndexPath:indexPath];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    }
    NSDictionary *dict = self.data[indexPath.row];
    __weak UIImageView *avatar = (UIImageView *)[tableView viewWithTag:1];
    UILabel *nickname = (UILabel *)[tableView viewWithTag:2];
    UIImageView *gender = (UIImageView *)[tableView viewWithTag:3];
    UILabel *subtitle = (UILabel *)[tableView viewWithTag:4];
    UITextView *content = (UITextView *)[tableView viewWithTag:5];
    UILabel *address = (UILabel *)[tableView viewWithTag:6];
    UILabel *date = (UILabel *)[tableView viewWithTag:7];
    UILabel *price = (UILabel *)[tableView viewWithTag:8];
    

    NSURL *avatarURL = [NSURL URLWithString:[dict objectForKey:@"avatarURL"]];
    [avatar setImageWithURLRequest:[[NSURLRequest alloc]initWithURL:avatarURL]
                  placeholderImage:[UIImage imageNamed:@"未标题-2"]
                           success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                               avatar.image = image;
                               NSLog(@"Succeed!");
                           }
                           failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                               NSLog(@"Failed to load pic.");
                           }];
    
    [avatar setImageWithURL:avatarURL placeholderImage:[UIImage imageNamed:@"未标题-2"]];
    avatar.layer.masksToBounds  = YES;
    avatar.layer.cornerRadius = avatar.frame.size.height / 2;
    
    //get the gender-icon
    if ([dict objectForKey:@"gender"] == [NSNumber numberWithInt:0]) {
        [gender setImage:[UIImage imageNamed:@"iconfont-boy"]];
    }else{
        [gender setImage:[UIImage imageNamed:@"iconfont-girl"]];
    }
    
    nickname.text = [dict objectForKey:@"nickname"];
    subtitle.text = [dict objectForKey:@"subtitle"];
    content.text = [dict objectForKey:@"content"];
    address.text = [dict objectForKey:@"address"];
    date.text = [dict objectForKey:@"date"];
    price.text = [dict objectForKey:@"price"];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
