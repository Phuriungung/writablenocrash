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
    var path2 = UIBezierPath()
    var eraserpath = UIBezierPath()
    var bezierPath = UIBezierPath()
    var ctr = 0
    var pts = [CGPoint](repeating: .zero, count: 5)
    var savedpts: [CGPoint] = []
    private var incrementalImage: UIImage?
    
    var whitePath = UIBezierPath()
    
    override func draw(_ rect: CGRect) {
        
        incrementalImage?.draw(in: rect)
        //        path = UIBezierPath(roundedRect: rect, cornerRadius:10)
        path.lineWidth = 5.0 // Set the line width as needed
        path.lineCapStyle = .round
        
        UIColor.blue.setStroke()
        
        path2.lineWidth = 5.0
        path2.lineCapStyle = .round
        
        path.stroke()
        UIColor.red.setStroke()
        path2.stroke()
        setNeedsDisplay()
        
        bezierPath.move(to: CGPoint(x: 500, y: 500))
        bezierPath.addLine(to: CGPoint(x: 100, y: 900))
        
        // Create a new CGPath with a different path
        let newPath = UIBezierPath()
        newPath.move(to: CGPoint(x: 150, y: 500))
        newPath.addCurve(to: CGPoint(x: 200, y: 900), controlPoint1: CGPoint(x: 170, y: 170), controlPoint2: CGPoint(x: 180, y: 30))
        
        let newlyPath = UIBezierPath()
        
        let a = 500
        newlyPath.move(to: CGPoint(x: 0, y: a))
        //        newlyPath.addCurve(to: CGPoint(x: 200, y: 900), controlPoint1: CGPoint(x: 170, y: 170), controlPoint2: CGPoint(x: 180, y: 30))
        //        newlyPath.addLine(to: CGPoint(x: 900, y: 500))
        newlyPath.addLine(to: CGPoint(x: 170, y: 170))
        
        // Assign the new CGPath to the cgPath property of the UIBezierPath
        bezierPath.cgPath = newlyPath.cgPath
        
        bezierPath.cgPath = newPath.cgPath.lineSubtracting(newlyPath.cgPath)
        
        
        // Now, bezierPath contains the new path defined by newPath's CGPath.
        UIColor.green.setStroke()
        bezierPath.lineWidth = 20
        bezierPath.stroke()
        setNeedsDisplay()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch.type == .pencil {
                setNeedsDisplay()
                ctr = 0
                if let touch = touches.first {
                    pts[0] = touch.location(in: self)
                }
                
                path.move(to: pts[0])
                path.addLine(to: pts[0])
                path.stroke()
                setNeedsDisplay()
            }
        }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch.type == .pencil {
                path.stroke()
                //                print(touches)
                if let touch = touches.first {
                    let p = touch.location(in: self)
                    ctr += 1
                    pts[Int(ctr)] = p
                    
                    if ctr == 1 {
                        path.move(to: pts[0])
                        path.addLine(to: pts[1])
                        path.stroke()
                        setNeedsDisplay()
                        //                print("1")
                    }
                    
                    if ctr == 2 {
                        path.removeAllPoints()
                        path.move(to: pts[0])
                        path.addQuadCurve(to: pts[2], controlPoint: pts[1])
                        path.stroke()
                        setNeedsDisplay()
                        //                print("2")
                    }
                    
                    
                    if ctr == 3 {
                        path.removeAllPoints()
                        path.move(to: pts[0])
                        path.addCurve(to: pts[3], controlPoint1: pts[1], controlPoint2: pts[2])
                        path.stroke()
                        setNeedsDisplay()
                        //                print("3")
                    }
                    
                    if ctr == 4 {
                        path.removeAllPoints()
                        pts[3] = CGPoint(x: (pts[2].x + pts[4].x) / 2.0, y: (pts[2].y + pts[4].y) / 2.0)
                        path2.move(to: pts[0])
                        path2.addCurve(to: pts[3], controlPoint1: pts[1], controlPoint2: pts[2])
                        path2.stroke()
                        setNeedsDisplay()
                        //                        print(path2.cgPath)
                        
                        
                        
                        //                print("4")
                        
                        
                        
                        for i in 0...4 {
                            savedpts.append(pts[i])
                        }
                        
                        pts[0] = pts[3]
                        pts[1] = pts[4]
                        //                print("5")
                        ctr = 1
                        
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            if touch.type == .pencil {
                
                if ctr == 0 {
                    path2.move(to: pts[0])
                    path2.addLine(to: pts[0])
                    path2.stroke()
                    setNeedsDisplay()
                }
                
                if ctr == 1 {
                    path2.move(to: pts[0])
                    path2.addLine(to: pts[1])
                    path2.stroke()
                    setNeedsDisplay()
                    //            print("e1")
                }
                
                if ctr == 2 {
                    path2.move(to: pts[0])
                    path2.addQuadCurve(to: pts[2], controlPoint: pts[1])
                    path2.stroke()
                    setNeedsDisplay()
                    //            print("e2")
                }
                
                if ctr == 3 {
                    path2.move(to: pts[0])
                    path2.addCurve(to: pts[3], controlPoint1: pts[1], controlPoint2: pts[2])
                    path2.stroke()
                    setNeedsDisplay()
                    //            print("e3")
                }
                drawBitmap()
                path2.removeAllPoints()
                
                ctr = 0
                //        path.removeAllPoints()
            }
            
        }
    }
    private func drawBitmap() {
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        UIColor.black.setStroke()
        
        if incrementalImage == nil { // first draw; paint background white by ...
            let rectPath = UIBezierPath(rect: bounds)
            UIColor.white.setFill()
            rectPath.fill() // filling it with white
        }
        
        incrementalImage?.draw(at: CGPoint.zero)
        path2.stroke()
        incrementalImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
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
        
        let smoothDrawInstance = SmoothedDraw()
        smoothDrawInstance.backgroundColor = UIColor(.white)
        smoothDrawInstance.frame = CGRect(x: 0, y: 0, width: 500, height: 2000)
        
        
        return smoothDrawInstance
        
    }
    
    private func buttonTapped() {
        //        print("Button tapped!")
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
            Text("HI")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
