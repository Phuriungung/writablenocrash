//
//  ContentView.swift
//  writablenocrash
//
//  Created by minto on 31/8/2566 BE.
//

import SwiftUI
import UIKit

class SmoothedDraw: UIView {
    var path = UIBezierPath()
    var ctr = 0
    var pts = [CGPoint](repeating: .zero, count: 5)



    override func draw(_ rect: CGRect) {
        path = UIBezierPath(roundedRect: rect, cornerRadius: 50)



        path.lineWidth = 2.0 // Set the line width as needed
        UIColor.red.setStroke()
        path.stroke()

        path.move(to: CGPoint(x: 500, y: 400))
        path.addLine(to: CGPoint(x:300 , y:500))
        path.stroke()
        path.move(to: CGPoint(x:600, y: 800))
        path.addLine(to: CGPoint(x: 300, y: 600))
//        path.stroke()
        

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(touches)
        path.move(to: CGPoint(x:600, y: 800))
        path.addLine(to: CGPoint(x: 300, y: 600))
        print(path)
        path.stroke()
        print(path.stroke())
        setNeedsDisplay()
        path.lineWidth = 2.0 // Set the line width as needed
        UIColor.red.setStroke()
        path.stroke()
        path.stroke()
        print("Hi")
        setNeedsDisplay()
        ctr = 0
        if let touch = touches.first {
            pts[0] = touch.location(in: self)
        }
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let p = touch.location(in: self)
            path.move(to: CGPoint(x:600, y: 800))
            path.addLine(to: CGPoint(x: 300, y: 600))
            path.addLine(to: p) // Add this line to draw a line from the starting point to the current touch point
            setNeedsDisplay()
        }
    }


//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        path.addLine(to: CGPoint(x: 300, y: 600))
//        path.stroke()
//        print(touches)
//
//        if let touch = touches.first {
//            let p = touch.location(in: self)
//            ctr += 1
//            pts[Int(ctr)] = p
//            if ctr == 4 {
//                pts[3] = CGPoint(x: (pts[2].x + pts[4].x) / 2.0, y: (pts[2].y + pts[4].y) / 2.0)
//                path.move(to: pts[0])
//                path.addCurve(to: pts[3], controlPoint1: pts[1], controlPoint2: pts[2])
//                setNeedsDisplay()
//                pts[0] = pts[3]
//                pts[1] = pts[4]
//                ctr = 1
//                path.addLine(to: CGPoint(x: 1, y: 10))
//                path.stroke()
//            }
//        }
//    }
}




struct RepresentView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
//        let initialView = UIView(frame: CGRect(x: 100, y: 100, width: 1, height: 1))
//
//        initialView.backgroundColor  = UIColor(red: 0.8, green: 0.4, blue: 0.3, alpha: 1)
        
//        let button = UIButton(type: .system)
//        button.setTitle("Tap Me", for: .normal)
//        button.frame = CGRect(x: 50, y: 220, width: 200, height: 200)
//        button.backgroundColor = UIColor(red: 1, green: 0, blue: 0.3, alpha: 1)
//        initialView.addSubview(button)
//
//        let datePicker = UIDatePicker(frame: CGRect(x: 1, y: 1, width: 400, height: 500))
//        initialView.addSubview(datePicker)
//
//
//        let buttona = UIButton(type: .system)
//        buttona.setTitle("Tap Me N", for: .normal)
//        buttona.frame = CGRect(x: 50, y: 500, width: 200, height: 200)
//        buttona.backgroundColor = UIColor(red: 1, green: 1, blue: 0.3, alpha: 1)
//        initialView.addSubview(buttona)
//
//        let buttonab = UIButton(type: .system)
//        buttonab.setTitle("Tap Me A B", for: .normal)
//        buttonab.frame = CGRect(x: 50, y: 900, width: 200, height: 50) // Adjust the buttona's frame as needed
//        buttonab.backgroundColor = UIColor(red: 0, green: 1, blue: 0.3, alpha: 1)
//        initialView.addSubview(buttonab)
//
//        let buttonac = UIButton(type: .system)
//        buttonac.setTitle("Tap Me A B", for: .normal)
//        buttonac.frame = CGRect(x: 0, y: 600, width: 200, height: 50) // Adjust the buttona's frame as needed
//        buttonac.backgroundColor = UIColor(red: 1, green: 1, blue: 0.3, alpha: 1)
//        initialView.addSubview(buttonac)
        
        
        
        var smoothDrawInstance = SmoothedDraw()
        smoothDrawInstance.backgroundColor = UIColor(red: 0, green: 0, blue: 0.5, alpha: 0.5)
        
        smoothDrawInstance.frame = CGRect(x: 100, y: 200, width: 500, height: 2000)
        
        var initialView = smoothDrawInstance
        
//        initialView.addSubview(smoothDrawInstance)
        
        
        return initialView
        
    }
    
    private func buttonTapped() {
        print("Button tapped!")
        // You can add your button's action code here
    }
    
    
    typealias UIViewType = UIView
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        //        uiView.backgroundColor = UIColor(red: 1, green: 0, blue: 1, alpha: 1)
        
    }
}


struct ContentView: View {
    var body: some View {
        VStack {
            RepresentView()
                .padding(4)
                .frame(width: 1000, height: 1000)
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
                .frame(width: 200, height: 500)
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
