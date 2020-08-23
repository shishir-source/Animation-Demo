//
//  ViewController.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 16/5/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {
    
    //MARK:: - Properties
    
    var shapeLayer: CAShapeLayer!
    var pulsatingLayer: CAShapeLayer!
    
    lazy var percantageLabel: UILabel = {
        let label = UILabel()
        label.text = "Start"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textColor = .white
        return label
    }()
    
    let urlString = "https://images.unsplash.com/photo-1589886029031-466495b470bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1534&q=80"
    
    //MARK:: - LifeCycles
    
    private func setupNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc func handleEnterForeground(){
        animatePulsatingLayer()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNotificationObserver()
        
        view.backgroundColor = UIColor.backgroundColor
        
        animattionC()
    }
    
    private func animattionC(){
        
        pulsatingLayer = createCircleShapeLayer(strokeColor: .clear, fillColor: UIColor.pulsatingFillColor, line: 10)
        view.layer.addSublayer(pulsatingLayer)
        
        let trackLayer = createCircleShapeLayer(strokeColor: UIColor.trackStrokeColor, fillColor: UIColor.backgroundColor, line: 20)
        view.layer.addSublayer(trackLayer)
        
        animatePulsatingLayer()
        
        shapeLayer = createCircleShapeLayer(strokeColor: UIColor.outLineStrokeColor, fillColor: .clear, line: 20)
        shapeLayer.lineCap = .round
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0, 0, 1)
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        setupPercentageLabe()
    }
    
    private func setupPercentageLabe() {
        view.addSubview(percantageLabel)
        percantageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        percantageLabel.center = view.center
    }
    

    //MARK:: - Helper Funcstion
    
    private func createCircleShapeLayer(strokeColor: UIColor, fillColor: UIColor, line: CGFloat) -> CAShapeLayer {
        
        let circularPath = UIBezierPath(arcCenter: .zero, radius: 100, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        let layer = CAShapeLayer()
        layer.strokeColor = strokeColor.cgColor
        layer.path = circularPath.cgPath
        layer.lineWidth = line
        layer.fillColor = fillColor.cgColor
        layer.lineCap = .round
        layer.position = view.center
        
        return layer
        
    }
    
    private func animatePulsatingLayer() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        
        animation.toValue = 1.3
        animation.duration = 0.8
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.autoreverses = true
        animation.repeatCount = Float.infinity
        
        pulsatingLayer.add(animation, forKey: "pulsing")
    }
    
    private func beginDownloadingFile() {
        
        shapeLayer.strokeEnd = 0
        
        let configuration = URLSessionConfiguration.default
        let operationQueue = OperationQueue()
        
        let urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: operationQueue)
        
        guard let url = URL(string: urlString) else{return}
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
        
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("Finished")
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let percentage = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite )
        
        DispatchQueue.main.async {
            self.percantageLabel.text = "\(Int(percentage * 100)) %"
            self.shapeLayer.strokeEnd = percentage
        }
    }
    
    private func animateCirle() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "urSoBasic")
    }
    
    @objc private func handleTap() {
        
        beginDownloadingFile()
        
        animateCirle()
    }
    

}

//Extension

extension UIColor {
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(displayP3Red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static let backgroundColor = rgb(r: 21, g: 22, b: 33)
    static let outLineStrokeColor = rgb(r: 234, g: 46, b: 111)
    static let trackStrokeColor = rgb(r: 56, g: 25, b: 49)
    static let pulsatingFillColor = rgb(r: 86, g: 30, b: 63)
}


