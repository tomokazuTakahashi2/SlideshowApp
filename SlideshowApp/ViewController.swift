//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Raphael on 2019/08/08.
//  Copyright © 2019 takahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ImageView: UIImageView!    
    
    let images = [
        UIImage(named: "1"),
        UIImage(named: "2"),
        UIImage(named: "3"),
        UIImage(named: "4"),
        UIImage(named: "5"),
        UIImage(named: "6"),
        UIImage(named: "7"),
        UIImage(named: "8"),
        UIImage(named: "9"),
        UIImage(named: "10"),
        UIImage(named: "11"),
        UIImage(named: "12"),
    ]
    var imageIndex = 0
    
    //遷移先にデータを渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.image = ImageView.image
    }
    
    //backImage(戻る)ボタン
    @IBOutlet weak var backImage: UIButton!
    @IBAction func backImage(_ sender: Any){
        
        if imageIndex == 0 {
            imageIndex = 11
        } else {
            imageIndex -= 1
        }
        ImageView.image = images[imageIndex]    }
    
    //nextImage(進む)ボタン
    @IBOutlet weak var nextImage: UIButton!
    @IBAction func nextImage(_ sender: Any) {

        if imageIndex == 11 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        ImageView.image = images[imageIndex]
    }
    
    //再生/停止ボタン
    
    var timer: Timer!
    //onTimer(インデックス番号11だったらインデックス番号０になる。そうでなかったら１ずつ足していく)
    @objc func onTimer(_ timer: Timer) {
        if imageIndex == 11 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        ImageView.image = images[imageIndex]
    }

    //self.timerがnilであればタイマーを作動させる
    @IBAction func startStop(_ sender: Any) {
        if self.timer == nil{
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
        //nilでなければタイマーを停止する
        } else {
            self.timer.invalidate()
            self.timer = nil
        }
        //タイマーが停止中(nil)であればbackimageとnextimageは有効(true)
        if self.timer == nil{
            backImage.isEnabled = true
            nextImage.isEnabled = true
        //タイマーが作動中(nilでない)であればbackimageとnextimageは無効（false）
        }else{
            backImage.isEnabled = false
            nextImage.isEnabled = false
        }
        
    }
    
}
