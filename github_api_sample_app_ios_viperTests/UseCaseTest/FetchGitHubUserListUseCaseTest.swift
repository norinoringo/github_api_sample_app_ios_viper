@testable import github_api_sample_app_ios_viper
import XCTest

class FetchGitHubUserListUseCaseTest: XCTestCase {
    var usecase: FetchGitHubUserListUseCase!
    var stubClient: StubAPIClient!

    override func setUp() {
        super.setUp()
        stubClient = StubAPIClient()
        usecase = FetchGitHubUserListUseCase(repository: GitHubAPIClient(httpClient: stubClient))
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

extension FetchGitHubUserListUseCaseTest {
    func testFetchGitHubUserListWithSucess() {
        let apiExpectation = expectation(description: "wait for finish")
        let input = FetchGitHubUserListUseCaseInput(accessToken: "")
        stubClient.result = makeHTTPClientResult(statusCode: 200,
                                                 json: GitHubUserListTest.exampleJson)
        usecase.fetchGitHubUserList(input: input).then { result in
            XCTAssertEqual(result.gitHubUerList[0].login, "mojombo")
            XCTAssertEqual(result.gitHubUerList[0].id, 1)
            XCTAssertEqual(result.gitHubUerList[0].nodeId, "MDQ6VXNlcjE=")
            XCTAssertEqual(result.gitHubUerList[0].avatarUrl, "https://avatars.githubusercontent.com/u/1?v=4")
            XCTAssertEqual(result.gitHubUerList[0].gravatarId, "")
            XCTAssertEqual(result.gitHubUerList[0].url, "https://api.github.com/users/mojombo")
            XCTAssertEqual(result.gitHubUerList[0].htmlUrl, "https://github.com/mojombo")
            XCTAssertEqual(result.gitHubUerList[0].followersUrl, "https://api.github.com/users/mojombo/followers")
            XCTAssertEqual(result.gitHubUerList[0].followingUrl, "https://api.github.com/users/mojombo/following{/other_user}")
            XCTAssertEqual(result.gitHubUerList[0].gistsUrl, "https://api.github.com/users/mojombo/gists{/gist_id}")
            XCTAssertEqual(result.gitHubUerList[0].starredUrl, "https://api.github.com/users/mojombo/starred{/owner}{/repo}")
            XCTAssertEqual(result.gitHubUerList[0].organizationsUrl, "https://api.github.com/users/mojombo/orgs")
            XCTAssertEqual(result.gitHubUerList[0].reposUrl, "https://api.github.com/users/mojombo/repos")
            XCTAssertEqual(result.gitHubUerList[0].eventsUrl, "https://api.github.com/users/mojombo/events{/privacy}")
            XCTAssertEqual(result.gitHubUerList[0].receivedEventsUrl, "https://api.github.com/users/mojombo/received_events")
            XCTAssertEqual(result.gitHubUerList[0].type, "User")
            XCTAssertEqual(result.gitHubUerList[0].siteDomain, false)

            XCTAssertEqual(result.gitHubUerList[1].login, "defunkt")
            XCTAssertEqual(result.gitHubUerList[2].login, "bmizerany")
            apiExpectation.fulfill()
        }.catch { error in
            XCTFail("unexpectaed result:\(error)")
            apiExpectation.fulfill()
        }
        wait(for: [apiExpectation], timeout: 3)
    }

    func testFetchGitHubUserListWithFaile() {
        let apiExpectation = expectation(description: "wait for finish")
        let input = FetchGitHubUserListUseCaseInput(accessToken: "")
        stubClient.result = makeHTTPClientResult(statusCode: 200,
                                                 json: "")
        usecase.fetchGitHubUserList(input: input).then { result in
            XCTFail("unexpectaed result:\(result)")
            apiExpectation.fulfill()
        }.catch { _ in
            apiExpectation.fulfill()
        }
        wait(for: [apiExpectation], timeout: 3)
    }
}
