//
//  ListView.swift
//  BCR-ios
//
//  Created by Emma Walker on 16/09/2022.
//

import SwiftUI

struct ResourceListView: View {
    
    // TODO: this should be a view model
    var model = Model()
                
    var body: some View {
        NavigationView {
            List(model.resources) {
                resource in
                NavigationLink(resource.title,
                               destination: ResourceView(resource: resource))
            }
            .navigationTitle("Resources")
            .onAppear {
            }
            Text("Select a Resource")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ResourceListView()
    }
}
