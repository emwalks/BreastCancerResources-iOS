//
//  Resources.swift
//  BCR-ios
//
//  Created by Emma Walker on 16/09/2022.
//

import Foundation

public struct Resources: Decodable {
    public let data: [Resource]
}

public struct Resource: Decodable, Identifiable {
    public let attributes: Attributes
    public var id: UUID
}

public struct Attributes: Decodable {
    var title: String
    var subtitle: String?
    var description: String?
    var picture: String?
    var link: URL?
    var tags: [String]?
}
