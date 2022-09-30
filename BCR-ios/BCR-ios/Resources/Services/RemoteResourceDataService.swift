//
//  RemoteResourceDataService.swift
//  BCR-ios
//
//  Created by Emma Walker on 30/09/2022.
//

import Foundation

class RemoteResourceDataService: ResourceDataService {
    var networkingService = Networking()
    var resourcesData: [Resource] = []
    
        func fetchFromRemote() async throws {
            guard let result = try? await networkingService.fetchRemoteResources() else {
                throw BCRError.dataServiceError
            }
            self.resourcesData = result
        }
    
    func getResources() -> [Resource] {
        return resourcesData
    }
}
