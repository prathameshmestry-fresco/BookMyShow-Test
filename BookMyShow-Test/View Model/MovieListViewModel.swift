//
//  MovieListViewModel.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import Foundation

class MovieListViewModel {

    var movieList: MoviePlayingModel?

    func getMovieNowPlayingList() {
        let movieManager = MovieListManager()
        movieManager.getMovieList(params: <#T##[String : Any]#>) { (response) in
            self.movieList = response
        } errorCompletionHandler: { (error) in
            print("\(error?.localizedDescription)")
        }

        
    }
    
}
