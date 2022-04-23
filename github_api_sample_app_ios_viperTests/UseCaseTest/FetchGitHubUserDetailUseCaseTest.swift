@testable import github_api_sample_app_ios_viper
import XCTest

class FetchGitHubUserDetailUseCaseTest: XCTestCase {
    var usecase: FetchGitHubUserDetailUseCase!
    var stubClient: StubAPIClient!

    override func setUp() {
        super.setUp()
        stubClient = StubAPIClient()
        usecase = FetchGitHubUserDetailUseCase(repository: GitHubAPIClient(httpClient: stubClient))
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

extension FetchGitHubUserDetailUseCaseTest {
    func testFetchGitHubUserList() {
        let apiExpectaion = expectation(description: "wait for finish")
        stubClient.result = makeHTTPClientResult(statusCode: 200,
                                                 json: GitHubUserDetailTest.exampleJson)
        let input = FetchGitHubUserDetailUseCaseInput(accessToken: "test",
                                                      githubUser: makeGitHubUser())
        usecase.fetchGitHubUserList(input: input).then { result in
            XCTAssertEqual(result.gitHubUerDetail.login, "mojombo")
            XCTAssertEqual(result.gitHubUerDetail.avatarUrl, "https://avatars.githubusercontent.com/u/1?v=4")
            XCTAssertEqual(result.gitHubUerDetail.userFullName, "Tom Preston-Werner")
            XCTAssertEqual(result.gitHubUerDetail.followers, 22893)
            XCTAssertEqual(result.gitHubUerDetail.following, 11)
            apiExpectaion.fulfill()
        }.catch { error in
            XCTFail("unexpectaed result:\(error)")
            apiExpectaion.fulfill()
        }
        wait(for: [apiExpectaion], timeout: 3)
    }
}
