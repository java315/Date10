//
//  AddNewsViewController.swift
//  Date10
//
//  Created by zb-nju on 2021/1/24.
//

import UIKit

class AddNewsViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var visiablitySwitch: UISwitch!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var addedNews: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textView.delegate = self
        textView.text = "分享你和 ta 的生活..."
        textView.textColor = UIColor.lightGray
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        if(textView.text == "分享你和 ta 的生活..."){
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        if textView.text.isEmpty {
            textView.text = "分享你和 ta 的生活..."
            textView.textColor = UIColor.lightGray
        }
//        if imageView.image == nil && textView.text.isEmpty{
//            saveButton.isEnabled = false
//        }
//        else{
//            saveButton.isEnabled = true
//        }
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        return
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        textView.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else{
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            return
        }
        let text = textView.text!
        
        let visiable = visiablitySwitch.isOn
        let g = GlobalData.getInstance()
        addedNews = Post(poster: g.getCurrentUser()!.name, title: text, content: text, isPublic: visiable, address: RandomUtil.randomChoice(Constant.Addresses), liked: false)
        
        if let photo = imageView.image {
            addedNews?.addImage(image: photo)
        }
        
    }

}
