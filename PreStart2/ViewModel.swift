//
//  ViewModel.swift
//  PreStart2
//
//  Created by Mauro Arantes on 07/02/2022.
//

import SwiftUI

struct Course: Hashable, Codable {
    let name: String
    let image: String
}

class CoursesListViewModel: ObservableObject {
    
    @Published var courses : [Course] = []
    
    func fetch() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else { return }
        URLSession.shared.getRequest(url: url, decoding: [Course].self) {result in
            switch result {
            case .success(let data):
                self.courses = data
            case .failure(let error):
                print(error)
            }
        }
//        let task = URLSession.shared.dataTask(with: url) {[weak self] data, _, error in
//            guard let data = data, error == nil else { return }
//            do {
//                let courses = try JSONDecoder().decode([Course].self, from: data)
//                DispatchQueue.main.async {
//                    self?.courses = courses
//                }
//            } catch {
//                print(error)
//            }
//        }
//        task.resume()
    }
}
