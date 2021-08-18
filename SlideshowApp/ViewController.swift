//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 佐藤憲吾 on 2021/08/06.
//

import UIKit

class ViewController: UIViewController {

    // outletの接続
    @IBOutlet weak var saisei: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!

    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0

    // スライドショーに使用するタイマーを宣言
    var timer: Timer!

    // スライドショーさせる画像の配列を宣言
    var imageArray:[UIImage] = [
        //imageArray[0]
        UIImage(named: "1")!,
        
        //imageArray[1]
        UIImage(named: "2")!,
        
        //imageArray[2]
        UIImage(named: "3")!
    ]


    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "1")!
        //右辺、変数名でもOK、imageView.image = imageArray[0]
        }
    
    // 再生ボタンを押した時の処理
    @IBAction func slideShowButton(_ sender: Any) {
        // 再生中か停止しているかを判定
        if timer == nil {
            
            // 再生時の処理を実装

            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            //#selectorが出てきたら@objcつける

            // ボタンの名前を停止に変える
                saisei.setTitle("停止", for: .normal)
            
            //再生/停止ボタンに連動させて進むと戻るのボタンも処理
            susumu.isEnabled = false
            modoru.isEnabled = false

        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer.invalidate()

            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil
            
            //再生/停止ボタンに連動させて進むと戻るのボタンも処理
            susumu.isEnabled = true
            modoru.isEnabled = true
            
            // ボタンの名前を再生に直しておく
            saisei.setTitle("再生", for: .normal)
        }
    }
        //@objcの意味について、セレクターで選択される関数にはつける(objective Cを噛ませている)
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1

        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    //画像をタップして画面遷移
    @IBAction func idou(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        
        if imageView.image == imageArray[0] {
            resultViewController.x = imageArray[0]
        }; if imageView.image == imageArray[1]{
            resultViewController.x = imageArray[1]
        }; if imageView.image == imageArray[2] {
            resultViewController.x = imageArray[2]
    }
}
    
    @IBOutlet weak var susumu: UIButton!
    
    //進むボタンについて
    @IBAction func go(_ sender: Any) {
        if nowIndex != 2{
        nowIndex += 1
        } else {
            nowIndex = 0
        }
        imageView.image = imageArray[nowIndex]
    }
    
    
    @IBOutlet weak var modoru: UIButton!
    
    //戻るボタンについて
    @IBAction func back(_ sender: Any) {
        
        if nowIndex != 0{
        nowIndex -= 1
        } else {
          nowIndex = 2
        }
        imageView.image = imageArray[nowIndex]
    }
    // 他の画面から segue を使って戻ってきた時に呼ばれる
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}
