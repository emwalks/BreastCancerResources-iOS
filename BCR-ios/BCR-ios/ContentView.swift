//
//  ContentView.swift
//  BCR-ios
//
//  Created by Emma Walker on 11/09/2022.
//

import SwiftUI

struct ContentView: View {
    
    var model = Model()
    
    var body: some View {
            NavigationView {
                // TitleOnlyLabelStyle("Select A Resource")
                List(model.resources) {
                    resource in
                    NavigationLink(resource.title, destination: ResourceView(id: resource.id))
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
