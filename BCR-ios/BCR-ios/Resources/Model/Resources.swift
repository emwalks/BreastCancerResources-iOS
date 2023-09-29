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
    var id = UUID()
    var title: String
    var subtitle: String?
    var content: String?
    var picture: String?
    var link: String?
    var tags: [String]?
}
