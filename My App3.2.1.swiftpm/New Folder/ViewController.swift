import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let imageView = UIImageView()
    let cameraButton = UIButton()
    
    let result = getDayOfYearAndTime()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the image view
        imageView.frame = CGRect(x: 50, y: 100, width: 300, height: 400)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        // Set up the button with an image
        cameraButton.frame = CGRect(x: 60, y: 260, width: 330, height: 330)
        cameraButton.setImage(UIImage(named: "Cam"), for: .normal) // Replace "camera_icon" with your image asset name
        cameraButton.imageView?.contentMode = .scaleAspectFit
        cameraButton.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
        view.addSubview(cameraButton)
    }
    
    @objc func openCamera() {
        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
            showAlert("Camera not available")
            return
        }
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true // Optional: Enable editing
        present(imagePicker, animated: true, completion: nil)
    }
    
    // Handle the selected image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image: UIImage?
        
        if let editedImage = info[.editedImage] as? UIImage {
            image = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            image = originalImage
        } else {
            image = nil
        }
        
        if let capturedImage = image {
            uploadImageToGitHub(
                image: capturedImage,
                accessToken: "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",
                repoOwner: "Hmanguyi",
                repoName: "Greenbabyrec",
                fileName: "hi baby \(accnum()) \(AppState.shared.typeofimage)  \(result.seconds)"
            )
        } else {
            print("Failed to load the image.")
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    private func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

