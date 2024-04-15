

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var speedChart: UIView!
    // Circle bar
    var a = CGFloat()
    let shapelayer = CAShapeLayer()
    var label = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDashboard(100, subvalue: Float(50), subView: speedChart)
    }

    
    //circle chats
    func userDashboard(_ totalValue: Float, subvalue: Float, subView: UIView){
        let radius1 = 58
        let radius2 = 62
        _ = 30
        let point: CGPoint = CGPoint(x:(subView.bounds.size.width/2), y:(subView.bounds.size.height/2))
        let left = subView.convert(point, from: subView)
        
        let tackLayer = CAShapeLayer()
        let start1 = CGFloat.pi / 2
        let end1 = -(2*CGFloat.pi + start1)
        
        let circularPath1 = UIBezierPath(arcCenter:left, radius: CGFloat(radius1), startAngle:-start1,endAngle:end1,clockwise:false)
        
        tackLayer.path = circularPath1.cgPath
        tackLayer.strokeColor = UIColor.init(hex: "272936").cgColor
        tackLayer.lineWidth = 12
        tackLayer.fillColor = UIColor.clear.cgColor
        tackLayer.lineCap = CAShapeLayerLineCap.round
        subView.layer.addSublayer(tackLayer)
        
        let registered = CGFloat(totalValue)
        let active = CGFloat(subvalue)
        
        let percentateValue:CGFloat = active * (100/registered)
        a = 2 * (percentateValue/100)
        self.label.removeFromSuperview()
        //label prog.
        label = UILabel(frame: CGRect(x: 0, y: 5, width: 100, height: 45))
        label.center = CGPoint(x:subView.bounds.size.width / 2.0, y:subView.bounds.size.height / 2.0)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.numberOfLines = 2
       
        let hours = subvalue / 60
        let hoursStr = "Hours"
        var displayValue = String(format:"%.2f \(hoursStr)",hours)
        if subvalue < 60 {
            displayValue = "\(subvalue) %"
        }
        label.text = "\(displayValue)"
        subView.addSubview(label)
        
        let start:CGFloat =  CGFloat.pi / 2
        let end:CGFloat = -(a*CGFloat.pi + start)
        
        let circularPath = UIBezierPath(arcCenter:left, radius: CGFloat(radius2), startAngle:-start,endAngle:end,clockwise:true)
        
        shapelayer.path = circularPath.cgPath
        if  subvalue > 0 {
           shapelayer.strokeColor = UIColor.init(hex: "0abe51").cgColor  // green
        }
        else {
            shapelayer.strokeColor = UIColor.clear.cgColor
        }
        shapelayer.lineWidth = 5
        shapelayer.fillColor = UIColor.clear.cgColor
        shapelayer.lineCap = CAShapeLayerLineCap.round
        shapelayer.strokeEnd = 0
        subView.layer.addSublayer(shapelayer)
        
        self.addUserFunction()
    }
    
    @objc func addUserFunction () {
        let basicAnimation = CABasicAnimation(keyPath:"strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 1
        //        basicAnimation.fillMode = kCAFillModeBackwards
        //        basicAnimation.fillMode = kCAFillModeBoth
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
            self.shapelayer.add(basicAnimation, forKey: "itIsBasic")
        //        shapelayer1.add(basicAnimation, forKey: "itIsBasic1")
    }

}








