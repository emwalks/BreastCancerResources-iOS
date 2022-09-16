//
//  Resource.swift
//  BCR-ios
//
//  Created by Emma Walker on 11/09/2022.
//

import Foundation

struct Resource: Hashable, Codable, Identifiable {
    var id: Int
    var title: String
    var subtitle: String?
    var description: String?
    var picture: String?
    var link: URL?
    var tags: [String]?
}
