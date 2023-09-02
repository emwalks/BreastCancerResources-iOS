//
//  ResourceModel.swift
//  BCR-ios
//
//  Created by Emma Walker on 11/09/2022.
//

import Foundation

struct HardcodedResources {
    
    private let myHardcodedResourceAttributes: Resource
    private let mySecondHardcodedResourceAttributes: Resource
    let resources: [Resource]
    
    init() {
        self.myHardcodedResourceAttributes = Resource(
            id: 1, title: "The Complete Guide to Breast Cancer",
            subtitle: "How to Feel Empowered and Take Control",
            content: "Authors: Professor Trisha Greenhalgh and Dr Liz O'Riordan. \nWritten by a breast cancer consultant oncologist and a GP who both got breast cancer themselves, this book was a fantastic resource. I found it more uselful than all the separate pamphlets (though I read all those too!) and found myself coming back to it over and over. Easy to read and digest, lots of great advice, information, underpinned by science and clinical guidence. Can't reccommend it enough.",
            picture: "https://images-eu.bookshop.org/images/9781785041877.jpg?height=500&v=v4-3235983ed5490ffaa516c5407fdb205b",
            link: "https://uk.bookshop.org/books/the-complete-guide-to-breast-cancer-how-to-feel-empowered-and-take-control/9781785041877",
            tags: ["book"])
        
        self.mySecondHardcodedResourceAttributes = Resource(
            id: 2, title: "You, Me and the Big C",
            subtitle: "Putting the can in cancer",
            content: "After I got diagnosed, I went right back to the first episode of this podcast and made my way through them all. Open, honest, frank conversations between people who know where you're at.",
            picture: "https://ichef.bbci.co.uk/images/ic/320x320/p06bfy8j.jpg",
            link: "https://www.bbc.co.uk/sounds/brand/p0608649",
            tags: ["podcast"])
        self.resources = [myHardcodedResourceAttributes, mySecondHardcodedResourceAttributes]
    }
    
}
