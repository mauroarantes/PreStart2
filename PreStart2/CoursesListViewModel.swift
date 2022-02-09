//
//  CoursesListViewModel.swift
//  PreStart2
//
//  Created by Mauro Arantes on 09/02/2022.
//

import SwiftUI
import Combine

class CoursesListViewModel: ObservableObject {
    
    @Published var courses : [Course] = []
    
    var courseSubscription: AnyCancellable?
    
    private let dataService = CourseDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$courses
            .sink{ [weak self] (returnedCourses) in
                self?.courses = returnedCourses
            }
            .store(in: &cancellables)
    }
    
//    func fetch() {
//        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else { return }
//
//        courseSubscription = NetworkingManager.download(url: url)
//            .decode(type: [Course].self, decoder: JSONDecoder())
//            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCourses) in
//                self?.courses = returnedCourses
//                self?.courseSubscription?.cancel()
//            })
        
        
//        URLSession.shared.getRequest(url: url, decoding: [Course].self) {result in
//            switch result {
//            case .success(let data):
//                DispatchQueue.main.async {
//                    self.courses = data
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        
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
    
//func fetch closing bracket:
//    }
        
}
