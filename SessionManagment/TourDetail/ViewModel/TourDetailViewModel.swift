//
//  TourDetailViewModel.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 2/21/24.
//

import Foundation

protocol TourDetailViewModelDelegate: AnyObject {
    func viewModel(_ viewModel: TourDetailViewModel, didSelectTour tour: Tour)
}
class TourDetailViewModel {
    
    @Published private(set) var titleText: String?
    @Published private(set) var reviewText: String?
    @Published private(set) var priceText: String?
    @Published private(set) var imageURL: URL?
    @Published private(set) var descriptionText: String?
    @Published private(set) var descriptionTextNumberOfLines: Int?
    @Published private(set) var isReadMoreButtonTapped: Bool = false
    @Published private(set) var isFavoriteButtonSelected: Bool = false
    
    /// Bindings
    @Published private(set) var title: String?
    
    private let serviceProvider: ServiceProvider
    private lazy var userDefaultsService = serviceProvider.userDefaultsService
    private let tour: NetworkingService.Tour
    weak var delegate: TourDetailViewModelDelegate?
    
    init(serviceProvider: ServiceProvider,
         tour: NetworkingService.Tour) {
        self.serviceProvider = serviceProvider
        self.tour = tour
        self.applyBindings()
    }
}

// MARK: Private Methods
private extension TourDetailViewModel {
    
    func applyBindings() {
        titleText = tour.name
        reviewText = "\(tour.rating)"
        priceText = "$\(tour.price)"
        imageURL = URL(string: tour.imageURL)
        descriptionText = tour.description
        descriptionTextNumberOfLines = 4
        validateFavorite()
    }
    
    func validateFavorite() {
        isFavoriteButtonSelected = userDefaultsService.validateTour(tour: tour)
    }
}

// MARK: Handler Methods
extension TourDetailViewModel {
    
    func handleReadMoreSelection() {
        isReadMoreButtonTapped = !isReadMoreButtonTapped
        descriptionTextNumberOfLines = isReadMoreButtonTapped ? 200 : 4
    }
    
    func handlerFavoriteButtonSelection() {
        
        if isFavoriteButtonSelected {
            userDefaultsService.removeTour(tour: tour)
            isFavoriteButtonSelected = false
        } else {
            userDefaultsService.addTour(tour: tour)
            isFavoriteButtonSelected = true
        }
    }
}
