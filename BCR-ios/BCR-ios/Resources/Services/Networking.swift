//
//  Networking.swift
//  BCR-ios
//
//  Created by Emma Walker on 16/09/2022.
//

import Foundation
import SwiftUI

struct Networking {
    
    let json = """
    {
        "data":[
        {
            "id": 1,
            "title": "The Complete Guide to Breast Cancer",
            "subtitle": "How to Feel Empowered and Take Control",
            "description": "Authors: Professor Trisha Greenhalgh and Dr Liz O'Riordan. Written by a breast cancer consultant oncologist and a GP who both got breast cancer themselves, this book was a fantastic resource. I found it more uselful than all the separate pamphlets (though I read all those too!) and found myself coming back to it over and over. Easy to read and digest, lots of great advice, information, underpinned by science and clinical guidence. Can't reccommend it enough.",
            "picture": "https://images-eu.bookshop.org/images/9781785041877.jpg?height=500&v=v4-3235983ed5490ffaa516c5407fdb205b",
            "link": "https://uk.bookshop.org/books/the-complete-guide-to-breast-cancer-how-to-feel-empowered-and-take-control/9781785041877",
            "tags":["book"]
        },
        {
            "id": 2,
            "title": "Moving Through Cancer: An Exercise and Strength-Training Program for the Fight of Your Life - Empowers Patients and Caregivers in 5 Steps",
            "description": "Authour: Kathryn Schmitz. This was a book which enabled me to feel empowered to exercise during treatment in a way that felt safe. Easy to read and understand with excellent scientific underpinning.",
            "picture": "https://images-us.bookshop.org/ingram/9781797210254.jpg?height=500&v=v2",
            "link": "https://www.movingthroughcancer.com/",
            "tags":["book"]
        },
        {
            "id": 3,
            "title": "You, Me and the Big C",
            "subtitle": "Putting the can in cancer",
            "description": "After I got diagnosed, I went right back to the first episode of this podcast and made my way through them all. Open, honest, frank conversations between people who know where you're at.",
            "picture": "https://ichef.bbci.co.uk/images/ic/320x320/p06bfy8j.jpg",
            "link": "https://www.bbc.co.uk/sounds/brand/p0608649",
            "tags":["podcast"]
        },
        {
            "id": 4,
            "title": "",
            "subtitle": "",
            "description": "",
            "picture": "",
            "link": "",
            "tags":[""]
        }
        ]
    }
""".data(using: .utf8)!
    
    // having a wee go using concurrancy
    // https://www.raywenderlich.com/28450876-beginning-networking-with-urlsession/lessons/2
    
    func fetchRemoteResources() async throws -> Resources {
        
        let localJSONParsing = try! JSONDecoder().decode(Resources.self, from: json)
        print(localJSONParsing)
        
        let url = URL(string:"https://emwalks.github.io/BreastCancerResourcesRemoteRepo/data/resources.json")!
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                let error = BCRError.invalidServerReponse
                print(error)
                throw error
            }
            
            
            // TODO: The response is being returned but I am getting a parsing error
            guard let resources = try?
                    JSONDecoder().decode(Resources.self, from: data) else {
                let error = BCRError.parsingError
                print(error.localizedDescription)
                print(error)
                throw error
            }
            
            return resources
        }
        
    }
    
}







