//
//  DashboardViewModel.swift
//  iOS_Grassdoor
//
//  Created by Ranjitha S on 02/08/22.
//

import Foundation
import Alamofire


class DashboardViewModel: ObservableObject,Identifiable {
    
    private let dashboardManager = DasboardManager()
    @Published var popularList:[Result]?
    @Published var topRatedList:[Movies]?
    
    func getPopularMovies(completion: @escaping(DashboardModel?, Int?) -> Void){
        self.dashboardManager.getMovieData()  {response, error in
            
            guard let obj = response else {
                completion(nil, error)
                return
            }
            self.getPopularMoviesData(popularListResponse: obj)
            completion(obj, error)
        }
    }
    
    
    func getPopularMoviesData(popularListResponse:DashboardModel?)  {
        popularList = popularListResponse?.results
        print(popularList)
    }
    
    func getTopRated(completion: @escaping(TopRatedMoviesModel?, Int?) -> Void){
        self.dashboardManager.getTopRatedMovieData()  { response, error in
            
            guard let obj = response else {
                completion(nil, error)
                return
            }
            self.getTopratedModelData(topRatedListResponse: obj)
            completion(obj, error)
        }
    }
    
    func getTopratedModelData(topRatedListResponse:TopRatedMoviesModel?)  {
        topRatedList = topRatedListResponse?.results
        print(topRatedList)
        
    }
}
