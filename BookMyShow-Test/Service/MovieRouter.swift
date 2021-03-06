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
    case getMovieImageCnfig
    
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
        case .getMovieImageCnfig:
            return "configuration"
            
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
        case .getMovieImageCnfig:
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
    
    //MARK:- API Functions for Get Movie List
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
    
    //MARK:- API Functions for Get Movie Synopsis Details
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
    
    //MARK:- API Functions for Get Movie Reviews Data
    func getMovieReviewsDetail(movieId: Int, successCompletionHandler : @escaping (_ response : MovieReviewsModel) -> Void, errorCompletionHandler : @escaping (_ error: Error?) -> Void) {
        
        if RestClient.isConnectedToInternet() {
            AF.request(Router.movieRouterHandler(MovieRouterProtocol.getMovieReviews(movieId))).response { response in
                if let data = response.data {
                    do {
                        let reviewResponse = try JSONDecoder().decode(MovieReviewsModel.self, from: data)
                        successCompletionHandler(reviewResponse)
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
    
    //MARK:- API Functions for Get Movie Credits Data
    func getMovieCreditDetail(movieId: Int, successCompletionHandler : @escaping (_ response : MovieCreditModel) -> Void, errorCompletionHandler : @escaping (_ error: Error?) -> Void) {
        
        if RestClient.isConnectedToInternet() {
            AF.request(Router.movieRouterHandler(MovieRouterProtocol.getMovieCredits(movieId))).response { response in
                if let data = response.data {
                    do {
                        let creditResponse = try JSONDecoder().decode(MovieCreditModel.self, from: data)
                        successCompletionHandler(creditResponse)
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
    
    //MARK:- API Functions for Get Similar Movies Detail
    func getSimilarMovieDetail(movieId: Int, successCompletionHandler : @escaping (_ response : SimilarMoviesModel) -> Void, errorCompletionHandler : @escaping (_ error: Error?) -> Void) {
        
        if RestClient.isConnectedToInternet() {
            AF.request(Router.movieRouterHandler(MovieRouterProtocol.getSimilarMovies(movieId))).response { response in
                if let data = response.data {
                    do {
                        let similarMovieResponse = try JSONDecoder().decode(SimilarMoviesModel.self, from: data)
                        successCompletionHandler(similarMovieResponse)
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
    
    //MARK:- API Functions for Get Image Configuration
    func getMovieImageConfiguration(successCompletionHandler : @escaping (_ response : MoviePosterImageModel) -> Void, errorCompletionHandler : @escaping (_ error: Error?) -> Void) {
        
        if RestClient.isConnectedToInternet() {
            AF.request(Router.movieRouterHandler(MovieRouterProtocol.getMovieImageCnfig)).response { response in
                if let data = response.data {
                    do {
                        let movieResponse = try JSONDecoder().decode(MoviePosterImageModel.self, from: data)
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
