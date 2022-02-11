//
//  Extension+View.swift
//  PreStart2
//
//  Created by Mauro Arantes on 08/02/2022.
//

import SwiftUI

extension View {
    
    func getImage(imageURL: String) -> Data? {
        var imageData: Data?
        let semaphore = DispatchSemaphore(value: 0)
        guard let url = URL(string: imageURL) else { return nil }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            imageData = data
            print("..",imageData ?? "No data")
            semaphore.signal()
        }
        task.resume()
        print("//",imageData ?? "No data")
        semaphore.wait()
        return imageData
    }

    
    
//    func fetchData(urlString: String) {
//        guard let url = URL(string: urlString) else { return }
//        let session = URLSession.shared
//        let task = session.dataTask(with: url) {data, response, error in
//            guard let httpURLReponse = response as? HTTPURLResponse, httpURLReponse.statusCode == 200 else {return}
//            guard let mimeType = response?.mimeType, mimeType.hasPrefix("image") else {return}
//            guard let data = data, error == nil else {return}
//            guard let image = UIImage(data: data) else {return}
//
//            DispatchQueue.main.async {
//                self.image = image
//            }
//        }
//        task.resume()
//    }
    
    
    
//    func getImage(from url: URL) {
//        let session = URLSession.shared
//        let task = session.dataTask(with: url) {data, response, error in
//            guard let httpURLReponse = response as? HTTPURLResponse, httpURLReponse.statusCode == 200 else {return}
//            guard let mimeType = response?.mimeType, mimeType.hasPrefix("image") else {return}
//            guard let data = data, error == nil else {return}
//            guard let image = UIImage(data: data) else {return}
//
//            DispatchQueue.main.async {
//                self.image = image
//            }
//        }
//        task.resume()
//    }
    
    
}
