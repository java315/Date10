//
//  AddNewsViewController.swift
//  Date10
//
//  Created by zb-nju on 2021/1/24.
//

import UIKit

class AddPostViewController: UIViewController, UITextViewDelegate{
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var visiablitySwitch: UISwitch!
    @IBOutlet weak var imageCollection: UICollectionView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var addedPost: Post!
    var imagePicker: SJImagePickerController!
    var images = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        textView.delegate = self
        textView.text = "分享你和 ta 的生活..."
        textView.textColor = UIColor.lightGray
        self.imagePicker = SJImagePickerController(delegate: self)
        self.imagePicker.maximumSelectedPhotoCount = 9
        imageCollection.delegate = self
        imageCollection.dataSource = self
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
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            return
        }
//        let text = textView.text!
//        let photo = imageView.image
//        let visiable = visiablitySwitch.isOn
        
//        addedNews = News(text: text, photo: photo, visiable: visiable)
    }

}

extension AddPostViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollection.dequeueReusableCell(withReuseIdentifier: "AddImageCollectionViewCell", for: indexPath) as! AddImageCollectionViewCell
        cell.imageView.image = images[indexPath.row]
        print("load \(indexPath.row)")
        return cell
    }
    
    
}

extension AddPostViewController: SJImagePickerControllerDelegate{
    func imagePickerController(_ picker: SJImagePickerController, didFinishPickingMediaWithInfo info: [SJImagePickerController.InfoKey : Any]){
        dismiss(animated: true, completion: nil)
        images = info[.exportImage] as! [UIImage]
        var ip = [IndexPath]()
        for i in 0...images.count{
            ip.append(IndexPath(row: i, section: 0))
        }
        self.imageCollection.reloadData()
    }
    func imagePickerControllerDidCancel(_ picker: SJImagePickerController){
        dismiss(animated: true, completion: nil)
    }
}
