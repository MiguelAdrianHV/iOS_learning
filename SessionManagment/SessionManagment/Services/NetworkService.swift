//
//  NetworkService.swift
//  SessionManagment
//
//  Created by Miguel Hernandez on 11/22/23.
//

import Foundation

class NetworkService {
    
    func performLogin(with credentials: Credentials, completion: @escaping (Bool) -> Void) {
        
        if credentials.email == "mh0822@dexcom.com" && credentials.password == "12345" {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                completion(true)
            }
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                completion(false)
            }
        }
    }
}
