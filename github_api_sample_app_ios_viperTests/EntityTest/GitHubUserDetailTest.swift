import github_api_sample_app_ios_viper
import XCTest

class GitHubUserDetailTest: XCTestCase {
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
          "site_admin": false,
          "name": "Tom Preston-Werner",
          "company": "@chatterbugapp, @redwoodjs, @preston-werner-ventures ",
          "blog": "http://tom.preston-werner.com",
          "location": "San Francisco",
          "email": null,
          "hireable": null,
          "bio": null,
          "twitter_username": "mojombo",
          "public_repos": 63,
          "public_gists": 62,
          "followers": 22893,
          "following": 11,
          "created_at": "2007-10-20T05:24:19Z",
          "updated_at": "2022-03-17T21:27:02Z"
        }
        """
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let data = GitHubUserDetailTest.exampleJson.data(using: .utf8)!
        let githubUserDetail = try jsonDecoder.decode(GitHubUserDetail.self, from: data)

        XCTAssertEqual(githubUserDetail.login, "mojombo")
        XCTAssertEqual(githubUserDetail.avatarUrl, "https://avatars.githubusercontent.com/u/1?v=4")
        XCTAssertEqual(githubUserDetail.name, "Tom Preston-Werner")
        XCTAssertEqual(githubUserDetail.followers, 22893)
        XCTAssertEqual(githubUserDetail.following, 11)
    }
}
