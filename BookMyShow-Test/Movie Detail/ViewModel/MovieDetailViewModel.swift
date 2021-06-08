//
//  MovieDetailViewModel.swift
//  BookMyShow-Test
//
//  Created by Prathamesh Mestry on 04/06/21.
//

import Foundation

protocol MovieDetailViewModelDelegate {
    func didGetMovieDetailsData(index: Int)
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
    var movieReviews: MovieReviewsModel?
    var delegate: MovieDetailViewModelDelegate?

    func getMovieSynoposisData(id: Int, sectionIndex: Int) {
        let movieManager = MovieListManager()
        movieManager.getMovieSynopsisDetail(movieId: id) { (response) in
            self.movieSynopsis = response
            self.delegate?.didGetMovieDetailsData(index: sectionIndex)
        } errorCompletionHandler: { (error) in
            debugPrint("\(error.debugDescription)")
        }
    }
    
    func getMovieReviewsData(id: Int, sectionIndex: Int) {
        let movieManager = MovieListManager()
        movieManager.getMovieSynopsisDetail(movieId: id) { (response) in
            self.movieSynopsis = response
            self.delegate?.didGetMovieDetailsData(index: sectionIndex)
        } errorCompletionHandler: { (error) in
            debugPrint("\(error.debugDescription)")
        }
    }
}
