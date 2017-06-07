//
//  MoyaTest.swift
//  AlamofireVsMoya
//
//  Created by Tommy on 15/11/27.
//  Copyright © 2015年 Tommy. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import ObjectMapper
import SwiftyJSON

typealias SuccessClosure = (result: AnyObject) -> Void
//typealias SuccessClosure = (result: Mappable) -> Void
typealias FailClosure = (errorMsg: String?) -> Void

enum RequestCode: String {
    case failError = "0"
    case success = "1"
}

class MoyaTest {
    static let sharedInstance = MoyaTest()
    private init(){}
    
    let requestProvider = RxMoyaProvider<RequestApi>()
    
    func requestDataWithTarget<T: Mappable>(target: RequestApi, type: T.Type , successClosure: SuccessClosure, failClosure: FailClosure) {
        let _ = requestProvider.request(target).subscribe { (event) -> Void in
            switch event {
            case .Next(let response):
                let info = Mapper<CommonInfo>().map(JSON(data: response.data,options: .AllowFragments).object)
                guard info?.code == RequestCode.success.rawValue else {
                    failClosure(errorMsg: info?.msg)
                    return
                }
                guard let data = info?.data else {
                    failClosure(errorMsg: "数据为空")
                    return
                }
                successClosure(result: data)
            case .Error(let error):
                print("网络请求失败...\(error)")
            default:
                break
            }
        }
    }
}


public enum RequestApi {
    //  UserApi
    case login(loginName: String, password: String)
    case register //(userMobile: String, password: String, inviteCode: String, verifyCode: String)
    //case accountInfo

    //  ProductApi
    case productList(pageSize: Int, curpage: Int, lastID: Int)
//    case productDetail(id: Int)
}

extension RequestApi: TargetType {
    public var baseURL: NSURL {
        return NSURL(string: "http://xxxxxx")!
    }
    
    public var path: String {
        switch self {
            case .login(_,_):
                return "services/crane/sso/login/doLogin"
            case .register:
                return "services/crane/sso/login/register"
            case let .productList(pageSize, curpage, lastID):
                return "services/creditor/product/list/page/"+String(pageSize)+"/"+String(curpage)+"/"+String(lastID)
        }
    }
    
    public var method: Moya.Method {
        switch self {
            case .login(_,_), .register:
                return .POST
            case .productList(_,_,_):
                return .GET
        }
    }
    
    public var parameters: [String: AnyObject]? {
        switch self {
            case let .login(loginName, password):
                return ["loginName": loginName, "userPassword": password]
            default :
                return nil
        }
    }
    
    //  单元测试用
    public var sampleData: NSData {
        return "{}".dataUsingEncoding(NSUTF8StringEncoding)!
    }
}

//let endpointClosure = { (target: RequestApi) -> Endpoint<RequestApi> in
//    let url = target.baseURL.URLByAppendingPathComponent(target.path).absoluteString
//    return Endpoint(URL: url, sampleResponseClosure: {.NetworkResponse(200, target.sampleData)}, method: target.method, parameters: target.parameters)
//}
//let RequestProvider = MoyaProvider(endpointClosure: endpointClosure)

extension Observable {
    
}




















