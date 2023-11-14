import UIKit

class CellFlag: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    var selectedFlag : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        guard let imageToLoad = selectedFlag else{
            return
        }
        imageView.image = UIImage(named: imageToLoad)
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.sizeToFit()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    @objc func shareTapped(){
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else{
            print("No image found")
            return
        }
        let index = selectedFlag?.firstIndex(of: "@")
        let nameImage  = String(selectedFlag![..<index!]).capitalized
        
        let vc = UIActivityViewController(activityItems: [image, nameImage], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }



}
