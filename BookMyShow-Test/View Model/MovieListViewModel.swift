//
//  MovieListViewModel.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import Foundation

protocol MovieListViewModelDelegate {
    func didGetMovieListData()
}

class MovieListViewModel {

    var movieList: MoviePlayingModel?
    var delegate: MovieListViewModelDelegate?

    func getMovieNowPlayingList() {
        let movieManager = MovieListManager()
        movieManager.getMovieList() { (response) in
            self.movieList = response
            self.delegate?.didGetMovieListData()
        } errorCompletionHandler: { (error) in
            print("\(error?.localizedDescription ?? "")")
        }
    }
    
}
