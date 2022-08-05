//
//  NetworkVC.swift
//  iOS_Grassdoor
//
//  Created by Ranjitha S on 02/08/22.
//

import Foundation
import Alamofire

class APIManager {
    var statusCode = Int.zero
    func handleResponse<T: Decodable>(_ response: DataResponse<T, AFError>) -> Any? {
        switch response.result {
        case .success:
            return response.value
        case .failure:
            return response.error
        }
    }
    
    
}
