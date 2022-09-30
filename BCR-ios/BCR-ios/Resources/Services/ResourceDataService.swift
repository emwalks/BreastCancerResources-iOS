//
//  ResourceDataService.swift
//  BCR-ios
//
//  Created by Emma Walker on 30/09/2022.
//

import Foundation

// TODO: Will likely have a remote data service (concurrency) and a local data service (caching)

protocol ResourceDataService {
    var resourcesData: [Resource] { get set }
    
    func getResources()
}
