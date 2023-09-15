//
//  ViewController.swift
//  Jermidi_Jimmy_1_code_source_082023
//
//  Created by Jimmy JERMIDI on 22/08/2023.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    let imagePicker = UIImagePickerController()
    var selectedImageView: UIImageView?
    var plusImageView: UIImageView?
    

    @IBOutlet var mainView: UIView!
    @IBOutlet weak var renderingView: UIView!
    @IBOutlet weak var addView1: UIView!
    @IBOutlet weak var addButton1: UIButton!
    @IBOutlet weak var plusImage1: UIImageView!
    @IBOutlet weak var addImage1: UIImageView!
    @IBOutlet weak var addView2: UIView!
    @IBOutlet weak var addButton2: UIButton!
    @IBOutlet weak var plusImage2: UIImageView!
    @IBOutlet weak var addImage2: UIImageView!
    @IBOutlet weak var addView3: UIView!
    @IBOutlet weak var addButton3: UIButton!
    @IBOutlet weak var plusImage3: UIImageView!
    @IBOutlet weak var addImage3: UIImageView!
    @IBOutlet weak var addView4: UIView!
    @IBOutlet weak var addButton4: UIButton!
    @IBOutlet weak var plusImage4: UIImageView!
    @IBOutlet weak var addImage4: UIImageView!
    @IBOutlet weak var rectAddViewTop: UIView!
    @IBOutlet weak var addButtonTop: UIButton!
    @IBOutlet weak var addViewImageTop: UIImageView!
    @IBOutlet weak var plusViewImageTop: UIImageView!
    @IBOutlet weak var rectAddViewBottom: UIView!
    @IBOutlet weak var addButtonBottom: UIButton!
    @IBOutlet weak var addViewImageBottom: UIImageView!
    @IBOutlet weak var plusViewImageBottom: UIImageView!
    @IBOutlet weak var selectView1: UIView!
    @IBOutlet weak var selectedView1: UIImageView!
    @IBOutlet weak var selectButton1: UIButton!
    @IBOutlet weak var selectView2: UIView!
    @IBOutlet weak var selectedView2: UIImageView!
    @IBOutlet weak var selectedButton2: UIButton!
    @IBOutlet weak var selectView3: UIView!
    @IBOutlet weak var selectedView3: UIImageView!
    @IBOutlet weak var selectButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hideViews1()
        
        let swipeGestureRecognizerUp = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        swipeGestureRecognizerUp.direction = .up
        
        
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        mainView.addGestureRecognizer(swipeGestureRecognizerUp)
        
    }

    @IBAction func tapSelect1(_ sender: Any) {
        startOption1()
    }
    
    @IBAction func tapSelect2(_ sender: Any) {
        startOption2()
    }
    
    @IBAction func tapSelect3(_ sender: Any) {
        startOption3()
    }
    
    @IBAction func tapAdd1(_ sender: Any) {
        selectedImageView = addImage1
        plusImageView = plusImage1
        present(imagePicker, animated: true, completion: nil)

    }
    
    @IBAction func tapAdd2(_ sender: Any) {
        selectedImageView = addImage2
        plusImageView = plusImage2
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func tappAdd3(_ sender: Any) {
        selectedImageView = addImage3
        plusImageView = plusImage3
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func tappAdd4(_ sender: Any) {
        selectedImageView = addImage4
        plusImageView = plusImage4
        present(imagePicker, animated: true, completion: nil)    }
    
    @IBAction func tapAddTop(_ sender: Any) {
        selectedImageView = addViewImageTop
        plusImageView = plusViewImageTop
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func tapAddBottom(_ sender: Any) {
        selectedImageView = addViewImageBottom
        plusImageView = plusViewImageBottom
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    private func startOption1(){
        hideViews1()
        
    }
    
    private func startOption2(){
        hideViews2()
        
    }
    
    private func startOption3(){
        hideViews3()
        
    }
    
    private func hideViews1(){
        selectedView1.isHidden = false
        selectedView2.isHidden = true
        selectedView3.isHidden = true
        addView1.isHidden = true
        addView2.isHidden = true
        addView3.isHidden = false
        addView4.isHidden = false
        rectAddViewTop.isHidden = false
        rectAddViewBottom.isHidden = true
    }
    
    private func hideViews2(){
        selectedView1.isHidden = true
        selectedView2.isHidden = false
        selectedView3.isHidden = true
        addView1.isHidden = false
        addView2.isHidden = false
        addView3.isHidden = true
        addView4.isHidden = true
        rectAddViewTop.isHidden = true
        rectAddViewBottom.isHidden = false
    }
    
    private func hideViews3(){
        selectedView1.isHidden = true
        selectedView2.isHidden = true
        selectedView3.isHidden = false
        addView1.isHidden = false
        addView2.isHidden = false
        addView3.isHidden = false
        addView4.isHidden = false
        rectAddViewTop.isHidden = true
        rectAddViewBottom.isHidden = true
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImage = info[.originalImage] as? UIImage,let imageView = selectedImageView{
                
                let resizedImage = resizeImage(selectedImage, targetSize: imageView.frame.size)
                
                imageView.image = resizedImage
            }
        
        picker.dismiss(animated: true, completion: nil)
        plusImageView?.isHidden = true
        
    }
    
    func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        let aspectWidth = targetSize.width / size.width
        let aspectHeight = targetSize.height / size.height
        let scaleFactor = max(aspectWidth, aspectHeight)
        
        let newSize = CGSize(width: size.width * scaleFactor, height: size.height * scaleFactor)
        
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 0.0)
        
        let x = (targetSize.width - newSize.width) / 2
        let y = (targetSize.height - newSize.height) / 2
        
        image.draw(in: CGRect(x: x, y: y, width: newSize.width, height: newSize.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? image
    }
    
    @objc private func didSwipe(_ sender: UISwipeGestureRecognizer) {
        let renderer = UIGraphicsImageRenderer(size: renderingView.bounds.size)
        let image = renderer.image { ctx in
            renderingView.drawHierarchy(in: renderingView.bounds, afterScreenUpdates: true)
        }
        let item = [image]
        let activityController = UIActivityViewController(activityItems: item, applicationActivities: nil)
        present(activityController, animated: true)
    }


    
}

