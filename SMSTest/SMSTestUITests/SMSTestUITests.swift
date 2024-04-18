//
//  SMSTestUITests.swift
//  SMSTestUITests
//
//  Created by Taylor McIntyre on 2024-04-18.
//

import server
import XCTest

final class SMSTestUITests: XCTestCase {
    var code: String?
    var task: Task<Void, any Error>?
    let server = Server()

    override func setUpWithError() throws {
        continueAfterFailure = false

        task = server.make { self.code = $0 }
    }

    override func tearDownWithError() throws {
        task?.cancel()
    }

    func testExample() async throws {
        let app = await XCUIApplication()
        await app.launch()
        
        try await Task.sleep(for: .seconds(10))
        print("hi")
        print(code ?? "none")
    }
}
