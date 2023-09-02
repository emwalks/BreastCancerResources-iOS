//
//  Networking.swift
//  BCR-ios
//
//  Created by Emma Walker on 16/09/2022.
//

import Foundation
import SwiftUI

struct Networking {
    
    func fetchRemoteResources() async throws -> [Resource] {
        
        let url = URL(string:"https://emwalks.github.io/BreastCancerResourcesRemoteRepo/data/resources.json")!
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                let error = BCRError.invalidServerReponse
                print(error)
                throw error
            }
            
            guard let resources = try?
                    JSONDecoder().decode(Resources.self, from: data).data else {
                let error = BCRError.parsingError
                print(error.localizedDescription)
                print(error)
                throw error
            }
            
            return resources
        }
        
    }
    
}







