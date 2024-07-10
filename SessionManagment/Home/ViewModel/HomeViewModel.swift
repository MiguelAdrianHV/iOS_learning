//
//  HomeViewModel.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 11/22/23.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func viewModel(_ viewModel: HomeViewModel, didSelectTour tour: NetworkingService.Tour)
    func viewModelDisplayLoadingView(_ viewModel: HomeViewModel)
    func viewModelRemoveLoginView(_ viewModel: HomeViewModel)
}

class HomeViewModel {
    
    // A type to represent a section in the list
    struct Section {
        let title: String
        let buttonTitle: String
        let cellViewModel: CellViewModel
        
        init(title: String, buttonTitle: String, cellViewModel: CellViewModel) {
            self.title = title
            self.buttonTitle = buttonTitle
            self.cellViewModel = cellViewModel
        }
    }
    
    private lazy var networkRepository = serviceProvider.networkRepository
    private(set) var serviceProvider: ServiceProvider
    private lazy var userDefaultsService = serviceProvider.userDefaultsService
    let reloadData = Command<Void>()
    private var sections = [Section]()
    
    
    /// Bindings
    @Published private(set) var title: String?
    
    weak var delegate: HomeViewModelDelegate?
    
    init(serviceProvider: ServiceProvider, title: String? = nil) {
        self.serviceProvider = serviceProvider
        self.title = title
    }
}

//MARK: - Private Methods
private extension HomeViewModel {
    
    func generateCellViewModel(with data: [NetworkingService.Tour]) {
        
        var tours = [NetworkingService.Tour]()
        var destinations = [NetworkingService.Tour]()
        var restaurants = [NetworkingService.Tour]()
        
        for element in data {
            switch element.type.lowercased() {
            case Self.tour:
                tours.append(element)
            case Self.destinations:
                destinations.append(element)
            case Self.restaurant:
                restaurants.append(element)
            default:
                print("An unexpected value was found \(element.type)")
                
            }
        }
        
        let categories: [Category] = [
            Category(id: "1", title: "Location"),
            Category(id: "2", title: "Hotels"),
            Category(id: "3", title: "Food"),
            Category(id: "4", title: "Adventure")
        ]
        let categoryCellViewModel = CategoriesCellViewModel(serviceProvider: serviceProvider, categories: categories)
        let categorySection = Section(title: "Filters", buttonTitle: "", cellViewModel: categoryCellViewModel)
        
        let popularCellViewModel = ToursCellViewModel(serviceProvider: serviceProvider, tours: tours, titleText: "Destinations", buttonText: "")
        popularCellViewModel.delegate = self
        let popularSection = Section(title: "Popular", buttonTitle: "See All", cellViewModel: popularCellViewModel)
        
        let tourCellViewModel = ToursCellViewModel(serviceProvider: serviceProvider, tours: tours, titleText: "Tours", buttonText: "See All")
            tourCellViewModel.delegate = self
            let tourSection = Section(title: "Popular", buttonTitle: "", cellViewModel: tourCellViewModel)
        
        let recommendedViewModel = RecommendedToursCellViewModel(serviceProvider: serviceProvider, tours: restaurants)
        let recommendedSection = Section(title: "Recommended", buttonTitle: "", cellViewModel: recommendedViewModel)
        
        sections.append(categorySection)
        sections.append(popularSection)
        sections.append(tourSection)
        sections.append(recommendedSection)
        reloadData.send()
    }
    
    func requestTours() async {
        DispatchQueue.main.async {
            self.delegate?.viewModelDisplayLoadingView(self)
        }
        do {
            let data = try await networkRepository.fetchTours()
            DispatchQueue.main.async {
                self.delegate?.viewModelRemoveLoginView(self)
                self.generateCellViewModel(with: data)
            }
        } catch {
            DispatchQueue.main.async {
                self.delegate?.viewModelRemoveLoginView(self)
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: Public Methods
extension HomeViewModel {
    
    var totalSections: Int {
        return sections.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CellViewModel? {
        let indexSection = indexPath.section
        guard sections.indices.contains(indexSection) else {
            return nil
        }
        return sections[indexSection].cellViewModel
    }
    
    func cellViewModelSize(at indexPath: IndexPath) -> Double {
        let indexSection = indexPath.section
        guard sections.indices.contains(indexSection) else {
            return 0.0
        }
        
        if sections[indexSection].title == "Filters" {
            return 74.0
        } else  if sections[indexSection].title == "Popular"{
            return 274.0
        } else {
            return 210.0
        }
    }
}

// MARK: - Handler Methods
extension HomeViewModel {
    
    func handleViewDidLoad() {
        Task {
            await requestTours()
        }
    }
}


extension HomeViewModel: ToursCellViewModelDelegate {
    func viewModel(_ viewModel: ToursCellViewModel, didSelectTour tour: NetworkingService.Tour) {
        delegate?.viewModel(self, didSelectTour: tour)
    }
}


// MARK: - Constants
private extension HomeViewModel {
    static let tour = "tour"
    static let destinations = "destination"
    static let restaurant = "restaurant"
}
