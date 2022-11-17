//
//  QuoteView.swift
//  I Like Me Better
//
//  Created by Jeffrey on 11/16/22.
//

import SwiftUI

struct QuoteView: View {
    
    @State var showQuoteSheet:Bool = false
    
    @FetchRequest(sortDescriptors: []) var lauvQuotes: FetchedResults<Quote>

    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(lauvQuotes) { q in
                    VStack{
                        Text(q.title ?? "Title")
                        Text(q.text ?? "Text")
                    }
                        .onTapGesture {
                            showQuoteSheet = true
                        }
                }
            }
            .navigationTitle("lauv lyrics")
            .sheet(isPresented: $showQuoteSheet) {
                HomeView()
            }
            
        }


    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}
