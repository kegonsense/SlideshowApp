//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 佐藤憲吾 on 2021/08/13.
//

import UIKit

class ResultViewController: UIViewController {
    // 2画面目のimageViewを、StoryboardでこのViewControllerにIBOutletとして接続しておく
    @IBOutlet weak var imageView: UIImageView!
    // 受け取るためのプロパティ（変数）を宣言しておく
    var x:UIImage! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = x
    }
    //拡大ボタン → イメージのサイズ変更
    @IBAction func kakudai(_ sender: Any) {
        
        //viewの横幅をイメージビューの横幅で割って、縮小率を計算
        let ratio = view.bounds.width / (x.size.width)

        //コンテキスト用意(UIGraphicsBeginImageContextWithOptions)
        UIGraphicsBeginImageContextWithOptions(CGSize(width: (x.size.width) * ratio, height: (x.size.height) * ratio), false, 0.0)
        
        //コンテキストに画像を描画する
        x.draw(in: CGRect(x: 0, y: 0, width: (x.size.width) * ratio, height: (x.size.height) * ratio))
        
        //コンテキストからイメージを生成する
        let ResizeImage = UIGraphicsGetImageFromCurrentImageContext()

        //イメージをビューに配置
        let kakudaiImageView = UIImageView(image: ResizeImage)

        // コンテキストを閉じる.
        UIGraphicsEndImageContext()

        //イメージビューをviewに配置
        view.addSubview(kakudaiImageView)
            }
           }
    // Do any additional setup after loading the view.

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
