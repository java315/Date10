//
//  ImageUtil.swift
//  Date10
//
//  Created by youngstudent2 on 2021/1/27.
//

import Foundation
import UIKit
class ImageUtil {
    static func getWebImage(_ url:String) -> UIImage? {
        do {
            guard let u = URL(string: url) else {
                print("url is nil")
                return nil
            }
            let data = try Data(contentsOf: u)
            let img = UIImage(data: data)
            return img
        } catch {
            print(error)
            return nil
        }
    }
}
