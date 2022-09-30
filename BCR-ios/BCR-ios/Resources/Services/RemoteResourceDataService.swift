//
//  RemoteResourceDataService.swift
//  BCR-ios
//
//  Created by Emma Walker on 30/09/2022.
//

import Foundation
import SwiftUI

class RemoteResourceDataService: ResourceDataService, ObservableObject {
    var networkingService = Networking()
    @Published var resourcesData: [Resource] = []
    
    @MainActor
    func fetchFromRemote() async throws {
        guard let result = try? await networkingService.fetchRemoteResources() else {
            let error = BCRError.dataServiceError
            print(error)
            throw error
        }
        self.resourcesData = result
    }
    
    func getResources() -> [Resource] {
        Task {
            try? await fetchFromRemote()
        }
        return resourcesData
    }
}
