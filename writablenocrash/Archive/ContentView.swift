////
////  ContentView.swift
////  writablenocrash
////
////  Created by minto on 31/8/2566 BE.
////
//
//import SwiftUI
//import UIKit
//
////class cachedDraw: UIView {
////    var path = UIBezierPath()
////    var ctr = 0
////    var pts: [CGPoint]
////
////    init(path: UIBezierPath = UIBezierPath(), ctr: Int = 0, pts: [CGPoint]) {
////        self.path = path
////        self.ctr = ctr
////        self.pts = pts
////        super.init(frame: CGRect.zero)
////    }
////
////
////
////    required init?(coder: NSCoder) {
////        fatalError("init(coder:) has not been implemented")
////    }
////
////
////
////
////    override func draw(_ rect: CGRect) {
////        path.lineWidth = 10.0 // Set the line width as needed
////        path.lineCapStyle = .round
////        UIColor.yellow.setStroke()
////        path.stroke()
////
////        setNeedsDisplay()
////        ctr = 0
////
//////        path.move(to: pts[0])
//////        path.addLine(to: pts[0])
////        path.stroke()
////        setNeedsDisplay()
////
////
////
////        path.stroke()
////
////        ctr += 1
////        if pts.count == 5 {
////            print(pts)
////            pts[3] = CGPoint(x: (pts[2].x + pts[4].x) / 2.0, y: (pts[2].y + pts[4].y) / 2.0)
////            path.addCurve(to: pts[3], controlPoint1: pts[1], controlPoint2: pts[2])
////            setNeedsDisplay()
////
////            pts[0] = pts[3]
////            pts[1] = pts[4]
////            ctr = 1
////            path.stroke()
////            setNeedsDisplay()
////        }
////    }
////
////}
//
//
//
//
//
//
//class SmoothedDraw: UIView {
//    var path = UIBezierPath()
//    var path2 = UIBezierPath()
//    var ctr = 0
//    var pts = [CGPoint](repeating: .zero, count: 5)
//    var savedpts: [CGPoint] = []
//    private var incrementalImage: UIImage?
//    
//    
//    var whitePath = UIBezierPath()
//    
//    //    var cachedDrawView = cachedDraw(pts: [])
//    
//    override func draw(_ rect: CGRect) {
//        incrementalImage?.draw(in: rect)
//        //        path = UIBezierPath(roundedRect: rect, cornerRadius:10)
//        path.lineWidth = 10.0 // Set the line width as needed
//        path.lineCapStyle = .round
//        
//        UIColor.blue.setStroke()
//        
//        //        path.move(to: CGPoint(x: 500, y: 500))
//        //        path.addLine(to: CGPoint(x: 500, y: 900))
//        //        path.stroke()
//        
//        
//        path2.lineWidth = 10.0
//        path2.lineCapStyle = .round
//        
//        //        UIColor.blue.setStroke()
//        //        path2.stroke()
//        //        setNeedsDisplay()
//        
//        
//        //        UIColor.red.setStroke()
//        //        path.move(to: CGPoint(x: 900, y: 500))
//        //        path.addLine(to: CGPoint(x: 500, y: 900))
//        path.stroke()
//        UIColor.red.setStroke()
//        path2.stroke()
//        setNeedsDisplay()
//        
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        setNeedsDisplay()
//        ctr = 0
//        if let touch = touches.first {
//            pts[0] = touch.location(in: self)
//        }
//        
//        path.move(to: pts[0])
//        path.addLine(to: pts[0])
//        path.stroke()
//        setNeedsDisplay()
//    }
//    
//    //    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//    //        if let touch = touches.first {
//    //            let p = touch.location(in: self)
//    //            path.move(to: CGPoint(x:600, y: 800))
//    //            path.addLine(to: CGPoint(x: 300, y: 600))
//    //            path.addLine(to: p) // Add this line to draw a line from the starting point to the current touch point
//    //            setNeedsDisplay()
//    //        }
//    //    }
//    
//    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        path.stroke()
//        //                print(touches)
//        if let touch = touches.first {
//            let p = touch.location(in: self)
//            ctr += 1
//            pts[Int(ctr)] = p
//            //            if ctr == 1 {
//            //                path.move(to: pts[0])
//            //                path.addLine(to: pts[1])
//            //                path.stroke()
//            //                setNeedsDisplay()
//            //            }
//            //
//            
//            if ctr == 1 {
//                path.move(to: pts[0])
//                path.addLine(to: pts[1])
//                path.stroke()
//                setNeedsDisplay()
//                //                print("1")
//            }
//            
//            if ctr == 2 {
//                path.removeAllPoints()
//                path.move(to: pts[0])
//                path.addQuadCurve(to: pts[2], controlPoint: pts[1])
//                path.stroke()
//                setNeedsDisplay()
//                //                print("2")
//            }
//            
//            
//            if ctr == 3 {
//                path.removeAllPoints()
//                path.move(to: pts[0])
//                path.addCurve(to: pts[3], controlPoint1: pts[1], controlPoint2: pts[2])
//                path.stroke()
//                setNeedsDisplay()
//                //                print("3")
//            }
//            
//            if ctr == 4 {
//                path.removeAllPoints()
//                pts[3] = CGPoint(x: (pts[2].x + pts[4].x) / 2.0, y: (pts[2].y + pts[4].y) / 2.0)
//                path2.move(to: pts[0])
//                path2.addCurve(to: pts[3], controlPoint1: pts[1], controlPoint2: pts[2])
//                //                path2.addLine(to: CGPoint(x: 500, y: 900))
//                path2.stroke()
//                setNeedsDisplay()
//                //                print("4")
//                
//                
//                
//                for i in 0...4 {
//                    savedpts.append(pts[i])
//                }
//                //
//                //                path2.move(to: savedpts[0])
//                //                path2.addCurve(to: savedpts[3], controlPoint1: savedpts[1] , controlPoint2: savedpts[2])
//                //                //                print(savedpts)
//                //
//                //                path2.addLine(to: CGPoint(x: 500, y: 1000))
//                //                path2.addLine(to: savedpts[1])
//                //                path2.addLine(to: savedpts[2])
//                //
//                //                for i in 1...savedpts.count-1 {
//                //                    path2.addLine(to: savedpts[i])
//                //                }
//                //
//                //                path2.stroke()
//                //                setNeedsDisplay()
//                
//                
//                pts[0] = pts[3]
//                pts[1] = pts[4]
//                //                print("5")
//                ctr = 1
//                
//            }
//        }
//    }
//    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        
//        if ctr == 0 {
//            path2.move(to: pts[0])
//            path2.addLine(to: pts[0])
//            path2.stroke()
//            setNeedsDisplay()
//        }
//        
//        if ctr == 1 {
//            path2.move(to: pts[0])
//            path2.addLine(to: pts[1])
//            path2.stroke()
//            setNeedsDisplay()
//            //            print("e1")
//        }
//        
//        if ctr == 2 {
//            path2.move(to: pts[0])
//            path2.addQuadCurve(to: pts[2], controlPoint: pts[1])
//            path2.stroke()
//            setNeedsDisplay()
//            //            print("e2")
//        }
//        
//        if ctr == 3 {
//            path2.move(to: pts[0])
//            path2.addCurve(to: pts[3], controlPoint1: pts[1], controlPoint2: pts[2])
//            path2.stroke()
//            setNeedsDisplay()
//            //            print("e3")
//        }
//        drawBitmap()
//        path2.removeAllPoints()
//        
//        ctr = 0
//        //        path.removeAllPoints()
//    }
//    
//    private func drawBitmap() {
//        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
//        UIColor.black.setStroke()
//        
//        if incrementalImage == nil { // first draw; paint background white by ...
//            let rectPath = UIBezierPath(rect: bounds)
//            UIColor.white.setFill()
//            rectPath.fill() // filling it with white
//        }
//        
//        incrementalImage?.draw(at: CGPoint.zero)
//        path2.stroke()
//        incrementalImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//    }
//    
//}
//
//
//
//
//struct RepresentView: UIViewRepresentable {
//    func makeUIView(context: Context) -> UIView {
//        //        let initialView = UIView(frame: CGRect(x: 100, y: 100, width: 1, height: 1))
//        //
//        //        initialView.backgroundColor  = UIColor(red: 0.8, green: 0.4, blue: 0.3, alpha: 1)
//        
//        //        let button = UIButton(type: .system)
//        //        button.setTitle("Tap Me", for: .normal)
//        //        button.frame = CGRect(x: 50, y: 220, width: 200, height: 200)
//        //        button.backgroundColor = UIColor(red: 1, green: 0, blue: 0.3, alpha: 1)
//        //        initialView.addSubview(button)
//        //
//        //        let datePicker = UIDatePicker(frame: CGRect(x: 1, y: 1, width: 400, height: 500))
//        //        initialView.addSubview(datePicker)
//        //
//        //
//        //        let buttona = UIButton(type: .system)
//        //        buttona.setTitle("Tap Me N", for: .normal)
//        //        buttona.frame = CGRect(x: 50, y: 500, width: 200, height: 200)
//        //        buttona.backgroundColor = UIColor(red: 1, green: 1, blue: 0.3, alpha: 1)
//        //        initialView.addSubview(buttona)
//        //
//        //        let buttonab = UIButton(type: .system)
//        //        buttonab.setTitle("Tap Me A B", for: .normal)
//        //        buttonab.frame = CGRect(x: 50, y: 900, width: 200, height: 50) // Adjust the buttona's frame as needed
//        //        buttonab.backgroundColor = UIColor(red: 0, green: 1, blue: 0.3, alpha: 1)
//        //        initialView.addSubview(buttonab)
//        //
//        //        let buttonac = UIButton(type: .system)
//        //        buttonac.setTitle("Tap Me A B", for: .normal)
//        //        buttonac.frame = CGRect(x: 0, y: 600, width: 200, height: 50) // Adjust the buttona's frame as needed
//        //        buttonac.backgroundColor = UIColor(red: 1, green: 1, blue: 0.3, alpha: 1)
//        //        initialView.addSubview(buttonac)
//        
//        
//        
//        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 500, height: 2000))
//        
//        var smoothDrawInstance = SmoothedDraw()
//        smoothDrawInstance.backgroundColor = UIColor(.white)
//        smoothDrawInstance.frame = CGRect(x: 0, y: 0, width: 500, height: 2000)
//        
//        //        let smoothDrawInstance = ScrollDraw()
//        //        smoothDrawInstance.backgroundColor = UIColor(.white)
//        //        smoothDrawInstance.frame = CGRect(x: 0, y: 0, width: 500, height: 2000)
//        //        smoothDrawInstance.isScrollEnabled = true
//        
//        //        let smoothDrawInstance = UIScrollView()
//        //        smoothDrawInstance.isScrollEnabled = true
//        //        smoothDrawInstance.backgroundColor = UIColor(.green)
//        //        smoothDrawInstance.frame = CGRect(x: 0, y: 0, width: 500, height: 2000)
//        
//        
//        return smoothDrawInstance
//        
//    }
//    
//    private func buttonTapped() {
//        //        print("Button tapped!")
//        // You can add your button's action code here
//    }
//    
//    
//    typealias UIViewType = UIView
//    
//    func updateUIView(_ uiView: UIViewType, context: Context) {
//        
//        //        uiView.backgroundColor = UIColor(red: 1, green: 0, blue: 1, alpha: 1)
//        
//    }
//}
//
//struct ScrollViewWrapper: UIViewRepresentable {
//    func makeUIView(context: Context) -> UIScrollView {
//        let scrollView = UIScrollView()
//        scrollView.isScrollEnabled = true
//        scrollView.backgroundColor = UIColor.blue
//        scrollView.contentSize = CGSize(width: 1000, height: 2000)
//        
//        return scrollView
//    }
//    
//    func updateUIView(_ uiView: UIScrollView, context: Context) {
//        // You can configure your UIScrollView here, for example:
//        // uiView.contentSize = CGSize(width: 400, height: 800)
//        
//        // Add subviews or modify the content of the UIScrollView as needed.
//        // For example, you can add a UIView with content to the UIScrollView.
//        
//        // Example of adding a UILabel to the UIScrollView
//        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
//        label.text = "Scroll me!"
//        uiView.addSubview(label)
//    }
//}
//
//struct UIScrollViewWrapper<Content: View>: UIViewControllerRepresentable {
//    
//    @Binding var isScrollEnabled: Bool
//    @Binding var isPageEnabled: Bool
//    
//    var content: () -> Content
//    
////    init(@ViewBuilder content: @escaping () -> Content) {
////        self.content = content
////    }
//    
//    init(isScrollEnabled: Binding<Bool>, isPageEnabled: Binding<Bool>,  @ViewBuilder content: @escaping () -> Content) {
//            self._isScrollEnabled = isScrollEnabled
//        self._isPageEnabled = isPageEnabled
//            self.content = content
//        }
//    
//    func makeUIViewController(context: Context) -> UIScrollViewViewController {
//        let vc = UIScrollViewViewController()
//        vc.hostingController.rootView = AnyView(self.content())
//        vc.scrollView.isScrollEnabled = isScrollEnabled
//        vc.scrollView.isPagingEnabled = isPageEnabled
//        return vc
//    }
//    
//    func updateUIViewController(_ viewController: UIScrollViewViewController, context: Context) {
//        viewController.hostingController.rootView = AnyView(self.content())
//        viewController.scrollView.isScrollEnabled = isScrollEnabled
//        viewController.scrollView.isPagingEnabled = isPageEnabled
//    }
//}
//
//class UIScrollViewViewController: UIViewController {
//    
//    lazy var scrollView: UIScrollView = {
//        let v = UIScrollView()
//        v.isPagingEnabled = false
//        v.isScrollEnabled = false
//        return v
//    }()
//    
//    var hostingController: UIHostingController<AnyView> = UIHostingController(rootView: AnyView(EmptyView()))
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.addSubview(self.scrollView)
//        self.pinEdges(of: self.scrollView, to: self.view)
//        
//        self.hostingController.willMove(toParent: self)
//        self.scrollView.addSubview(self.hostingController.view)
//        self.pinEdges(of: self.hostingController.view, to: self.scrollView)
//        self.hostingController.didMove(toParent: self)
//        
//    }
//    
//    func pinEdges(of viewA: UIView, to viewB: UIView) {
//        viewA.translatesAutoresizingMaskIntoConstraints = false
//        viewB.addConstraints([
//            viewA.leadingAnchor.constraint(equalTo: viewB.leadingAnchor),
//            viewA.trailingAnchor.constraint(equalTo: viewB.trailingAnchor),
//            viewA.topAnchor.constraint(equalTo: viewB.topAnchor),
//            viewA.bottomAnchor.constraint(equalTo: viewB.bottomAnchor),
//        ])
//    }
//    
//}
//
//class ScrollDraw: UIView {
//    
//    var path = UIBezierPath()
//    var path2 = UIBezierPath()
//    var ctr = 0
//    var pts = [CGPoint](repeating: .zero, count: 5)
//    var savedpts: [CGPoint] = []
//    private var incrementalImage: UIImage?
//    
//    
//    var whitePath = UIBezierPath()
//    
//    //    var cachedDrawView = cachedDraw(pts: [])
//    
//    override func draw(_ rect: CGRect) {
//        incrementalImage?.draw(in: rect)
//        //        path = UIBezierPath(roundedRect: rect, cornerRadius:10)
//        path.lineWidth = 10.0 // Set the line width as needed
//        path.lineCapStyle = .round
//        
//        UIColor.blue.setStroke()
//        
//        //        path.move(to: CGPoint(x: 500, y: 500))
//        //        path.addLine(to: CGPoint(x: 500, y: 900))
//        //        path.stroke()
//        
//        
//        path2.lineWidth = 10.0
//        path2.lineCapStyle = .round
//        
//        //        UIColor.blue.setStroke()
//        //        path2.stroke()
//        //        setNeedsDisplay()
//        
//        
//        //        UIColor.red.setStroke()
//        //        path.move(to: CGPoint(x: 900, y: 500))
//        //        path.addLine(to: CGPoint(x: 500, y: 900))
//        path.stroke()
//        UIColor.red.setStroke()
//        path2.stroke()
//        setNeedsDisplay()
//        
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        setNeedsDisplay()
//        ctr = 0
//        if let touch = touches.first {
//            pts[0] = touch.location(in: self)
//        }
//        
//        path.move(to: pts[0])
//        path.addLine(to: pts[0])
//        path.stroke()
//        setNeedsDisplay()
//    }
//    
//    //    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//    //        if let touch = touches.first {
//    //            let p = touch.location(in: self)
//    //            path.move(to: CGPoint(x:600, y: 800))
//    //            path.addLine(to: CGPoint(x: 300, y: 600))
//    //            path.addLine(to: p) // Add this line to draw a line from the starting point to the current touch point
//    //            setNeedsDisplay()
//    //        }
//    //    }
//    
//    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        path.stroke()
//        //                print(touches)
//        if let touch = touches.first {
//            let p = touch.location(in: self)
//            ctr += 1
//            pts[Int(ctr)] = p
//            //            if ctr == 1 {
//            //                path.move(to: pts[0])
//            //                path.addLine(to: pts[1])
//            //                path.stroke()
//            //                setNeedsDisplay()
//            //            }
//            //
//            
//            if ctr == 1 {
//                path.move(to: pts[0])
//                path.addLine(to: pts[1])
//                path.stroke()
//                setNeedsDisplay()
//                //                print("1")
//            }
//            
//            if ctr == 2 {
//                path.removeAllPoints()
//                path.move(to: pts[0])
//                path.addQuadCurve(to: pts[2], controlPoint: pts[1])
//                path.stroke()
//                setNeedsDisplay()
//                //                print("2")
//            }
//            
//            
//            if ctr == 3 {
//                path.removeAllPoints()
//                path.move(to: pts[0])
//                path.addCurve(to: pts[3], controlPoint1: pts[1], controlPoint2: pts[2])
//                path.stroke()
//                setNeedsDisplay()
//                //                print("3")
//            }
//            
//            if ctr == 4 {
//                path.removeAllPoints()
//                pts[3] = CGPoint(x: (pts[2].x + pts[4].x) / 2.0, y: (pts[2].y + pts[4].y) / 2.0)
//                path2.move(to: pts[0])
//                path2.addCurve(to: pts[3], controlPoint1: pts[1], controlPoint2: pts[2])
//                //                path2.addLine(to: CGPoint(x: 500, y: 900))
//                path2.stroke()
//                setNeedsDisplay()
//                //                print("4")
//                
//                
//                
//                for i in 0...4 {
//                    savedpts.append(pts[i])
//                }
//                //
//                //                path2.move(to: savedpts[0])
//                //                path2.addCurve(to: savedpts[3], controlPoint1: savedpts[1] , controlPoint2: savedpts[2])
//                //                //                print(savedpts)
//                //
//                //                path2.addLine(to: CGPoint(x: 500, y: 1000))
//                //                path2.addLine(to: savedpts[1])
//                //                path2.addLine(to: savedpts[2])
//                //
//                //                for i in 1...savedpts.count-1 {
//                //                    path2.addLine(to: savedpts[i])
//                //                }
//                //
//                //                path2.stroke()
//                //                setNeedsDisplay()
//                
//                
//                pts[0] = pts[3]
//                pts[1] = pts[4]
//                //                print("5")
//                ctr = 1
//                
//            }
//        }
//    }
//    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        
//        if ctr == 0 {
//            path2.move(to: pts[0])
//            path2.addLine(to: pts[0])
//            path2.stroke()
//            setNeedsDisplay()
//        }
//        
//        if ctr == 1 {
//            path2.move(to: pts[0])
//            path2.addLine(to: pts[1])
//            path2.stroke()
//            setNeedsDisplay()
//            //            print("e1")
//        }
//        
//        if ctr == 2 {
//            path2.move(to: pts[0])
//            path2.addQuadCurve(to: pts[2], controlPoint: pts[1])
//            path2.stroke()
//            setNeedsDisplay()
//            //            print("e2")
//        }
//        
//        if ctr == 3 {
//            path2.move(to: pts[0])
//            path2.addCurve(to: pts[3], controlPoint1: pts[1], controlPoint2: pts[2])
//            path2.stroke()
//            setNeedsDisplay()
//            //            print("e3")
//        }
//        drawBitmap()
//        path2.removeAllPoints()
//        
//        ctr = 0
//        //        path.removeAllPoints()
//    }
//    
//    private func drawBitmap() {
//        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
//        UIColor.black.setStroke()
//        
//        if incrementalImage == nil { // first draw; paint background white by ...
//            let rectPath = UIBezierPath(rect: bounds)
//            UIColor.white.setFill()
//            rectPath.fill() // filling it with white
//        }
//        
//        incrementalImage?.draw(at: CGPoint.zero)
//        path2.stroke()
//        incrementalImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//    }
//    
//}
//
//struct ContentView: View {
//    
//    @State private var isScrollEnabled = true
//    @State private var isPageEnabled = true
//    
//    var body: some View {
//        VStack {
//            HStack {
//                Button(action: {
//                    isScrollEnabled.toggle()
//                }) {
//                    Text(isScrollEnabled ? "Disable Scrolling" : "Enable Scrolling")
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//                Button(action: {
//                    isPageEnabled.toggle()
//                }) {
//                    Text(isPageEnabled ? "Disable Paging" : "Enable Paging")
//                        .padding()
//                        .background(Color.green)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                }
//            }
//            
//            
//            UIScrollViewWrapper(isScrollEnabled: $isScrollEnabled, isPageEnabled: $isPageEnabled) {
//                VStack {
//                    ForEach(0..<100, id: \.self) { obj in
//                        Text("\(obj)")
//                    }
//                }
//                .background(Color.blue.opacity(0.25))
//                RepresentView()
//                    .padding(4)
//                    .frame(width: 1000, height: 10000)
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundColor(.accentColor)
//                Text("Hello, world!")
//                    .frame(width: 200, height: 10)
//                
//            }
//        }
//        .padding()
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//
