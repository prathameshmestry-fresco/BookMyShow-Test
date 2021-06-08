//
//  MovieRouter.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import Foundation
import Alamofire

enum MovieRouterProtocol: RouterProtocol {
    
    case getMovieList
    case getMovieSynopsis(Int)
    case getMovieReviews(Int)
    case getMovieCredits(Int)
    case getSimilarMovies(Int)
    
    var path: String {
        switch self {
        
        case .getMovieList:
            return "movie/now_playing"
        case .getMovieSynopsis(let movieId):
            return "movie/\(movieId)"
        case .getMovieReviews(let movieId):
            return "movie/\(movieId)/reviews"
        case .getMovieCredits(let movieId):
            return "movie/\(movieId)/credits"
        case .getSimilarMovies(let movieId):
            return "movie/\(movieId)/similar"
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        
        case .getMovieList:
            return .get
        case .getMovieSynopsis(_):
            return .get
        case .getMovieReviews(_):
            return .get
        case .getMovieCredits(_):
            return .get
        case .getSimilarMovies(_):
            return .get
        }
    }
    
    var parameters : Any? {
        switch self {
        default:
            return nil
        }
    }
    
    var body: Any? {
        switch self {
        default:
            return nil
        }
    }
}


class MovieListManager {
    
    //MARK:- API Functions
    func getMovieList(successCompletionHandler : @escaping (_ response : MoviePlayingModel) -> Void, errorCompletionHandler : @escaping (_ error: Error?) -> Void) {
        
        if RestClient.isConnectedToInternet() {
            AF.request(Router.movieRouterHandler(MovieRouterProtocol.getMovieList)).response { response in
                if let data = response.data {
                    do {
                        let movieResponse = try JSONDecoder().decode(MoviePlayingModel.self, from: data)
                        successCompletionHandler(movieResponse)
                    }
                    catch let error {
                        print(error.localizedDescription)
                    }
                }
            }
        } else {
            debugPrint("No Internet Connection")
        }
    }
    
    func getMovieSynopsisDetail(movieId: Int, successCompletionHandler : @escaping (_ response : MovieSynopsisModel) -> Void, errorCompletionHandler : @escaping (_ error: Error?) -> Void) {
        
        if RestClient.isConnectedToInternet() {
            AF.request(Router.movieRouterHandler(MovieRouterProtocol.getMovieSynopsis(movieId))).response { response in
                if let data = response.data {
                    do {
                        let movieResponse = try JSONDecoder().decode(MovieSynopsisModel.self, from: data)
                        successCompletionHandler(movieResponse)
                    }
                    catch let error {
                        print(error.localizedDescription)
                    }
                }
            }
        } else {
            debugPrint("No Internet Connection")
        }
    }
    
    func getMovieReviewsDetail(movieId: Int, successCompletionHandler : @escaping (_ response : MovieReviewsModel) -> Void, errorCompletionHandler : @escaping (_ error: Error?) -> Void) {
        
        if RestClient.isConnectedToInternet() {
            AF.request(Router.movieRouterHandler(MovieRouterProtocol.getMovieReviews(movieId))).response { response in
                if let data = response.data {
                    do {
                        let movieResponse = try JSONDecoder().decode(MovieReviewsModel.self, from: data)
                        successCompletionHandler(movieResponse)
                    }
                    catch let error {
                        print(error.localizedDescription)
                    }
                }
            }
        } else {
            debugPrint("No Internet Connection")
        }
    }
}
