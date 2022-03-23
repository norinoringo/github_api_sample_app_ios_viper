import github_api_sample_app_ios_viper
import XCTest

class GitHubUserTest: XCTestCase {
    static var exampleJson: String {
        return """
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
         }
        """
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let data = GitHubUserTest.exampleJson.data(using: .utf8)!
        let githubUser = try jsonDecoder.decode(GitHubUser.self, from: data)

        XCTAssertEqual(githubUser.login, "mojombo")
        XCTAssertEqual(githubUser.id, 1)
        XCTAssertEqual(githubUser.nodeId, "MDQ6VXNlcjE=")
        XCTAssertEqual(githubUser.avatarUrl, "https://avatars.githubusercontent.com/u/1?v=4")
        XCTAssertEqual(githubUser.gravatarId, "")
        XCTAssertEqual(githubUser.url, "https://api.github.com/users/mojombo")
        XCTAssertEqual(githubUser.htmlUrl, "https://github.com/mojombo")
        XCTAssertEqual(githubUser.followersUrl, "https://api.github.com/users/mojombo/followers")
        XCTAssertEqual(githubUser.followingUrl, "https://api.github.com/users/mojombo/following{/other_user}")
        XCTAssertEqual(githubUser.gistsUrl, "https://api.github.com/users/mojombo/gists{/gist_id}")
        XCTAssertEqual(githubUser.starredUrl, "https://api.github.com/users/mojombo/starred{/owner}{/repo}")
        XCTAssertEqual(githubUser.organizationsUrl, "https://api.github.com/users/mojombo/orgs")
        XCTAssertEqual(githubUser.reposUrl, "https://api.github.com/users/mojombo/repos")
        XCTAssertEqual(githubUser.eventsUrl, "https://api.github.com/users/mojombo/events{/privacy}")
        XCTAssertEqual(githubUser.receivedEventsUrl, "https://api.github.com/users/mojombo/received_events")
        XCTAssertEqual(githubUser.type, "User")
        XCTAssertEqual(githubUser.siteDomain, false)
    }
}
