//
//  Resources.swift
//  BCR-ios
//
//  Created by Emma Walker on 16/09/2022.
//

import Foundation

struct Resources: Decodable {
    var data: [Resource]
}

struct Resource: Decodable, Identifiable {
    var id: Int
    var title: String
    var subtitle: String?
    var description: String?
    var picture: String?
    var link: String?
    var tags: [String]?
}
