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
    
    enum Section: String {
        case synopsis = "Synopsis",
             reviews = "Reviews",
             credits = "Cast & Crew",
             similarMovies = "You might also like"
    }
    
    var sections: [Section] = [.synopsis, .reviews, .credits, .similarMovies]
    var movieSynopsis: MovieSynopsisModel?
    var movieReviews: MovieReviewsModel?
    var movieCredit: MovieCreditModel?
    var similarMovie: SimilarMoviesModel?
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
        movieManager.getMovieReviewsDetail(movieId: id) { (response) in
            self.movieReviews = response
            if (self.movieReviews?.results?.count == 0) {
                self.sections.remove(at: sectionIndex)
            }
            self.delegate?.didGetMovieDetailsData(index: sectionIndex)
        } errorCompletionHandler: { (error) in
            debugPrint("\(error.debugDescription)")
        }
    }
    
    func getMovieCreditData(id: Int, sectionIndex: Int) {
        let movieManager = MovieListManager()
        movieManager.getMovieCreditDetail(movieId: id) { (response) in
            self.movieCredit = response
            if (self.movieCredit?.cast?.count == 0) {
                self.sections.remove(at: sectionIndex)
            }
            self.delegate?.didGetMovieDetailsData(index: sectionIndex)
        } errorCompletionHandler: { (error) in
            debugPrint("\(error.debugDescription)")
        }
    }
    
    func getSimilarMovieData(id: Int, sectionIndex: Int) {
        let movieManager = MovieListManager()
        movieManager.getSimilarMovieDetail(movieId: id) { (response) in
            self.similarMovie = response
            if (self.similarMovie?.results?.count == 0) {
                self.sections.remove(at: sectionIndex)
            }
            self.delegate?.didGetMovieDetailsData(index: sectionIndex)
        } errorCompletionHandler: { (error) in
            debugPrint("\(error.debugDescription)")
        }
    }
}
