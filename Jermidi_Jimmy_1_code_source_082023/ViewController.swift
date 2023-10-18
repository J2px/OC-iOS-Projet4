//
//  ViewController.swift
//  Jermidi_Jimmy_1_code_source_082023
//
//  Created by Jimmy JERMIDI on 22/08/2023.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var selectedButton: UIButton?
    let imagePicker = UIImagePickerController()
    var selectedImageView: UIImageView?
    var plusImageView: UIImageView?
    

    @IBOutlet var mainView: UIView!
   
    @IBOutlet weak var ImgButton1: UIButton!
    @IBOutlet weak var ImgButton2: UIButton!
    @IBOutlet weak var ImgButton3: UIButton!
    @IBOutlet weak var ImgButton4: UIButton!
    
    @IBOutlet weak var SelectButton1: UIButton!
    @IBOutlet weak var SelectButton2: UIButton!
    @IBOutlet weak var SelectButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        hideViews1()
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(imageButtonTapped(_:)))
        ImgButton1.addGestureRecognizer(tapGesture1)

                let tapGesture2 = UITapGestureRecognizer(target: self, action: #selector(imageButtonTapped(_:)))
        ImgButton2.addGestureRecognizer(tapGesture2)

                let tapGesture3 = UITapGestureRecognizer(target: self, action: #selector(imageButtonTapped(_:)))
        ImgButton3.addGestureRecognizer(tapGesture3)

                let tapGesture4 = UITapGestureRecognizer(target: self, action: #selector(imageButtonTapped(_:)))
        ImgButton4.addGestureRecognizer(tapGesture4)
       
        /*
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        */
  
        
        
       /* let swipeGestureRecognizerUp = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe(_:)))
        swipeGestureRecognizerUp.direction = .up
        
        
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        mainView.addGestureRecognizer(swipeGestureRecognizerUp)*/
        
    }

    @IBAction func tapSelect1(_ sender: Any) {
        hideViews1()
    }
    
    @IBAction func tapSelect2(_ sender: Any) {
        hideViews2()
    }
    
    @IBAction func tapSelect3(_ sender: Any) {
        hideViews3()
    }
    
  
    @objc func imageButtonTapped(_ sender: UITapGestureRecognizer) {
            selectedButton = sender.view as? UIButton
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            present(imagePicker, animated: true, completion: nil)
        }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage, let button = selectedButton {
                button.setBackgroundImage(image, for: .normal)
            }
            picker.dismiss(animated: true, completion: nil)
        }
    
    private func hideViews1(){
        ImgButton1.isHidden = false
        ImgButton2.isHidden = true
        ImgButton3.isHidden = false
        ImgButton4.isHidden = false
        //hideButtonBackground(button: SelectButton2)
        //hideButtonBackground(button: SelectButton3)
    }
    
    private func hideViews2(){
        ImgButton1.isHidden = false
        ImgButton2.isHidden = false
        ImgButton3.isHidden = false
        ImgButton4.isHidden = true
        //hideButtonBackground(button: SelectButton2)
        //hideButtonBackground(button: SelectButton3)

    }
    
    private func hideViews3(){
        ImgButton1.isHidden = false
        ImgButton2.isHidden = false
        ImgButton3.isHidden = false
        ImgButton4.isHidden = false
        //hideButtonBackground(button: SelectButton2)
        //hideButtonBackground(button: SelectButton3)
    }
    
    private func hideButtonBackground(button: UIButton){
        button.setBackgroundImage(nil, for: .normal)
    }
    
    /*  @IBAction func tapAdd1(_ sender: Any) {
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
          
      }*/
    
    /*func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
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
    }*/


    
}

