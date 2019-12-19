//
//  ViewController.swift
//  Swift5Timer
//
//  Created by TakayaSugiyama on 2019/12/19.
//  Copyright © 2019 TakayaSugiyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var stratButton: UIButton!
    
    var count = Int()
    var timer = Timer()
    
    var imageArray = [UIImage]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        count = 0
        //stopボタンが押せなくする
        stopButton.isEnabled = false
        
        for i in 0..<5{
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        }
        
        imageView.image = imageArray[0]
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timeUpdate), userInfo: nil, repeats:true)
    }
    
    //0.2秒ごとに呼ばれる
    @objc func timeUpdate(){
        count += 1
        imageView.image = imageArray[count % 5]
    }


 
    @IBAction func stop(_ sender: Any) {
        //imageViewのimageの流れをストップする
        //stratボタンを押せるようにする
        stratButton.isEnabled = true
        stopButton.isEnabled = false
        timer.invalidate()
    }
    
    
    @IBAction func strat(_ sender: Any) {
        //imageViewにimageを反映させていく
        //stratボタンが押されたらstartボタンを押せなくする
        stratButton.isEnabled = false
        stopButton.isEnabled = true
        //stratTimerを呼ぶ
        startTimer()
    }
    
}

