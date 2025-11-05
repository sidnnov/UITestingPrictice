//
//  UITestingPracticeUITests.swift
//  UITestingPracticeUITests
//
//  Created by Tylechkin.Yuriy on 04.11.2025.
//

import XCTest

final class UITestingPracticeUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()

        let emailField = app.textFields["emailField"]
        let passwordField = app.secureTextFields["passwordField"]
        let loginButton = app.buttons["loginButton"]
        
        app.launch()
        
        //Проверка элементов на экране
        XCTAssertTrue(emailField.exists, "Поле email должно быть на экране")
        XCTAssertTrue(passwordField.exists, "Поле пароля должно быть на экране")
        XCTAssertTrue(loginButton.exists, "Поле входа должно быть на экране")
        
        emailField.tap()
        emailField.typeText("test@test.com")
        
        passwordField.tap()
        passwordField.typeText("123456")
        
        loginButton.tap()
        
        let welcomeText = app.staticTexts["welcomeText"]
        
        let exists = welcomeText.waitForExistence(timeout: 5)
        XCTAssertTrue(exists, "После входа должен появится приветственный текст")
        
        if exists {
            XCTAssertEqual(welcomeText.label, "Добро пожаловать!")
        }
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
