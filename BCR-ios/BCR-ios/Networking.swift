//
//  Networking.swift
//  BCR-ios
//
//  Created by Emma Walker on 16/09/2022.
//

import Foundation
import SwiftUI

struct Networking {
    // having a wee go using concurrancy
    // https://www.raywenderlich.com/28450876-beginning-networking-with-urlsession/lessons/2
    func fetchResources() async throws -> [Resource] {
        let url = URL(string:"https://emwalks.github.io/BreastCancerResourcesRemoteRepo/data/resources.json")!
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(Resources.self, from: data).data
    }
    
    func getResourcesTask() async {
        do {
            let resources = try await fetchResources()
            
            for (index, resource) in resources.enumerated() {
                let property = resource.attributes
                print("\(index + 1)) \(property.title): \(property.description ?? "no description found") - \(property.tags?[0] ?? "no tags found")")
            }
        } catch {
            print(error)
        }
    }
}




