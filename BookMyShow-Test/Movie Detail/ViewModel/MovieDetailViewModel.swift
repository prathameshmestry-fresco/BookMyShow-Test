//
//  MovieDetailViewModel.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import Foundation

protocol MovieDetailViewModelDelegate {
    func didGetMovieDetailsData()
}

class MovieDetailViewModel {
    
    enum Section {
        case synopsis,
             reviews,
             credits,
             similarMovies
    }
    
    var sections: [Section] = [.synopsis, .reviews, .credits, .similarMovies]
    var movieSynopsis: MovieSynopsisModel?
    var delegate: MovieDetailViewModelDelegate?

    func getMovieSynoposisData(id: Int) {
        let movieManager = MovieListManager()
        movieManager.getMovieSynopsisDetail(movieId: id) { (response) in
            self.movieSynopsis = response
            self.delegate?.didGetMovieDetailsData()
        } errorCompletionHandler: { (error) in
            debugPrint("\(error.debugDescription)")
        }

    }
}
