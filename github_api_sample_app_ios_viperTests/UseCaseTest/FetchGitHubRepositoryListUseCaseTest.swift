@testable import github_api_sample_app_ios_viper
import XCTest

class FetchGitHubRepositoryListUseCaseTest: XCTestCase {
    var stubAPIClient: StubAPIClient!
    var fetchGitHubRepositoryListUseCase: FetchGitHubRepositoryListUseCase!

    override func setUp() {
        super.setUp()
        stubAPIClient = StubAPIClient()
        fetchGitHubRepositoryListUseCase = FetchGitHubRepositoryListUseCase(repository: GitHubAPIClient(httpClient: stubAPIClient))
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

extension FetchGitHubRepositoryListUseCaseTest {
    func testFetchGitHubRepositoryWithSuccess() {
        let apiExpectaion = expectation(description: "wait for finish")
        stubAPIClient.result = makeHTTPClientResult(statusCode: 200,
                                                    json: GitHubRepositoryTest.exampleJson)
        let input = FetchGitHubRepositoryListUseCaseInput(searchKeyword: "test")
        fetchGitHubRepositoryListUseCase.fetchGitHubRepository(input: input).then { result in
            let repository = result.githubRepository.items.first
            XCTAssertEqual(repository?.repositoryName, "Backbone")
            XCTAssertEqual(repository?.language, "JavaScript")
            XCTAssertEqual(repository?.stargazersCount, 213)
            XCTAssertEqual(repository?.description, "Backbone ドキュメント日本語訳")
            apiExpectaion.fulfill()
        }.catch { error in
            XCTFail("unexpected result:\(error)")
            apiExpectaion.fulfill()
        }
        wait(for: [apiExpectaion], timeout: 3)
    }

    func testFetchGitHubRepositoryWithFaile() {
        let apiExpectaion = expectation(description: "wait for finish")
        stubAPIClient.result = makeHTTPClientResult(statusCode: 200,
                                                    json: "")
        let input = FetchGitHubRepositoryListUseCaseInput(searchKeyword: "test")
        fetchGitHubRepositoryListUseCase.fetchGitHubRepository(input: input).then { result in
            XCTFail("unexpected result:\(result)")
            apiExpectaion.fulfill()
        }.catch { _ in
            apiExpectaion.fulfill()
        }
        wait(for: [apiExpectaion], timeout: 3)
    }
}
