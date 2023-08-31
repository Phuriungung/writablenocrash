//
//  ContentView.swift
//  writablenocrash
//
//  Created by minto on 31/8/2566 BE.
//

import SwiftUI
import UIKit

struct RepresentView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        var initialView = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        
        initialView.backgroundColor  = UIColor(red: 250, green: 1, blue: 1, alpha: 0.5)
        
        return initialView
    }
    
    
    typealias UIViewType = UIView
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        var initialView = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        
        initialView.backgroundColor  = UIColor(red: 250, green: 1, blue: 1, alpha: 1)
        
    }
}


struct ContentView: View {
    var body: some View {
        VStack {
            RepresentView()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
