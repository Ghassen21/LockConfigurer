//
//  LockConfigurationViewModel.swift
//  LockConfigurer
//
//  Created by Ghassen on 28.03.2024.
//

import Foundation

class LockConfigurationViewModel: ObservableObject{
    
    let apiService: LockConfigurationNetworkApiService = LockConfigurationNetworkApiService.shared
    @Published var lockConfigurationData: LockConfigurationModel?
    @Published var isLoading = true

    func fetchLockConfigurationData(){
        apiService.getLockData { result in
            switch result {
            case .success(let lockData):
                DispatchQueue.main.async{
                    //Upon receiving the data from the API call, assign it to the lockConfigurationData property.
                    print("LockConfigurationViewMode-fetchLockConfigurationData = \(lockData)")
                    self.lockConfigurationData = lockData
                    // Set the isLoading property to false after receiving the data from the server.
                    self.isLoading = false
                }
            case .failure(_):
                self.isLoading = false
            }
        }
    }
}
