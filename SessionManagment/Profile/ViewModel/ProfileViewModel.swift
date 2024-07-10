//
//  ProfileViewModel.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 4/29/24.
//

import Foundation

protocol ProfileViewModelDelegate: AnyObject {
    func viewDidRequestLogout(_ viewModel: ProfileViewModel)
}

class ProfileViewModel {
    
    private let serviceProvider: ServiceProvider
    /// Bindings
    @Published private(set) var isLogged: Bool = false
    @Published private(set) var email: String?
    
    weak var delegate: ProfileViewModelDelegate?
    init(serviceProvider: ServiceProvider) {
        self.serviceProvider = serviceProvider
        self.applyBindings()
    }
}

// MARK: Private Methods
private extension ProfileViewModel {
    
    func applyBindings() {
        isLogged = UserDefaults.standard.bool(forKey: "isLogged")
        email = UserDefaults.standard.string(forKey: "userEmail")
    }
}

// MARK: Handler Methods
extension ProfileViewModel {
    
    func handleSwitchState(_ isOn: Bool) {
        isLogged = isOn
        UserDefaults.standard.setValue(false, forKey: "isLogged")
        UserDefaults.standard.removeObject(forKey: "userEmail")
        delegate?.viewDidRequestLogout(self)
    }
}

