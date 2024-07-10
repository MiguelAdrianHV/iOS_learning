//
//  LoginViewModel.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 11/22/23.
//

import Foundation

protocol LoginViewModelDelegate: AnyObject {
    func viewModel(_ viewModel: LoginViewModel, didRequestAlertWith alert: Alert)
    func viewModelSuccessfulSession(_ viewModel: LoginViewModel)
    func viewModelDisplayLoadingView(_ viewModel: LoginViewModel)
    func viewModelRemoveLoginView(_ viewModel: LoginViewModel)
}

class LoginViewModel {
    
    // Bindings
    @Published private(set) var isPerformLoginButtonEnabled: Bool = false
    
    private lazy var networkService = serviceProvider.networkService
    private(set) lazy var alertService = serviceProvider.alertsService
    private let serviceProvider: ServiceProvider
    
    private var email = ""
    private var password = ""
    
    weak var delegate:  LoginViewModelDelegate?
    
    init(serviceProvider: ServiceProvider) {
        self.serviceProvider = serviceProvider
    }
}

// MARK: - Private Methods
private extension LoginViewModel {
    
    func performLogin() {
        delegate?.viewModelDisplayLoadingView(self)
        let credentials = Credentials(email: email, password: password)
        networkService.performLogin(with: credentials)  { [weak self] result in
            guard let self else { return }
            self.delegate?.viewModelRemoveLoginView(self)
            if result {
                UserDefaults.standard.setValue(true, forKey: "isLogged")
                UserDefaults.standard.setValue(email, forKey: "userEmail")
                self.delegate?.viewModelSuccessfulSession(self)
            } else {
                self.displayErrorAlert()
            }
        }
    }
    
    func validateForm() {
        isPerformLoginButtonEnabled = email.count >= 0 && password.count >= 5
    }
    
    func displayErrorAlert() {
        let acceptAction = Alert.Action(title: "Aceptar", style: .default)
        let alert = Alert(titleKey: "Lo sentimos", messageKey: "Los datos ingresados no son correctos", acceptAction: acceptAction, cancelAction: nil)
        delegate?.viewModel(self, didRequestAlertWith: alert)
    }
}

// MARK: - Handler Methods
extension LoginViewModel {
    
    func handleDidEditEmailField(_ text: String) {
        email = text
        validateForm()
    }
    
    func handleDidEditPasswordField(_ text: String) {
        password = text
        validateForm()
    }
    
    func handlePerformButtonSelection() {
        if isPerformLoginButtonEnabled {
            performLogin()
        }
    }
}
