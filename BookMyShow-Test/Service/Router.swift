//
//  Router.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import Foundation
import Alamofire

enum Router: URLRequestConvertible {
    
    case movieRouterHandler(MovieRouterProtocol)
    
    func asURLRequest() throws -> URLRequest {
        
        switch self {
        case .movieRouterHandler(let request):
            let urlRequest = configureRequest(request, isVersioned: true)
            return urlRequest
        }
    }
    
    func configureRequest(_ requestObj: RouterProtocol, isVersioned:Bool = true) -> URLRequest {
        
        var mutableURLRequest = getUrlRequestWithHeaders(requestObj.method.rawValue, path: requestObj.path, isVersioned: isVersioned)
        
        // Check if Request has Body defined
        
        if requestObj.method == Alamofire.HTTPMethod.post || requestObj.method == Alamofire.HTTPMethod.delete {
            // Request type is post/put -> check for request body
            
            let body:[String:Any] = [:]
            
            if body.count > 0 {
    
                do {
                    mutableURLRequest.httpBody = try JSONSerialization.data(withJSONObject: body, options: JSONSerialization.WritingOptions())
                } catch {
                    // No-op
                }
                
            }
            
        }
        
        // Check if Request has parameters defined
        let parameters:[String:Any] = [:]
        
        if parameters.count > 0 {
            
            print("\(parameters)")
            
            do{
                
                if requestObj.method == Alamofire.HTTPMethod.get {
                    return try Alamofire.URLEncoding.default.encode(mutableURLRequest as URLRequestConvertible, with: parameters)
                }
                
                return try Alamofire.JSONEncoding.default.encode(mutableURLRequest as URLRequestConvertible, with: parameters)
            }
            catch{
                print(error)
            }
            
        }
        
        return mutableURLRequest
    }
    
    func getUrlRequestWithHeaders(_ httpMethod: String, path: String, isVersioned:Bool = true) -> URLRequest {
        
        let url = URL(string: Constants.apiBaseUrl)!
        
        var mutableURLRequest = URLRequest(url: url.appendingPathComponent(path)) // Set request path
        mutableURLRequest.httpMethod = httpMethod // Set request method
        
        mutableURLRequest.setValue("application/json", forHTTPHeaderField:"Content-Type")
        //mutableURLRequest.timeoutInterval = Constants.serverTimeoutInterval
        
        
//        for header in headers {
//            mutableURLRequest.setValue(header.value, forHTTPHeaderField: header.HTTPHeaderField)
//        }
        
        if !Constants.mockApiKey.isEmpty {
            mutableURLRequest.setValue(Constants.mockApiKey, forHTTPHeaderField: "x-api-key")
        }
 
        return mutableURLRequest
    }
    
}
