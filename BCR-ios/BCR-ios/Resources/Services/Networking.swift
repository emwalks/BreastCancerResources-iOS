//
//  Networking.swift
//  BCR-ios
//
//  Created by Emma Walker on 16/09/2022.
//

import Foundation
import SwiftUI

public struct Networking {
        
    // having a wee go using concurrancy
    // https://www.raywenderlich.com/28450876-beginning-networking-with-urlsession/lessons/2
    func fetchResources() async throws -> [Resource] {
        let url = URL(string:"https://emwalks.github.io/BreastCancerResourcesRemoteRepo/data/resources.json")!
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw BCRError.invalidServerReponse
        }
        // TODO: The response is being returned but I am getting a parsing error
        guard let resources = try? JSONDecoder().decode(Resources.self, from: data).data else {
            throw BCRError.parsingError
        }
        return resources
    }
    
    
    enum BCRError: Error {
        case invalidServerReponse
        case parsingError
    }

}




