@testable import github_api_sample_app_ios_viper
import XCTest

class GitHubAPIClientTest: XCTestCase {
    var stubClient: StubAPIClient!
    var githubAPIClient: GitHubAPIClient!

    override func setUp() {
        super.setUp()
        stubClient = StubAPIClient()
        githubAPIClient = GitHubAPIClient(httpClient: stubClient)
    }
}
