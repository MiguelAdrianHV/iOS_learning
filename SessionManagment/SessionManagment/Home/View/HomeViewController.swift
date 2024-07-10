//
//  ViewController.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 11/15/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private var collectionView: UICollectionView!
    
    private var bindings = Bindings()
    private lazy var animationViewController = AnimationViewController()
    var viewModel: HomeViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        
        guard viewModel != nil else {
            assertionFailure("viewModel is required for \(Self.self) to work")
            return
        }
        configureBindings()
        viewModel.handleViewDidLoad()
    }
}

// MARK: - Private Extensions
private extension HomeViewController {
    
    func configureView() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleDidRequestReload(notification:)), name: Notification.Name("didRequestReload"), object: nil)
    }
    
    func configureBindings() {
        viewModel.reloadData
            .sink{ [collectionView] in
                collectionView?.reloadData()
            }
            .store(in: &bindings)
    }
    
    func runTourDetail(with tour: NetworkingService.Tour) {
        let viewModel = TourDetailViewModel(serviceProvider: viewModel.serviceProvider, tour: tour)
        let viewController = TourDetailViewController.instantiate()
        viewController.viewModel = viewModel
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func displayAnimation() {
        UIView.animate(withDuration: 0.6, animations: { [weak self] in
            guard let self else { return }
            self.animationViewController.view.alpha = 1.0
        }) { [weak self] _ in
            guard let self else { return }
            addChild(self.animationViewController)
            view.addSubview(self.animationViewController.view)
            self.animationViewController.didMove(toParent: self)
        }
    }
    
    func removeAnimation() {
        UIView.animate(withDuration: 0.6, animations: { [weak self] in
            guard let self else { return }
            self.animationViewController.view.alpha = 0.0
        }) { [weak self] _ in
            guard let self else { return }
            self.animationViewController.willMove(toParent: nil)
            self.animationViewController.view.removeFromSuperview()
            self.animationViewController.removeFromParent()
        }
    }
}

// MARK: - Actions
private extension HomeViewController {
    @objc func handleDidRequestReload(notification: Notification) {
        viewModel.handleViewDidLoad()
    }
}

// MARK: - StoryboardIntitializable
extension HomeViewController: StoryboardInitializable {
    static let storyboardName = "Home"
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.totalSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cellViewModel = viewModel.cellViewModel(at: indexPath) else {
            return UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellViewModel.cellIdentifier, for: indexPath)
        if let configurable = cell as? CellViewModelConfigurable {
            configurable.configure(cellViewModel: cellViewModel)
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellViewModelSize = viewModel.cellViewModelSize(at: indexPath)
        return CGSize(width: view.frame.width, height: cellViewModelSize)
    }
}

// MARK: -
extension HomeViewController: HomeViewModelDelegate {
    func viewModelDisplayLoadingView(_ viewModel: HomeViewModel) {
        displayAnimation()
    }
    
    func viewModelRemoveLoginView(_ viewModel: HomeViewModel) {
        removeAnimation()
    }
    
    
    func viewModel(_ viewModel: HomeViewModel, didSelectTour tour: NetworkingService.Tour) {
        runTourDetail(with: tour)
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
}
