import github_api_sample_app_ios_viper
import XCTest

class GitHubAPIErrorTest: XCTestCase {
    static var exampleJSON: String {
        return """
        {
          "message": "Validation Failed",
          "errors": [
            {
              "resource": "Search",
              "field": "q",
              "code": "missing"
            }
          ],
          "documentation_url": "https://docs.github.com/v3/search"
        }
        """
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let data = GitHubAPIErrorTest.exampleJSON.data(using: .utf8)!
        let error = try jsonDecoder.decode(GitHubAPIError.self, from: data)

        XCTAssertEqual(error.message, "Validation Failed")

        XCTAssertEqual(error.errors[0].resource, "Search")
        XCTAssertEqual(error.errors[0].field, "q")
        XCTAssertEqual(error.errors[0].code, "missing")
    }
}
