//
//  DashboardManager.swift
//  iOS_Grassdoor
//
//  Created by Ranjitha S on 02/08/22.
//

import Foundation
import Alamofire

class DasboardManager: APIManager {
    
    func getMovieData(completion: @escaping(DashboardModel?, Int?) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=91cd96515a448997fd9eaa1c1fda456e&language=en-US&page=1"
        AF.request(url, method: .get).responseDecodable
        {[weak self]  (response: DataResponse<DashboardModel, AFError>) in
            guard let weakSelf = self else { return }
            guard let responseObj = weakSelf.handleResponse(response) as? DashboardModel else {
                completion(nil, response.response?.statusCode)
                return
            }
            completion(responseObj, response.response?.statusCode)
        }
    }
    
    func getTopRatedMovieData(completion: @escaping(TopRatedMoviesModel?, Int?) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/top_rated?api_key=91cd96515a448997fd9eaa1c1fda456e&language=en-US&page=1"
        AF.request(url, method: .get).responseDecodable
        {[weak self]  (response: DataResponse<TopRatedMoviesModel, AFError>) in
            guard let weakSelf = self else { return }
            guard let responseObj = weakSelf.handleResponse(response) as? TopRatedMoviesModel else {
                completion(nil, response.response?.statusCode)
                return
            }
            completion(responseObj, response.response?.statusCode)
        }
    }
}
