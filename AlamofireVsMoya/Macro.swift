//
//  Macro.swift
//  AlamofireVsMoya
//
//  Created by Tommy on 15/11/27.
//  Copyright © 2015年 Tommy. All rights reserved.
//

import Foundation


let kRequestServerKey = "http://apptest.wecube.com:8080/taojinjia/"



//class CommonInfo: Mappable {
//    var data: AnyObject?
//    var code: String!
//    var msg: String?
//    required init?(_ map: Map) {
//    }
//    func mapping(map: Map) {
//        data      <-    map["data"]
//        code      <-    map["code"]
//        msg       <-    map["mgs"]
//    }
//}
//
//class ProductModel: Mappable {
//    var activityType: Int?
//    var amountUse: String?
//    var productDesc: String?
//    var productPublisher: PublisherModel!
//    required init?(_ map: Map) {
//    }
//    func mapping(map: Map) {
//        activityType            <-    map["activityType"]
//        amountUse              <-    map["amountUse"]
//        productDesc            <-    map["productDesc"]
//        productPublisher        <-    map["productPublisher"]
//    }
//}
//
//class PublisherModel: Mappable {
//    var age: Int?
//    var userCode: String?
//    var userMobile: String?
//    var userId: String?
//    required init?(_ map: Map) {
//    }
//    func mapping(map: Map) {
//        age            <-    map["age"]
//        userCode      <-    map["userCode"]
//        userMobile    <-    map["userMobile"]
//        userId         <-    map["userId"]
//    }
//}
//
//class ShareInfo: Mappable {
//    var title: String!
//    var imagePath: String?
//    var imageUrl: String?
//    var content: String?
//    var rowIdx: Int?
//    
//    required init?(_ map: Map) {
//    }
//    
//    // Mappable
//    func mapping(map: Map) {
//        title           <- map["title"]
//        imagePath    <- map["imagePath"]
//        imageUrl      <- map["imageUrl"]
//        content       <- map["content"]
//        rowIdx        <- map["rowIdx"]
//    }
//}


/**************************Argo****************************/
//import Argo
//import Curry
//
//struct CommonInfo {
//    let code: Int
//    let msg: String?
//    let data: String?
//}
//
//extension CommonInfo:Decodable {
//    static func decode(json: JSON) -> Decoded<CommonInfo> {
//        return curry(CommonInfo.init)
//            <^> json <|  "code"
//            <*> json <|?  "msg"
//            <*> json <|? "data"
//    }
//}
//
//struct ShareInfo {
//    let rowIdx: Int
//    let imagePath: String?
//    let content: String?
//}
//
//extension ShareInfo:Decodable {
//    static func decode(json: JSON) -> Decoded<ShareInfo> {
//        return curry(ShareInfo.init)
//            <^> json <|  "rowIdx"
//            <*> json <|?  "imagePath"
//            <*> json <|? "content"
//    }
//}