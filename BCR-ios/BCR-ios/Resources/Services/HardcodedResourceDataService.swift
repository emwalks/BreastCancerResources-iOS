//
//  ResourceDataService.swift
//  BCR-ios
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 30/09/2022.
//

import Foundation

class HardcodedResourceDataService: ResourceDataService {
    var resourcesData = HardcodedResources().resources
    
    func getResources() -> [Resource] {
        return resourcesData
    }
    
}
