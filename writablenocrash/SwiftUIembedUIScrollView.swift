////
////  SwiftUIembedUIScrollView.swift
////  writablenocrash
////
////  Created by minto on 3/9/2566 BE.
////
//
//import SwiftUI
//
//class customUISCrollView: UIScrollView {
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//            if touch.type == .pencil {
//                self.isScrollEnabled = false
//            }
//            if touch.type == .direct {
//                self.isScrollEnabled = true
//            }
//        }
//    }
//
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//        var path = UIBezierPath()
//        path.move(to: CGPoint(x: 100, y: 600))
//        path.addLine(to: CGPoint(x: 100, y: 600))
//        UIColor.black.setStroke()
//        path.stroke()
//        setNeedsDisplay()
//
//    }
//
//
//
//}
//
//struct Scrollrepresented: UIViewRepresentable {
//
//
//    func makeUIView(context: Context) -> UIScrollView {
//        let uiscrollviewInstance = customUISCrollView(frame: CGRect(x: 100, y: 500, width: 500, height: 2000))
//        uiscrollviewInstance.isScrollEnabled = true
//        uiscrollviewInstance.contentSize = CGSize(width: 500, height: 1000)
//
//        return uiscrollviewInstance
//    }
//
//    func updateUIView(_ uiView: UIScrollView, context: Context) {
//
//    }
//
//    typealias UIViewType = UIScrollView
//
//
//}
//
//struct SwiftUIembedUIScrollView: View {
//    var body: some View {
//        VStack {
//            Scrollrepresented()
//                .background(.red)
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        }
//    }
//}
//
//struct SwiftUIembedUIScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIembedUIScrollView()
//    }
//}

import SwiftUI

class customLine: UIView {
    override func draw(_ rect: CGRect) {
        var path = UIBezierPath()
        path.move(to: CGPoint(x: 500, y: 500))
        path.addLine(to: CGPoint(x: 700, y: 900))
        path.addLine(to: CGPoint(x: 100, y: 1000))
        path.addLine(to: CGPoint(x: 900, y: 2000))
        path.addLine(to: CGPoint(x: 300, y: 200))
        UIColor.black.setStroke()
        path.stroke()
        setNeedsDisplay()
    }
}

class CustomUIScrollView: UIScrollView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch.type == .pencil {
                self.isScrollEnabled = false
            }
            if touch.type == .direct {
                self.isScrollEnabled = true
            }
        }
    }
}

struct ScrollRepresented: UIViewRepresentable {
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = CustomUIScrollView(frame: CGRect(x: 0, y: 0, width: 500, height: 2000))
        scrollView.isScrollEnabled = true
        scrollView.contentSize = CGSize(width: 500, height: 1000)

//        let lineView = UIView(frame: CGRect(x: 0, y: 600, width: 500, height: 1))
//        let lineView = customLine(frame:CGRect(x: 0, y: 0, width: 500, height: 2000))
        let lineView = ScrollDraw(frame:CGRect(x: 0, y: 0, width: 500, height: 2000))
        lineView.backgroundColor = .white




        scrollView.addSubview(lineView)

        return scrollView
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {}

    typealias UIViewType = UIScrollView
}

struct SwiftUIEmbedUIScrollView: View {
    var body: some View {
        VStack {
            ScrollRepresented()
            Text("Hello, World!")
        }
    }
}

struct SwiftUIEmbedUIScrollView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIEmbedUIScrollView()
    }
}

//import SwiftUI
//
//class CustomLine: UIView {
//    override func draw(_ rect: CGRect) {
//        var path = UIBezierPath()
//        path.move(to: CGPoint(x: 0, y: 0))
//        path.addLine(to: CGPoint(x: 0, y: 2000))
//        UIColor.black.setStroke()
//        path.stroke()
//        setNeedsDisplay()
//    }
//}
//
//class CustomUIScrollView: UIScrollView {
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//            if touch.type == .pencil {
//                self.isScrollEnabled = false
//            }
//            if touch.type == .direct {
//                self.isScrollEnabled = true
//            }
//        }
//    }
//}
//
//struct ContentView: View {
//    var body: some View {
//        HStack {
//            CustomDrawing()
//            ScrollViewRepresented()
//        }
//    }
//}
//
//struct CustomDrawing: UIViewRepresentable {
//    func makeUIView(context: Context) -> UIView {
//        let customDrawingView = CustomLine()
//        customDrawingView.backgroundColor = .white
//        return customDrawingView
//    }
//
//    func updateUIView(_ uiView: UIView, context: Context) {}
//
//    typealias UIViewType = UIView
//}
//
//struct ScrollViewRepresented: UIViewRepresentable {
//    func makeUIView(context: Context) -> UIScrollView {
//        let scrollView = CustomUIScrollView()
//        scrollView.isScrollEnabled = true
//        scrollView.contentSize = CGSize(width: 500, height: 1000)
//        return scrollView
//    }
//
//    func updateUIView(_ uiView: UIScrollView, context: Context) {}
//
//    typealias UIViewType = UIScrollView
//}


