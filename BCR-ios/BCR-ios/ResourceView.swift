//
//  ResourceView.swift
//  BCR-ios
//
//  Created by Emma Walker on 11/09/2022.
//

import SwiftUI

struct ResourceView: View {
    
    init(resource: Resource) {
        self.resource = resource
    }
    
    let resource: Resource
    
    let defaultText = "Default Text"
    
    var body: some View {
        List {
            HStack {
                if (resource.attributes.picture != nil) {
                    Spacer()
                    AsyncImage(url: URL(string: resource.attributes.picture!)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .cornerRadius(8)
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    Spacer()
                }
            }
            Text("\(resource.attributes.title)").font(.title2)
            if (resource.attributes.subtitle != nil) {
                Text("\(resource.attributes.subtitle ?? defaultText)")
                    .font(.title3)
            }
            if (resource.attributes.description != nil) {
                Text("\(resource.attributes.description ?? defaultText)")
                    .font(.body)
            }
            if (resource.attributes.link != nil) {
                Link("\((resource.attributes.link ?? URL(string: ""))!)",
                     destination: resource.attributes.link!)
                    .font(.callout)
            }
            if (resource.attributes.tags != nil) {
                ForEach(resource.attributes.tags!, id: \.self) { tag in
                    Text(Image(systemName: "tag")) + Text("\(tag)")
                }
            }
        }
    }
}


struct ResourceView_Previews: PreviewProvider {
    static var previews: some View {
        // add modifer .previewDevice()
        // pull this out into var
        ResourceView(resource: Resource(attributes: Attributes(title: "My Title",
                                                               subtitle: nil,
                                                               description: "My subtitle",
                                                               picture: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Sea_Otter_%28Enhydra_lutris%29_%2825169790524%29_crop.jpg/800px-Sea_Otter_%28Enhydra_lutris%29_%2825169790524%29_crop.jpg",
                                                               link: URL(string: "emwalks.com"),
                                                               tags: ["book", "podcast"]), id: UUID()))
    }
}

