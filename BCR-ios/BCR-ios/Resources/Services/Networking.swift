//
//  Networking.swift
//  BCR-ios
//
//  Created by Emma Walker on 16/09/2022.
//

import Foundation
import SwiftUI

class Networking {
    
    var fetchedResources = [Resource]()
        
    func fetchRemoteResources() async throws -> [Resource] {
        
        let url = URL(string:"https://emwalks.github.io/BreastCancerResourcesRemoteRepo/data/resources.json")!
        
        URLSession.shared.dataTask(with: url) {  data, response, error in

            if let error = error {
                print(error)
            } else if let data = data {
                let decoder = JSONDecoder()

                do {
                    let resources = try decoder.decode(Resources.self, from: data).data
                    self.fetchedResources = resources
                    print(resources)
                } catch {
                    print("unable to decode resources")
                }
            }

        }.resume()
        return fetchedResources
        
    }
    
}







