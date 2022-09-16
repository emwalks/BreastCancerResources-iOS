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
        let (data, _) = try await URLSession.shared.data(from: url)
        
        return try JSONDecoder().decode(Resources.self, from: data).data
    }

}




