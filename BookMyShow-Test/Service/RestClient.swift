//
//  RestClient.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import Foundation
import Alamofire

class RestClient {
    
    class func isConnectedToInternet() -> Bool {
        let manager = NetworkReachabilityManager(host: "www.apple.com")
        if let isReachable = manager?.isReachable, isReachable {
            return true
        }
        return false
    }
}
