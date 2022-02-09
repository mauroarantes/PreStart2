//
//  CourseDataService.swift
//  PreStart2
//
//  Created by Mauro Arantes on 09/02/2022.
//

import Foundation
import Combine

class CourseDataService {
    
    @Published var courses: [Course] = []
    
    var courseSubscription: AnyCancellable?
    
    init() {
        getCourses()
    }
    
    private func getCourses() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else { return }
        
        courseSubscription = NetworkingManager.download(url: url)
            .decode(type: [Course].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCourses) in
                self?.courses = returnedCourses
                self?.courseSubscription?.cancel()
            })
    }
}
