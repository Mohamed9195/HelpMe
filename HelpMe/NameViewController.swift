//
//  NameViewController.swift
//  HelpMe
//
//  Created by mohamed hashem on 3/14/20.
//  Copyright © 2020 mohamed hashem. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class NameViewController: UIViewController {

    @IBOutlet private weak var imageUserButton: UIButton!
    @IBOutlet private weak var userLabel: UILabel!
    @IBOutlet private weak var userNameLabel: UITextField!
    @IBOutlet private weak var ContinueButton: UIButton!
    @IBOutlet private weak var separator: UIView!

    fileprivate let disposeBag = DisposeBag()
    fileprivate var keyboardEventListener = KeyboardEventListener()

    override func viewDidLoad() {
        super.viewDidLoad()

        styleImageButton()
        keyboardEventListener.updateHeightBasedOnKeyboardEvent(for: self)

        userNameLabel.rx.text.asObservable()
            .subscribe(onNext: { [weak self] (text) in
                let trimmedText = text?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                if
                    let trimmedText = trimmedText,
                    trimmedText.isEmpty == false {
                    self?.activateContinueButton(status: true)
                } else {
                    self?.activateContinueButton(status: false)
                }
            }).disposed(by: disposeBag)

        userNameLabel.rx.controlEvent([.editingDidBegin]).asObservable().subscribe({ (_) in
            self.userNameLabel.placeholder = ""
            self.changeColorSeparatorView(#colorLiteral(red: 0, green: 0.6298658848, blue: 0.9208675027, alpha: 1), false, self.separator, self.userLabel)
        }).disposed(by: disposeBag)

        userNameLabel.rx.controlEvent([.editingDidEnd]).asObservable().subscribe({ (_) in
            self.userNameLabel.placeholder = NSLocalizedString("User Name", comment: "")
            if self.userNameLabel.text != "" {
                self.changeColorSeparatorView(#colorLiteral(red: 0, green: 0.6298658848, blue: 0.9208675027, alpha: 1), false, self.separator, self.userLabel)
                UserDefaults.standard.setValue(self.userNameLabel.text, forKey: "UserName")
                UserDefaults.standard.synchronize()
            } else {
                self.changeColorSeparatorView(#colorLiteral(red: 0.6470588235, green: 0.6470588235, blue: 0.6470588235, alpha: 1), true, self.separator, self.userLabel)
            }
        }).disposed(by: disposeBag)
    }

    private func changeColorSeparatorView(_ color: UIColor?, _ status: Bool, _ view: UIView!, _ label: UILabel!) {
        view.backgroundColor = color
        label.isHidden = status
    }

    private func activateContinueButton(status: Bool) {
        ContinueButton.isEnabled = status
    }

    fileprivate func styleImageButton() {
        imageUserButton.layer.cornerRadius = imageUserButton.frame.size.width / 2
        imageUserButton.layer.masksToBounds = true
        imageUserButton.imageView?.contentMode = imageUserButton.contentMode
    }

    fileprivate func showImagePicker(for sourceType: UIImagePickerController.SourceType) {
        let imagePicker: UIImagePickerController = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = sourceType
        imagePicker.allowsEditing = true

        present(imagePicker, animated: true, completion: nil)
    }

    @IBAction func takeImage(_ sender: UIButton) {
           let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

           if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
               alertController.addAction(UIAlertAction(title: NSLocalizedString("Take Photo", comment: ""), style: .default, handler: { [weak self] (_) in
                   self?.showImagePicker(for: .camera)
               }))
           }

           alertController.addAction(UIAlertAction(title: NSLocalizedString("Choose photo", comment: ""), style: .default, handler: { [weak self] (_) in
               self?.showImagePicker(for: .photoLibrary)
           }))

           alertController.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel))

           present(alertController, animated: true, completion: nil)
    }
}

extension NameViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)
        let originalImage: UIImage? = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage
        let editedImage: UIImage? = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.editedImage)] as? UIImage
        let image: UIImage = ((editedImage == nil) ? editedImage : originalImage)!.kf.resize(to: CGSize(width: 220, height: 220), for: .aspectFit)
        imageUserButton.setImage(image, for: .normal)
        let imageToData = image.pngData()
        UserDefaults.standard.set(imageToData, forKey: "userImage")
        UserDefaults.standard.synchronize()
        picker.dismiss(animated: true, completion: nil)
    }
}

// Helper function inserted by Swift 4.2 migrator.
private func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
    return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
private func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
    return input.rawValue
}
