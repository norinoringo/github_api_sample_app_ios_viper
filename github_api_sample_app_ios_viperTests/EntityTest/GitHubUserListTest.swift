import github_api_sample_app_ios_viper
import XCTest

class GitHubUserListTest: XCTestCase {
    static var exampleJson: String {
        return """
        [
          {
            "login": "mojombo",
            "id": 1,
            "node_id": "MDQ6VXNlcjE=",
            "avatar_url": "https://avatars.githubusercontent.com/u/1?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/mojombo",
            "html_url": "https://github.com/mojombo",
            "followers_url": "https://api.github.com/users/mojombo/followers",
            "following_url": "https://api.github.com/users/mojombo/following{/other_user}",
            "gists_url": "https://api.github.com/users/mojombo/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/mojombo/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/mojombo/subscriptions",
            "organizations_url": "https://api.github.com/users/mojombo/orgs",
            "repos_url": "https://api.github.com/users/mojombo/repos",
            "events_url": "https://api.github.com/users/mojombo/events{/privacy}",
            "received_events_url": "https://api.github.com/users/mojombo/received_events",
            "type": "User",
            "site_admin": false
          },
          {
            "login": "defunkt",
            "id": 2,
            "node_id": "MDQ6VXNlcjI=",
            "avatar_url": "https://avatars.githubusercontent.com/u/2?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/defunkt",
            "html_url": "https://github.com/defunkt",
            "followers_url": "https://api.github.com/users/defunkt/followers",
            "following_url": "https://api.github.com/users/defunkt/following{/other_user}",
            "gists_url": "https://api.github.com/users/defunkt/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/defunkt/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/defunkt/subscriptions",
            "organizations_url": "https://api.github.com/users/defunkt/orgs",
            "repos_url": "https://api.github.com/users/defunkt/repos",
            "events_url": "https://api.github.com/users/defunkt/events{/privacy}",
            "received_events_url": "https://api.github.com/users/defunkt/received_events",
            "type": "User",
            "site_admin": false
          },
          {
            "login": "bmizerany",
            "id": 46,
            "node_id": "MDQ6VXNlcjQ2",
            "avatar_url": "https://avatars.githubusercontent.com/u/46?v=4",
            "gravatar_id": "",
            "url": "https://api.github.com/users/bmizerany",
            "html_url": "https://github.com/bmizerany",
            "followers_url": "https://api.github.com/users/bmizerany/followers",
            "following_url": "https://api.github.com/users/bmizerany/following{/other_user}",
            "gists_url": "https://api.github.com/users/bmizerany/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/bmizerany/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/bmizerany/subscriptions",
            "organizations_url": "https://api.github.com/users/bmizerany/orgs",
            "repos_url": "https://api.github.com/users/bmizerany/repos",
            "events_url": "https://api.github.com/users/bmizerany/events{/privacy}",
            "received_events_url": "https://api.github.com/users/bmizerany/received_events",
            "type": "User",
            "site_admin": false
          }
        ]
        """
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let data = GitHubUserListTest.exampleJson.data(using: .utf8)!
        let githubUser = try jsonDecoder.decode([GitHubUser].self, from: data)

        XCTAssertEqual(githubUser[0].login, "mojombo")
        XCTAssertEqual(githubUser[0].id, 1)
        XCTAssertEqual(githubUser[0].nodeId, "MDQ6VXNlcjE=")
        XCTAssertEqual(githubUser[0].avatarUrl, "https://avatars.githubusercontent.com/u/1?v=4")
        XCTAssertEqual(githubUser[0].gravatarId, "")
        XCTAssertEqual(githubUser[0].url, "https://api.github.com/users/mojombo")
        XCTAssertEqual(githubUser[0].htmlUrl, "https://github.com/mojombo")
        XCTAssertEqual(githubUser[0].followersUrl, "https://api.github.com/users/mojombo/followers")
        XCTAssertEqual(githubUser[0].followingUrl, "https://api.github.com/users/mojombo/following{/other_user}")
        XCTAssertEqual(githubUser[0].gistsUrl, "https://api.github.com/users/mojombo/gists{/gist_id}")
        XCTAssertEqual(githubUser[0].starredUrl, "https://api.github.com/users/mojombo/starred{/owner}{/repo}")
        XCTAssertEqual(githubUser[0].organizationsUrl, "https://api.github.com/users/mojombo/orgs")
        XCTAssertEqual(githubUser[0].reposUrl, "https://api.github.com/users/mojombo/repos")
        XCTAssertEqual(githubUser[0].eventsUrl, "https://api.github.com/users/mojombo/events{/privacy}")
        XCTAssertEqual(githubUser[0].receivedEventsUrl, "https://api.github.com/users/mojombo/received_events")
        XCTAssertEqual(githubUser[0].type, "User")
        XCTAssertEqual(githubUser[0].siteDomain, false)

        XCTAssertEqual(githubUser[1].login, "defunkt")
        XCTAssertEqual(githubUser[2].login, "bmizerany")
    }
}
