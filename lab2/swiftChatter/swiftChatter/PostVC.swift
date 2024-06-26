//
//  ViewController.swift
//  swiftChatter
//
//  Created by 李子恒 on 26-05-2024.
//

import UIKit

final class PostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private var videoUrl: URL?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var usernameLabel: UILabel!
    

    @IBOutlet weak var messageTextView: UITextView!
    
    @IBAction func submitChatt(_ sender: Any) {
        let chatt = Chatt(username: self.usernameLabel.text,
                          message: self.messageTextView.text,
                          imageUrl: nil,
                          videoUrl: videoUrl?.absoluteString)
        
        ChattStore.shared.postChatt(chatt, image: postImage.image)

        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func pickMedia(_ sender: Any) {
        presentPicker(.photoLibrary)
    }
    
    @IBAction func accessCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            presentPicker(.camera)
        } else {
            print("Camera not available. iPhone simulators don't simulate the camera.")
        }
    }
    
    private func presentPicker(_ sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = sourceType
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.mediaTypes = ["public.image","public.movie"]
        imagePickerController.videoMaximumDuration = TimeInterval(5) // secs
        imagePickerController.videoQuality = .typeHigh
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey : Any]) {
          if let mediaType = info[UIImagePickerController.InfoKey.mediaType] as? String {
              if mediaType  == "public.image" {
                  postImage.image = (info[UIImagePickerController.InfoKey.editedImage] as? UIImage ??
                                      info[UIImagePickerController.InfoKey.originalImage] as? UIImage)?
                      .resizeImage(targetSize: CGSize(width: 150, height: 181))
              } else if mediaType == "public.movie" {
                  videoUrl = info[UIImagePickerController.InfoKey.mediaURL] as? URL
                  // can convert to absoluteString ONLY after picker.dismiss
              }
          }
          picker.dismiss(animated: true, completion: nil)
      }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var postImage: UIImageView!
}

