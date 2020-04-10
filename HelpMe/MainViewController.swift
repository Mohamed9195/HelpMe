//
//  MainViewController.swift
//  HelpMe
//
//  Created by mohamed hashem on 3/31/20.
//  Copyright © 2020 mohamed hashem. All rights reserved.
//

import UIKit
import Photos

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        var fetchOptions: PHFetchOptions = PHFetchOptions()
//
//        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
//
//        var fetchResult = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: fetchOptions)
//
//        if (fetchResult.lastObject != nil) {
//
//            var lastAsset: PHAsset = fetchResult.lastObject! as PHAsset
//
//            let arrayToDelete = NSArray(object: lastAsset)
//            PHPhotoLibrary.shared().performChanges({
//                PHAssetChangeRequest.deleteAssets(arrayToDelete)
//            }) { (success, failed) in
//                print("Finished deleting asset. %@", (success ? "Success" : failed))
//            }
//        }
        // Do any additional setup after loading the view.
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        return cell
    }

}
