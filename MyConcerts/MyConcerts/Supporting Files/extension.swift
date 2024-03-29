//
//  extension.swift
//  MyConcerts
//
//  Created by Guillaume Djaider Fornari on 28/06/2019.
//  Copyright © 2019 Guillaume Djaider Fornari. All rights reserved.
//

import Foundation
import UIKit

extension Notification.Name {
    static let error = Notification.Name("error")
    static let reloadFavorites = Notification.Name("reloadFavorites")
}

extension UIViewController {
    // Create an alertView
    func displayAlert(title: String, message: String) {
        DispatchQueue.main.async {
            let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }
    
    @objc func displayError(notification :Notification) {
        guard let dataError = notification.object as? [String] else {
            return
        }
        self.displayAlert(title: dataError[0], message: dataError[1])
    }
}

extension Optional where Wrapped == Data {
    
    // Check the url of an image and return it, if the url is incorrect return an default image
    var dataToUIImage: UIImage {
        if self != nil, let image = UIImage(data: self!) {
            return image
        }
        return  UIImage(named: "artistNotFound")!
    }
    
}

extension String {
    
    // Adjust the url and open it with safari
    var openSafari: Void {
        var checkOccurences = self.replacingOccurrences(of: "http://", with: "")
        checkOccurences = checkOccurences.replacingOccurrences(of: "https://", with: "")
        guard let url = URL(string: "https://" + checkOccurences) else {
            return
        }
        UIApplication.shared.open(url)
    }
    
    // Some functions for formate string to date
    
    var formateDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "EEEE MMM d yyyy"
        return  dateFormatter.string(from: date!)
    }
    
    var hoursToDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.date(from: self) ?? Date()
    }
    
    var stringToDate: Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: self) ?? Date()
    }
    
    var startDate: Date {
        return self.stringToDate
    }
}

extension Array where Element == Performance {
    var toArrayName: [Name] {
        var arrayName: [Name] = []
        for name in self {
            arrayName.append(Name(name: name.displayName))
        }
        return arrayName
    }
}

extension Optional where Wrapped == Int {
    
    // Check an optional Int and return it, if the Int is incorrect return nil
    var intToString: String? {
        guard(self != nil) else {
            return nil
        }
        return String(self!)
    }
    
}

extension Date {
    
    // Add 10 hours to an date
    var endDate: Date {
        return Calendar.current.date(byAdding: .hour, value: 10, to: self) ?? Date()
    }
}
