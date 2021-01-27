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
    @IBOutlet weak var banner: GXBanner!
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
        
        self.banner.backgroundColor = .none
        self.banner.autoTimeInterval = 3.0
        self.banner.dataSource = self
        self.banner.delegate = self
        self.banner.register(classCellType: GXBannerCell.self)
        self.banner.reloadData()
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
        if images.isEmpty{
            saveButton.isEnabled = false
        }
        else{
            saveButton.isEnabled = true
        }
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
        let text = textView.text!
        let visiable = visiablitySwitch.isOn
        let globalData = GlobalData.getInstance()
        
        addedPost = Post(poster: globalData.getCurrentUser()!.name, title: text, content: text, isPublic: visiable, address: "", liked: nil)
        addedPost.addImages(images: images)
    }

}

extension AddPostViewController: GXBannerDelegate, GXBannerDataSource{
    func numberOfItems() -> Int {
        return images.count
    }
    
    func banner(_ banner: GXBanner, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell: GXBannerCell = banner.dequeueReusableCell(for: indexPath)
            cell.contentView.layer.masksToBounds = true
            cell.contentView.layer.cornerRadius = 10
            cell.iconIView.image = images[indexPath.row]
            
            return cell
    }
    
    
}

extension AddPostViewController: SJImagePickerControllerDelegate{
    func imagePickerController(_ picker: SJImagePickerController, didFinishPickingMediaWithInfo info: [SJImagePickerController.InfoKey : Any]){
        dismiss(animated: true, completion: nil)
        images = info[.exportImage] as! [UIImage]
        banner.reloadData()
        }
    
    func imagePickerControllerDidCancel(_ picker: SJImagePickerController){
        dismiss(animated: true, completion: nil)
        images = []
    }
}
