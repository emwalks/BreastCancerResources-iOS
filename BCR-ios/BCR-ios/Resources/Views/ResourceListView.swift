//
//  ListView.swift
//  BCR-ios
//
//  Created by Emma Walker on 16/09/2022.
//

import SwiftUI

struct ResourceListView: View {
    
    // TODO: this gluing probably should not be done here
    var viewModel = ResourcesViewModel(dataService: HardcodedResourceDataService())
    
    // TODO: future feature - separate by tag type - e.g. filter and sort functionality
    var body: some View {
        NavigationView {
            List(viewModel.resources) {
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
