//
//  RouterProtocol.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import Foundation
import Alamofire

protocol RouterProtocol {
    
    var path: String { get }
    
    var method: Alamofire.HTTPMethod { get }
    
    var parameters: Any? { get }
    
    var  body: Any? { get }
}
