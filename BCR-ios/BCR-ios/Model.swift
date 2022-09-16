//
//  Model.swift
//  BCR-ios
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 11/09/2022.
//

import Foundation

class Model: Equatable {
    var resources: [Resource] = []
    
    private let myhardcodedResource: Resource = Resource(
        id: 1,
        title: "The Complete Guide to Breast Cancer",
        subtitle: "How to Feel Empowered and Take Control",
        description: "Authors: Professor Trisha Greenhalgh and Dr Liz O'Riordan. \nWritten by a breast cancer consultant oncologist and a GP who both got breast cancer themselves, this book was a fantastic resource. I found it more uselful than all the separate pamphlets (though I read all those too!) and found myself coming back to it over and over. Easy to read and digest, lots of great advice, information, underpinned by science and clinical guidence. Can't reccommend it enough.",
        picture: "https://images-eu.bookshop.org/images/9781785041877.jpg?height=500&v=v4-3235983ed5490ffaa516c5407fdb205b",
        link: URL(string: "https://uk.bookshop.org/books/the-complete-guide-to-breast-cancer-how-to-feel-empowered-and-take-control/9781785041877")!,
        tags: ["book"])
    
    init() {
        self.getResources()
    }
    
    private func getResources() {
        self.resources = [myhardcodedResource]
    }
    
    static func == (lhs: Model, rhs: Model) -> Bool {
        return lhs.resources == rhs.resources &&
        lhs.myhardcodedResource == rhs.myhardcodedResource
    }
}
