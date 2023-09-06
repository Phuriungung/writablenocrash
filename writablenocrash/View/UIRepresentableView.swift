//
//  UIRepresentableView.swift
//  writablenocrash
//
//  Created by minto on 5/9/2566 BE.
//


import SwiftUI

class sampleUIScrollView: UIScrollView {
    
}

struct UIScrollViewRepresentableWrapper: UIViewRepresentable {
    func makeUIView(context: Context) -> UIScrollView {
        sampleUIScrollView()
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
    
    }
    
    typealias UIViewType = UIScrollView
}
