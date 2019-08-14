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
        UIImage(named: "eto_mark01_nezumi.png"),
        UIImage(named: "eto_mark02_ushi.png"),
        UIImage(named: "eto_mark03_tora.png"),
        UIImage(named: "eto_mark04_usagi.png"),
        UIImage(named: "eto_mark05_tatsu.png"),
        UIImage(named: "eto_mark06_hebi.png"),
        UIImage(named: "eto_mark07_uma.png"),
        UIImage(named: "eto_mark08_hitsuji.png"),
        UIImage(named: "eto_mark09_saru.png"),
        UIImage(named: "eto_mark10_tori.png"),
        UIImage(named: "eto_mark11_inu.png"),
        UIImage(named: "eto_mark12_inoshishi.png"),
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
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
     @IBOutlet weak var saiseiButton: UIButton!
    //self.timerがnilであればタイマーを作動させる
    @IBAction func startStop(_ sender: Any) {
        if self.timer == nil{
        self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(onTimer(_:)), userInfo: nil, repeats: true)
            //再生ボタンを「再生」に
            saiseiButton.setTitle("再生", for: .normal)
        //nilでなければタイマーを停止する
        } else {
            self.timer.invalidate()
            self.timer = nil
            //再生ボタンを「停止」に
            saiseiButton.setTitle("停止", for: .normal)
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
