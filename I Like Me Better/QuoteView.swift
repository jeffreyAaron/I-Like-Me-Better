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
    
    @Environment(\.managedObjectContext) var moc

    
    var body: some View {
        NavigationView {
            
            List {
                ForEach(lauvQuotes) { q in
                    VStack{
                        HStack{
                            VStack{
                                if(q.albumCoverUrl != nil){
                                    AsyncImage(url: URL(string: q.albumCoverUrl ?? "")) { image in
                                        image.resizable().scaledToFit()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 64)
                                    .cornerRadius(4)
                                }
                            }
                            VStack{
                                HStack{
                                    Text(q.title ?? "Title")
                                        .font(.title)
                                    Spacer()
                                }
                                HStack{
                                    Text(q.text ?? "Text")
                                        .font(.caption)
                                    Spacer()
                                }
                            }
                        }
                    }
                        .onTapGesture {
                            showQuoteSheet = true
                        }
                }.onDelete { indexSet in
                    for index in indexSet {
                        moc.delete(lauvQuotes[index])
                    }
                    do {
                        try moc.save()
                    } catch {
                        print(error.localizedDescription)
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
