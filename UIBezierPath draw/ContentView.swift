//
//  ContentView.swift
//  UIBezierPath draw
//
//  Created by 鍾瑀璇 on 2022/4/30.
//

import SwiftUI
struct DrawView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let containerView = UIView()
        containerView.frame = CGRect(x: 15, y: 220, width: 300, height: 500)
    
        //底圖
        let potImageView = UIImageView(image: UIImage(named: "d4094963.jpg"))
        potImageView.frame = CGRect(x: 10, y: -26, width: 300, height: 500)
        potImageView.contentMode = .scaleAspectFill
        potImageView.alpha = 0.6
        //view.addSubview(potImageView)
        
        //背景星空
        let starImageView = UIImageView(image: UIImage(named: "012.jpg"))
        starImageView.frame = CGRect(x: 0, y: 0, width: 312, height: 812)
        starImageView.contentMode = .scaleAspectFill
        view.addSubview(starImageView)
        
        
        //神燈壺身
        func addPot() -> CAShapeLayer{
        let potPath = UIBezierPath()
        potPath.move(to: CGPoint(x: 10, y: 256))
        potPath.addQuadCurve(to: CGPoint(x: 30, y: 238), controlPoint: CGPoint(x: 20, y: 245))
        potPath.addCurve(to: CGPoint(x: 156, y: 240), controlPoint1: CGPoint(x: 40, y: 215), controlPoint2: CGPoint(x: 150, y: 280))
        potPath.addQuadCurve(to: CGPoint(x: 184, y: 240), controlPoint: CGPoint(x: 170, y: 240))
            potPath.addQuadCurve(to: CGPoint(x: 222, y: 255), controlPoint: CGPoint(x: 182, y: 258))
            potPath.addQuadCurve(to: CGPoint(x: 226, y: 295), controlPoint: CGPoint(x: 250, y: 275))
            potPath.addCurve(to: CGPoint(x: 10, y: 256), controlPoint1: CGPoint(x: 130, y: 343), controlPoint2: CGPoint(x: 48, y: 205))
        let potLayer = CAShapeLayer()
        potLayer.path = potPath.cgPath
            potLayer.lineWidth = 3
            potLayer.strokeColor = UIColor.brown.cgColor
            return potLayer
        }
       //蓋子
        func addLid() -> CAShapeLayer{
        let lidPath = UIBezierPath()
            lidPath.move(to: CGPoint(x: 156, y: 240))
            lidPath.addQuadCurve(to: CGPoint(x: 169, y: 223), controlPoint: CGPoint(x: 154, y: 220))
            lidPath.addQuadCurve(to: CGPoint(x: 184, y: 240), controlPoint: CGPoint(x: 185, y: 220))
            lidPath.move(to: CGPoint(x: 163, y: 223))
            lidPath.addLine(to: CGPoint(x: 163, y: 240))
            lidPath.move(to: CGPoint(x: 169, y: 240))
            lidPath.addLine(to: CGPoint(x: 169, y: 223))
            lidPath.move(to: CGPoint(x: 176, y: 223))
            lidPath.addLine(to: CGPoint(x: 176, y: 240))
            let lidLayer = CAShapeLayer()
                lidLayer.path = lidPath.cgPath
                lidLayer.lineWidth = 3
                lidLayer.strokeColor = UIColor.brown.cgColor
                lidLayer.fillColor = UIColor.clear.cgColor
            return lidLayer
        }
        func addLidTop() -> CAShapeLayer{
            let lidTop = UIBezierPath(ovalIn: CGRect(x: 165, y: 210, width: 12, height: 10))
            let lidTopLayer = CAShapeLayer()
                lidTopLayer.path = lidTop.cgPath
            lidTopLayer.lineWidth = 3
            lidTopLayer.strokeColor = UIColor.brown.cgColor
        
            return lidTopLayer
        }
        //壺底
        func addBottom() -> CAShapeLayer{
            let lidBottom = UIBezierPath()
            lidBottom.move(to: CGPoint(x: 152, y: 300))
            lidBottom.addQuadCurve(to: CGPoint(x: 135, y: 340), controlPoint: CGPoint(x: 173, y: 325))
            lidBottom.addQuadCurve(to: CGPoint(x: 204, y: 339), controlPoint: CGPoint(x: 164, y: 330))
            lidBottom.addQuadCurve(to: CGPoint(x: 185, y: 304), controlPoint: CGPoint(x: 170, y: 325))
            let bottomLayer = CAShapeLayer()
            bottomLayer.path = lidBottom.cgPath
            bottomLayer.lineWidth = 3
            bottomLayer.strokeColor = UIColor.brown.cgColor
        
            return bottomLayer
        }
        //把手
        func addHandle() -> CAShapeLayer {
            let handle = UIBezierPath()
            let handleLayer = CAShapeLayer()
            handle.move(to: CGPoint(x: 235, y: 275))
            handle.addCurve(to: CGPoint(x: 258, y: 254), controlPoint1: CGPoint(x: 295, y: 300), controlPoint2: CGPoint(x: 285, y: 235))
            handle.addCurve(to: CGPoint(x: 240, y: 203), controlPoint1: CGPoint(x: 217, y: 283), controlPoint2: CGPoint(x: 215, y: 220))
            handle.addLine(to: CGPoint(x: 260, y: 210))
            handle.addQuadCurve(to: CGPoint(x: 242, y: 245), controlPoint: CGPoint(x: 235, y: 225))
            handle.addCurve(to: CGPoint(x: 235, y: 289), controlPoint1: CGPoint(x: 300, y: 200), controlPoint2: CGPoint(x: 325, y: 320))
            handleLayer.path = handle.cgPath
            handleLayer.lineWidth = 3
            handleLayer.strokeColor = UIColor.brown.cgColor
          
            return handleLayer
        }
        //組合神燈
        func addMagicLamp() -> CAShapeLayer{
            let magicLampLayer = CAShapeLayer()
            magicLampLayer.addSublayer(addPot())
            magicLampLayer.addSublayer(addLid())
            magicLampLayer.addSublayer(addLidTop())
            magicLampLayer.addSublayer(addBottom())
            magicLampLayer.addSublayer(addHandle())
            return magicLampLayer
        }
        
        //生一個神燈
        let  magicLamp1 = addMagicLamp()
        magicLamp1.setAffineTransform(CGAffineTransform(scaleX: 0.8, y: 0.8))
        magicLamp1.frame = CGRect(x: 20, y: 0, width: 300, height: 290)

        
        //神燈漸層底色
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.yellow.cgColor,UIColor.purple.cgColor]
        gradientLayer.frame = magicLamp1.frame
        

        //東西加到畫面上
        containerView.layer.addSublayer(gradientLayer)
        gradientLayer.mask = magicLamp1
        view.addSubview(containerView)
        
    
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
}
struct ContentView: View {
    var body: some View {
        DrawView()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






