import XCTest

final class CalculatorUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {}

    func testExample() throws {
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func testFail() throws {
        app.launch()
        XCTFail("Failure from test")
    }
    
    func testSum() throws {
        app.launch()
        let button2 = app/*@START_MENU_TOKEN@*/.staticTexts["2"]/*[[".buttons[\"2\"].staticTexts[\"2\"]",".staticTexts[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch
        button2.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["+"]/*[[".buttons[\"+\"].staticTexts[\"+\"]",".staticTexts[\"+\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        button2.tap()
        app.buttons["="].tap()
        XCTAssert(app.buttons["resultString"].staticTexts["4"].exists)
    }

}
