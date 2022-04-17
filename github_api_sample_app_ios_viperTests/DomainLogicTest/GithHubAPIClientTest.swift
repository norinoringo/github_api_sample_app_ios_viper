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

    private func makeHTTPClientResult(statusCode: Int, json: String) -> Result<(Data, HTTPURLResponse), Error> {
        return .success((
            json.data(using: .utf8)!,
            HTTPURLResponse(url: URL(string: "https://api.github.com")!,
                            statusCode: statusCode,
                            httpVersion: nil,
                            headerFields: nil)!
        ))
    }
}

extension GitHubAPIClientTest {
    func testFetchGitHubRepositoryWithSucess() {
        let apiExpectation = expectation(description: "wait for finish")
        stubClient.result = makeHTTPClientResult(statusCode: 200,
                                                 json: GitHubRepositoryTest.exampleJson)
        let input = FetchGitHubRepositoryListUseCaseInput(searchKeyword: "テスト")
        githubAPIClient.fetchGitHubRepository(input: input) { result in
            switch result {
            case let .success(response):
                let repository = response.items.first
                XCTAssertEqual(repository?.repositoryName, "Backbone")
                XCTAssertEqual(repository?.language, "JavaScript")
                XCTAssertEqual(repository?.stargazersCount, 213)
                XCTAssertEqual(repository?.description, "Backbone ドキュメント日本語訳")
            case .failure:
                XCTFail("unexpected result:\(result)")
            }
            apiExpectation.fulfill()
        }
        wait(for: [apiExpectation], timeout: 3)
    }

    func testFetchGitHubRepositoryWithFailuerByConnectionError() {
        let apiExpectation = expectation(description: "wait for finish")
        stubClient.result = .failure(URLError(.cannotConnectToHost))
        let input = FetchGitHubRepositoryListUseCaseInput(searchKeyword: "テスト")
        githubAPIClient.fetchGitHubRepository(input: input) { result in
            switch result {
            case .failure(.connectionError):
                break
            default:
                XCTFail("unexpected result:\(result)")
            }
            apiExpectation.fulfill()
        }
        wait(for: [apiExpectation], timeout: 3)
    }

    func testFetchGitHubRepositoryWithResponseParseError() {
        let apiExpection = expectation(description: "wait for finish")
        stubClient.result = makeHTTPClientResult(statusCode: 200,
                                                 json: "{}")
        let input = FetchGitHubRepositoryListUseCaseInput(searchKeyword: "テスト")
        githubAPIClient.fetchGitHubRepository(input: input) { result in
            switch result {
            case .failure(.responseParseError):
                break
            default:
                XCTFail("unexpected result:\(result)")
            }
            apiExpection.fulfill()
        }
        wait(for: [apiExpection], timeout: 3)
    }
}
