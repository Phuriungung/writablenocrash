//
//  swiftuiContentView.swift
//  writablenocrash
//
//  Created by minto on 5/9/2566 BE.
//

import SwiftUI

struct SwiftUIContentView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SwiftUIContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        VStack {
            UIScrollViewRepresentableWrapper()
            SwiftUIContentView()
            Text("Hi")
            Text("test")
            Text("learn")
        }
        
    }
}
