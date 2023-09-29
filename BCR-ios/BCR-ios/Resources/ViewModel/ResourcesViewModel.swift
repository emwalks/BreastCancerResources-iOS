//
//  ResourcesViewModel.swift
//  BCR-ios
//
//  Created by Emma Walker on 30/09/2022.
//
import SwiftUI
import Foundation

class ResourcesViewModel: ObservableObject  {
    
    let dataService: ResourceDataService
    @State var resources: [Resource]
    
    init(dataService: ResourceDataService) {
        self.dataService = dataService
        dataService.getResources()
        self.resources = dataService.resourcesData
    }
    
}
