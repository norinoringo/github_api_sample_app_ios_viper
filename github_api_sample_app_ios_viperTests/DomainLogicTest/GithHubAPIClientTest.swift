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

    func testFetchGitHubRepositoryWithErrorResponse() {
        let apiExpection = expectation(description: "wait for finish")
        stubClient.result = makeHTTPClientResult(statusCode: 400,
                                                 json: GitHubAPIErrorTest.exampleJSON)
        let input = FetchGitHubRepositoryListUseCaseInput(searchKeyword: "テスト")
        githubAPIClient.fetchGitHubRepository(input: input) { result in
            switch result {
            case let .failure(.apiError(response)):
                let error = response.errors.first
                XCTAssertEqual(response.message, "Validation Failed")
                XCTAssertEqual(error?.resource, "Search")
                XCTAssertEqual(error?.field, "q")
                XCTAssertEqual(error?.code, "missing")
            default:
                XCTFail("unexpected result:\(result)")
            }
            apiExpection.fulfill()
        }
        wait(for: [apiExpection], timeout: 3)
    }
}

extension GitHubAPIClientTest {
    func testFetchGitHubUserListWithSuccess() {
        let apiExpectation = expectation(description: "wait for finish")
        stubClient.result = makeHTTPClientResult(statusCode: 200,
                                                 json: GitHubUserListTest.exampleJson)
        let input = FetchGitHubUserListUseCaseInput(accessToken: "test")
        githubAPIClient.fetchGitHubUserList(input: input) { result in
            switch result {
            case let .success(response):
                let githubUser = response.first
                XCTAssertEqual(githubUser?.login, "mojombo")
                XCTAssertEqual(githubUser?.id, 1)
                XCTAssertEqual(githubUser?.nodeId, "MDQ6VXNlcjE=")
                XCTAssertEqual(githubUser?.avatarUrl, "https://avatars.githubusercontent.com/u/1?v=4")
                XCTAssertEqual(githubUser?.gravatarId, "")
                XCTAssertEqual(githubUser?.url, "https://api.github.com/users/mojombo")
                XCTAssertEqual(githubUser?.htmlUrl, "https://github.com/mojombo")
                XCTAssertEqual(githubUser?.followersUrl, "https://api.github.com/users/mojombo/followers")
                XCTAssertEqual(githubUser?.followingUrl, "https://api.github.com/users/mojombo/following{/other_user}")
                XCTAssertEqual(githubUser?.gistsUrl, "https://api.github.com/users/mojombo/gists{/gist_id}")
                XCTAssertEqual(githubUser?.starredUrl, "https://api.github.com/users/mojombo/starred{/owner}{/repo}")
                XCTAssertEqual(githubUser?.organizationsUrl, "https://api.github.com/users/mojombo/orgs")
                XCTAssertEqual(githubUser?.reposUrl, "https://api.github.com/users/mojombo/repos")
                XCTAssertEqual(githubUser?.eventsUrl, "https://api.github.com/users/mojombo/events{/privacy}")
                XCTAssertEqual(githubUser?.receivedEventsUrl, "https://api.github.com/users/mojombo/received_events")
                XCTAssertEqual(githubUser?.type, "User")
                XCTAssertEqual(githubUser?.siteDomain, false)
            default:
                XCTFail("unexpected result:\(result)")
            }
            apiExpectation.fulfill()
        }
        wait(for: [apiExpectation], timeout: 3)
    }

