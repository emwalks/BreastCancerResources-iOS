import Foundation
import SwiftUI

struct Resources: Decodable {
    let data: [Resource]
}

struct Resource: Decodable, Identifiable {
    var id: Int
    var title: String
    var subtitle: String?
    var description: String?
    var picture: String?
    var link: URL?
    var tags: [String]?
}


struct Networking {
    
    // having a wee go using concurrancy
    // https://www.raywenderlich.com/28450876-beginning-networking-with-urlsession/lessons/2
    
    func fetchRemoteResources() async throws -> [Resource] {
        
        let url = URL(string:"https://emwalks.github.io/BreastCancerResourcesRemoteRepo/data/resources.json")!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw BCRError.invalidServerReponse
        }
        // TODO: The response is being returned but I am getting a parsing error
        guard let resources = try?
                JSONDecoder().decode(Resources.self, from: data).data else {
            print(BCRError.parsingError.localizedDescription)
            throw BCRError.parsingError
        }
        return resources
    }
    
    
    enum BCRError: Error {
        case invalidServerReponse
        case parsingError
    }

}





