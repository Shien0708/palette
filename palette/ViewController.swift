//
//  ViewController.swift
//  palette
//
//  Created by 方仕賢 on 2021/12/29.
//

import UIKit

class ViewController: UIViewController {

    //Slider影響顏色的 IBOutlets
    @IBOutlet weak var redSlider: UISlider!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var alphaSlider: UISlider!
    
    //儲存圖片的 IBOutlets
    @IBOutlet weak var galleryImageView: UIImageView!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    //更換圖片的按鈕 IBOutlets
    @IBOutlet weak var spongebobButton: UIButton!
    
    @IBOutlet weak var patrickButton: UIButton!
    
    @IBOutlet weak var squidwardButton: UIButton!
    
    @IBOutlet weak var crabButton: UIButton!
    
    @IBOutlet weak var garyButton: UIButton!
    
    @IBOutlet weak var planktonButton: UIButton!
    
    let backgroundImages = ["spongebobHouse", "patrickHouse", "squidwardHouse", "crabHouse", "spongebobBedroom", "planktonHouse"]
    
    let images = ["spongebob", "patrick", "squidward", "crab", "gary", "plankton"]
    
    
    //暫存 slider 值的矩陣
    var spongebobColors: [Float] = [0.5, 0.5, 0.5, 0.5]
    var patrickColors: [Float] = [0.5, 0.5, 0.5, 0.5]
    var squidwardColors: [Float] = [0.5, 0.5, 0.5, 0.5]
    var crabColors: [Float] = [0.5, 0.5, 0.5, 0.5]
    var garyColors: [Float] = [0.5, 0.5, 0.5, 0.5]
    var planktonColors: [Float] = [0.5, 0.5, 0.5, 0.5]
    
    //從圖片矩陣讀取圖片的指數
    var imagesIndex = 0
    
    //自動播放器的變數
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        galleryImageView.image = UIImage(named: String(images[0]))
        
        backgroundImageView.image = UIImage(named: String(backgroundImages[0]))
    }
    
    //在自動變色方法中使用計時器重複換色
    func time() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {timer in self.randomColorAndStore()})
        
    }
    
    //給顏色 slider 隨機值的方法
    func setRandomValue() {
        
        let randomRed = Float.random(in: 0...1)
        let randomGreen = Float.random(in: 0...1)
        let randomBlue = Float.random(in: 0...1)
        let randomAlpha = Float.random(in: 0...1)
        
        redSlider.value = randomRed
        greenSlider.value = randomGreen
        blueSlider.value = randomBlue
        alphaSlider.value = randomAlpha
        
    }
    
    //使用隨機顏色上色並且暫存顏色的方法
    func randomColorAndStore() {
        
        setRandomValue()
        colorTheView()
        storeColors()
        
    }
    
    //在主要圖片上色的方法
    func colorTheView() {
        
        galleryImageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
    }
    
    //回歸原本狀態的方法
    func redo() {
        
        redSlider.value = 0.5
        greenSlider.value = 0.5
        blueSlider.value = 0.5
        alphaSlider.value = 0.5
        
        colorTheView()
        storeColors()
        
    }
    
    //暫存顏色的方法
    func storeColors() {
        switch imagesIndex {
        
        case 1:
            patrickColors[0] = redSlider.value
            patrickColors[1] = greenSlider.value
            patrickColors[2] = blueSlider.value
            patrickColors[3] = alphaSlider.value
            
        case 2:
            squidwardColors[0] = redSlider.value
            squidwardColors[1] = greenSlider.value
            squidwardColors[2] = blueSlider.value
            squidwardColors[3] = alphaSlider.value
            
        case 3:
            crabColors[0] = redSlider.value
            crabColors[1] = greenSlider.value
            crabColors[2] = blueSlider.value
            crabColors[3] = alphaSlider.value
            
        case 4:
            garyColors[0] = redSlider.value
            garyColors[1] = greenSlider.value
            garyColors[2] = blueSlider.value
            garyColors[3] = alphaSlider.value
            
        case 5:
            planktonColors[0] = redSlider.value
            planktonColors[1] = greenSlider.value
            planktonColors[2] = blueSlider.value
            planktonColors[3] = alphaSlider.value
            
        default:
            spongebobColors[0] = redSlider.value
            spongebobColors[1] = greenSlider.value
            spongebobColors[2] = blueSlider.value
            spongebobColors[3] = alphaSlider.value
            
        }
        
    }
    
    //當滑動人一滑桿時，會改變主要顏色的 Slider IBAction
    @IBAction func changeColor(_ sender: UISlider) {
        
        colorTheView()
        storeColors()
        
    }
    
    //改變圖片指數並更換圖片的方法
    func changeImageIndex(index: Int) {
        
        galleryImageView.image = UIImage(named: String(images[index]))
        
        backgroundImageView.image = UIImage(named: String(backgroundImages[index]))
    }
    
    //選擇角色按鈕後會顯示該角色的圖片及背景圖片，更新最近的slider值及背景顏色的 Button IBAction
    @IBAction func changeImage(_ sender: UIButton) {
        switch sender {
        
            case patrickButton:
            changeImageIndex(index: 1)
            imagesIndex = 1
            
            redSlider.value = patrickColors[0]
            greenSlider.value = patrickColors[1]
            blueSlider.value = patrickColors[2]
            alphaSlider.value = patrickColors[3]
            
            colorTheView()
    
            case squidwardButton:
            changeImageIndex(index: 2)
            imagesIndex = 2
            
            redSlider.value = squidwardColors[0]
            greenSlider.value = squidwardColors[1]
            blueSlider.value = squidwardColors[2]
            alphaSlider.value = squidwardColors[3]
            
            colorTheView()
            
            case crabButton:
            changeImageIndex(index: 3)
            imagesIndex = 3
            
            redSlider.value = crabColors[0]
            greenSlider.value = crabColors[1]
            blueSlider.value = crabColors[2]
            alphaSlider.value = crabColors[3]
            
            colorTheView()
            
            case garyButton:
            changeImageIndex(index: 4)
            imagesIndex = 4
            
            redSlider.value = garyColors[0]
            greenSlider.value = garyColors[1]
            blueSlider.value = garyColors[2]
            alphaSlider.value = garyColors[3]
            
           colorTheView()
            
            case planktonButton:
            changeImageIndex(index: 5)
            imagesIndex = 5
            
            redSlider.value = planktonColors[0]
            greenSlider.value = planktonColors[1]
            blueSlider.value = planktonColors[2]
            alphaSlider.value = planktonColors[3]
            
            colorTheView()
            
            default:
            changeImageIndex(index: 0)
            imagesIndex = 0
            
            redSlider.value = spongebobColors[0]
            greenSlider.value = spongebobColors[1]
            blueSlider.value = spongebobColors[2]
            alphaSlider.value = spongebobColors[3]
            
            colorTheView()
    }
    


}

    //按一下按鈕使用隨機顏色上色的 Button IBAction
    @IBAction func changeRandomly(_ sender: UIButton) {
        
        randomColorAndStore()
    }
    
    //按一下按鈕不斷使用隨機顏色上色的 Button IBAction
    @IBAction func autoChange(_ sender: UISwitch) {
        
        if sender.isOn {
            time()
        } else {
            timer?.invalidate()
        }
    }
    
    //按一下按鈕復原所有狀態的 Button IBAction
    @IBAction func repaint(_ sender: Any) {
        
        redo()
        
    }
    
}