    func testFetchGitHubUserListWithFailuerByConnectionError() {
        let apiExpectation = expectation(description: "wait for finish")
        stubClient.result = .failure(URLError(.cannotConnectToHost))

        let input = FetchGitHubUserListUseCaseInput(accessToken: "test")
        githubAPIClient.fetchGitHubUserList(input: input) { result in
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

    func testFetchGitHubUserListWithResponseParseError() {
        let apiExpectation = expectation(description: "wait for finish")
        stubClient.result = makeHTTPClientResult(statusCode: 200,
                                                 json: "{}")
        let input = FetchGitHubUserListUseCaseInput(accessToken: "test")
        githubAPIClient.fetchGitHubUserList(input: input) { result in
            switch result {
            case .failure(.responseParseError):
                break
            default:
                XCTFail("unexpected result:\(result)")
            }
            apiExpectation.fulfill()
        }
        wait(for: [apiExpectation], timeout: 3)
    }

    func testFetchGitHubUserListWithErrorResponse() {
        let apiExpectation = expectation(description: "wait for finish")
        stubClient.result = makeHTTPClientResult(statusCode: 400,
                                                 json: GitHubAPIErrorTest.exampleJSON)
        let input = FetchGitHubUserListUseCaseInput(accessToken: "test")
        githubAPIClient.fetchGitHubUserList(input: input) { result in
            switch result {
            case let .failure(.apiError(response)):
                let error = response.errors.first
                XCTAssertEqual(response.message, "Validation Failed")
                XCTAssertEqual(error?.resource, "Search")
                XCTAssertEqual(error?.field, "q")
                XCTAssertEqual(error?.code, "missing")
            default:
                XCTFail("unexpected result:\(result)")
            }
            apiExpectation.fulfill()
        }
        wait(for: [apiExpectation], timeout: 3)
    }
}

extension GitHubAPIClientTest {
    private func makeGitHubUser() -> GitHubUser {
        let githubUser = GitHubUser(login: "", id: 0, nodeId: "", avatarUrl: "", gravatarId: "", url: "", htmlUrl: "", followersUrl: "", followingUrl: "", gistsUrl: "", starredUrl: "", subscriptionsUrl: "", organizationsUrl: "", reposUrl: "", eventsUrl: "", receivedEventsUrl: "", type: "", siteDomain: true)
        return githubUser
    }

    func testFetchGitHubUserDetailWithSuccess() {
        let apiExpectation = expectation(description: "wait for finish")
        stubClient.result = makeHTTPClientResult(statusCode: 200,
                                                 json: GitHubUserDetailTest.exampleJson)
        let input = FetchGitHubUserDetailUseCaseInput(accessToken: "test",
                                                      githubUser: makeGitHubUser())
        githubAPIClient.fetchGitHubUserDetail(input: input) { result in
            switch result {
            case let .success(response):
                XCTAssertEqual(response.login, "mojombo")
                XCTAssertEqual(response.avatarUrl, "https://avatars.githubusercontent.com/u/1?v=4")
                XCTAssertEqual(response.userFullName, "Tom Preston-Werner")
                XCTAssertEqual(response.followers, 22893)
                XCTAssertEqual(response.following, 11)
            default:
                XCTFail("unexpected result:\(result)")
            }
            apiExpectation.fulfill()
        }
        wait(for: [apiExpectation], timeout: 3)
    }

    func testFetchGitHubUserDetailWithFailuerByConnectionError() {
        let apiExpectation = expectation(description: "wait for finish")
        stubClient.result = .failure(URLError(.cannotConnectToHost))
        let input = FetchGitHubUserDetailUseCaseInput(accessToken: "test",
                                                      githubUser: makeGitHubUser())
        githubAPIClient.fetchGitHubUserDetail(input: input) { result in
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

    func testFetchGitHubUserDetailWithResponseParseError() {
        let apiExpectation = expectation(description: "wait for finish")
        stubClient.result = makeHTTPClientResult(statusCode: 200,
                                                 json: "{}")
        let input = FetchGitHubUserDetailUseCaseInput(accessToken: "test",
                                                      githubUser: makeGitHubUser())
        githubAPIClient.fetchGitHubUserDetail(input: input) { result in
            switch result {
            case .failure(.responseParseError):
                break
            default:
                XCTFail("unexpected result:\(result)")
            }
            apiExpectation.fulfill()
        }
        wait(for: [apiExpectation], timeout: 3)
    }

    func testFetchGitHubUserDetailWithErrorResponse() {
        let apiExpectation = expectation(description: "wait for finish")
        stubClient.result = makeHTTPClientResult(statusCode: 400,
                                                 json: GitHubAPIErrorTest.exampleJSON)
        let input = FetchGitHubUserDetailUseCaseInput(accessToken: "test",
                                                      githubUser: makeGitHubUser())
        githubAPIClient.fetchGitHubUserDetail(input: input) { result in
            switch result {
            case let .failure(.apiError(response)):
                let error = response.errors.first
                XCTAssertEqual(response.message, "Validation Failed")
                XCTAssertEqual(error?.resource, "Search")
                XCTAssertEqual(error?.field, "q")
                XCTAssertEqual(error?.code, "missing")
            default:
                XCTFail("unexpected result:\(result)")
            }
            apiExpectation.fulfill()
        }
        wait(for: [apiExpectation], timeout: 3)
    }
}

extension GitHubAPIClientTest {
    func testFetchGitHubUserRepositoryWithSuccess() {}

    func testFetchGitHubUserRepositoryWithFailuerByConnectionError() {}

    func testFetchGitHubUserRepositoryWithResponseParseError() {}

    func testFetchGitHubUserRepositoryWithErrorResponse() {}
}
