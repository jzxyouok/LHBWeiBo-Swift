//
//  StatusModel.swift
//  LHBWeibo
//
//  Created by LHB on 16/8/19.
//  Copyright © 2016年 LHB. All rights reserved.
//

import UIKit

class StatusModel: NSObject {
    //MARK: - 模型属性
    var created_at : String?///微博创建时间 (属性监听didSet封装到视图模型)
    /*
         {didSet{
         guard let createdAt = created_at else {
         return
         }
         //处理时间
         creatAtText = NSDate.createDateString(createdAt)
         }
         }
     */
    var source : String?  ///微博来源（didSet封装到视图模型）
    var text : String?      ///微博的正文
    var mid : Int = 0       ///微博的ID
    var user : UserModel?   ///微博对应的用户
    var pic_urls : [[String : String]]? //微博配图字典数组，key对应的value是String类型.?可能有值，也肯能没有值
    
    var retweeted_status : StatusModel?// 微博对应的转发微博
    
    
   
    


    //封装到视图模型里去了
//    //属性处理属性，像source属性，新浪返回source不能直接展示"source": "<a href="http://weibo.com" rel="nofollow">新浪微博</a>"，所以得用另一属性属性处理，上面做属性监听
//    var sourceText : String?
//    var creatAtText : String?
//    

    
   //自定义构造函数，用传过来的字典，创建模型对象
    init(dict : [String : AnyObject]) {
        super.init()
        setValuesForKeysWithDictionary(dict)
        
        //1、再把用户字典转成用户模型
        if let userDict = dict["user"] as? [String : AnyObject] {
            user = UserModel(dict: userDict)
        }
        //2、将转发微博字典转成转发微博模型对象
        if let retweetedStatusDict = dict["retweeted_status"] as? [String : AnyObject]{
            retweeted_status = StatusModel(dict: retweetedStatusDict)
        }
    }
    override init() {

    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
}
