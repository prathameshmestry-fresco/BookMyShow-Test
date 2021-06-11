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
    weak var vc: ViewController?
    
    //MARK: API Call for Now Playing Movies
    func getMovieNowPlayingList() {
        let movieManager = MovieListManager()
        movieManager.getMovieList() { (response) in
            self.movieList = response
            self.vc?.movieList = self.movieList?.movieResult
            self.delegate?.didGetMovieListData()
        } errorCompletionHandler: { (error) in
            print("\(error?.localizedDescription ?? "")")
        }
    }
    
}
