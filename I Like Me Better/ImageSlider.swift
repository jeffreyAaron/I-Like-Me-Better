//
//  ImageSlider.swift
//  I Like Me Better
//
//  Created by Jeffrey on 11/16/22.
//

import SwiftUI

struct ImageSlider: View {
    
    var image_urls: [String]
    var image_titles: [String]
    
    @State private var selectedPageIndex = 0

    
    @State var current_title: String 
    
    init(image_urls: [String], image_titles: [String]) {
        self.image_urls = image_urls
        self.image_titles = image_titles
        self.current_title = image_titles[0]
    }
    
    var body: some View {
        var bounds = UIScreen.main.bounds
        var width = bounds.size.width

        NavigationView {
            VStack {
                
                TabView (selection: $selectedPageIndex) {
                    ForEach(image_urls.indices, id: \.self) {
                        index in
                        AsyncImage(url: URL(string: image_urls[index])) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: width-32)
                        .cornerRadius(10)
                    }
                }
                .onChange(of: selectedPageIndex) { newValue in
                    debugPrint("[a]: new value \(newValue)")
                    current_title = image_titles[selectedPageIndex]
                }
                .tabViewStyle(PageTabViewStyle())
                
            }.navigationTitle(current_title)
        }
    }
}

struct ImageSlider_Previews: PreviewProvider {
    static var previews: some View {
        ImageSlider(
            image_urls: ["https://cdn.discordapp.com/attachments/787088938933157952/1019865527402889266/DC2_6554.jpg", "https://cdn.discordapp.com/attachments/889229310131589150/1015820393401036870/IMG_20220128_090940627.jpg"],
            image_titles: ["App Dev and Me", "Jack and Me"])
    }
}
