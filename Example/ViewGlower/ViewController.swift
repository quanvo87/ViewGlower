//
//  ViewController.swift
//  ViewGlower
//
//  Created by quanvo87 on 01/05/2018.
//  Copyright (c) 2018 quanvo87. All rights reserved.
//

import UIKit
import ViewGlower

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!

    let viewGlower = ViewGlower()

    override func viewDidLoad() {
        super.viewDidLoad()

        // this is just to center the button
        button.centerImageAndButton(1, imageOnTop: true)
    }

    @IBAction func didTapButton(_ sender: Any) {
        viewGlower.glow(button.imageView)
    }
}

// https://gist.github.com/bleft/a1a7a39c3f90edefc5644369f918a74e
extension UIButton {
    func centerImageAndButton(_ gap: CGFloat, imageOnTop: Bool) {
        guard let imageView = self.imageView,
            let titleLabel = self.titleLabel else { return }

        let sign: CGFloat = imageOnTop ? 1 : -1;
        let imageSize = imageView.frame.size;
        self.titleEdgeInsets = UIEdgeInsetsMake((imageSize.height+gap)*sign, -imageSize.width, 0, 0);

        let titleSize = titleLabel.bounds.size;
        self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height+gap)*sign, 0, 0, -titleSize.width);
    }
}
