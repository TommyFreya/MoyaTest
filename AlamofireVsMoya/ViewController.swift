//
//  ViewController.swift
//  AlamofireVsMoya
//
//  Created by Tommy on 15/11/27.
//  Copyright © 2015年 Tommy. All rights reserved.
//

import UIKit
//import Moya
import Alamofire
import SwiftyJSON
import ObjectMapper

class CommonInfo: Mappable {
    var data: AnyObject?
    var code: String!
    var msg: String?
    required init?(_ map: Map) {
    }
    func mapping(map: Map) {
        data      <-    map["data"]
        code      <-    map["code"]
        msg       <-    map["mgs"]
    }
}

class ProductModel: Mappable {
    var activityType: Int?
    var amountUse: String?
    var productDesc: String?
    var productPublisher: PublisherModel!
    required init?(_ map: Map) {
    }
    func mapping(map: Map) {
        activityType              <-    map["activityType"]
        amountUse              <-    map["amountUse"]
        productDesc            <-    map["productDesc"]
        productPublisher     <-    map["productPublisher"]
    }
}

class PublisherModel: Mappable {
    var age: Int?
    var userCode: String?
    var userMobile: String?
    var userId: String?
    required init?(_ map: Map) {
    }
    func mapping(map: Map) {
        age                <-    map["age"]
        userCode      <-    map["userCode"]
        userMobile   <-    map["userMobile"]
        userId            <-    map["userId"]
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //  services/wecube/user/msg/shareItem/INVEST_SHARE_ITEM
        Alamofire.request(.GET, kRequestServerKey + "services/creditor/product/list/page/2/0/0").responseJSON {
            response in
            if let value = response.result.value {
                print(value)
                let result = Mapper<CommonInfo>().map(value)
                let dataList = Mapper<ProductModel>().mapArray(result?.data?["result"])
                print("Alamofire = \(dataList?[0].productDesc)") // Alamofire = Optional("gfhgfgfhgshgdsfdshgfshfgh")
            }
        }
        
        MoyaTest.sharedInstance.requestDataWithTarget(.productList(pageSize: 2, curpage: 0, lastID: 0), type: ProductModel.self, successClosure: { result in
                let dataList = Mapper<ProductModel>().mapArray(result["result"])
                print("Moya = \(dataList?[0].productDesc)") // Moya = Optional("gfhgfgfhgshgdsfdshgfshfgh")
            }) { errorMsg in
                print(errorMsg)
        }
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

