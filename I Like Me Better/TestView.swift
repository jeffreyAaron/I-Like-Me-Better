//
//  TestView.swift
//  I Like Me Better
//
//  Created by Jeffrey on 11/19/22.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        
        VStack{
            Text("Hello, Jeffrey!")
            Text("Hello, Willson!")
            HStack {
                VStack {
                    Text("1")
                        .font(.largeTitle)

                }.padding()
                Spacer()
                VStack {
                    Text("2")
                        .font(.largeTitle)

                }.padding()
            }

        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
