//
//  ResourcesViewModel.swift
//  BCR-ios
//
//  Created by Emma Walker on 30/09/2022.
//

import Foundation

class ResourcesViewModel: ObservableObject  {
    
    let dataService: ResourceDataService
    @Published var resources: [Resource]
    
    init(dataService: ResourceDataService) {
        self.dataService = dataService
        resources = dataService.getResources()
    }
    
}
