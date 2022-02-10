//
//  PreStart2Tests.swift
//  PreStart2Tests
//
//  Created by Mauro Arantes on 07/02/2022.
//

import XCTest
@testable import PreStart2

// Naming structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior

//Testing structure: Given, When, Then (Assert)

class PreStart2Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_CourseImageViewModel_isLoading_shouldBeTrue() {
        // Given
        let c1: Course = Course(name: "Name1", image: "Image1")
        //When
        let vm = CourseImageViewModel(course: c1)
        //Then
        XCTAssertTrue(vm.isLoading)
    }

}
