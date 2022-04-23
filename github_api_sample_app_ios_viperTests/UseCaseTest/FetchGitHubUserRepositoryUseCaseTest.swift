@testable import github_api_sample_app_ios_viper
import XCTest

class FetchGitHubUserRepositoryUseCaseTest: XCTestCase {
    var usecase: FetchGitHubUserRepositoryListUseCase!
    var stubClient: StubAPIClient!

    override func setUp() {
        super.setUp()
        stubClient = StubAPIClient()
        usecase = FetchGitHubUserRepositoryListUseCase(repository: GitHubAPIClient(httpClient: stubClient))
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

    private func makeGitHubUser() -> GitHubUser {
        let githubUser = GitHubUser(login: "",
                                    id: 0,
                                    nodeId: "",
                                    avatarUrl: "",
                                    gravatarId: "",
                                    url: "",
                                    htmlUrl: "",
                                    followersUrl: "",
                                    followingUrl: "",
                                    gistsUrl: "",
                                    starredUrl: "",
                                    subscriptionsUrl: "",
                                    organizationsUrl: "",
                                    reposUrl: "",
                                    eventsUrl: "",
                                    receivedEventsUrl: "",
                                    type: "",
                                    siteDomain: true)
        return githubUser
    }
}

extension FetchGitHubUserRepositoryUseCaseTest {
    func testFetchGitHubUserRepositoryListWirhSucesss() {
        let apiExpectation = expectation(description: "wait for finish")
        let input = FetchGitHubUserRepositoryListUseCaseInput(accessToken: "",
                                                              githubUser: makeGitHubUser())
        stubClient.result = makeHTTPClientResult(statusCode: 200,
                                                 json: GitHubUserRepositoryTest.exampleJson)
        usecase.fetchGitHubUserRepositoryList(input: input).then { result in
            XCTAssertEqual(result.gitHubUserRepository[0].repositoryName, "30daysoflaptops.github.io")
            XCTAssertEqual(result.gitHubUserRepository[0].language, "CSS")
            XCTAssertEqual(result.gitHubUserRepository[0].stargazersCount, 7)
            XCTAssertEqual(result.gitHubUserRepository[0].description, nil)
            XCTAssertEqual(result.gitHubUserRepository[0].fork, false)
            apiExpectation.fulfill()
        }.catch { error in
            XCTFail("unepected result:\(error)")
            apiExpectation.fulfill()
        }
        wait(for: [apiExpectation], timeout: 3)
    }

    func testFetchGitHubUserRepositoryListWirhFaile() {
        let apiExpectation = expectation(description: "wait for finish")
        let input = FetchGitHubUserRepositoryListUseCaseInput(accessToken: "",
                                                              githubUser: makeGitHubUser())
        stubClient.result = makeHTTPClientResult(statusCode: 200,
                                                 json: "")
        usecase.fetchGitHubUserRepositoryList(input: input).then { result in
            XCTFail("unepected result:\(result)")
            apiExpectation.fulfill()
        }.catch { _ in
            apiExpectation.fulfill()
        }
        wait(for: [apiExpectation], timeout: 3)
    }
}
