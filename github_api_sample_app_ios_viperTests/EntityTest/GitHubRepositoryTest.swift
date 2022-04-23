import github_api_sample_app_ios_viper
import XCTest

class GitHubRepositoryTest: XCTestCase {
    static var exampleJson: String {
        return """
        {
          "total_count": 1970,
          "incomplete_results": false,
          "items": [
            {
              "id": 6894523,
              "node_id": "MDEwOlJlcG9zaXRvcnk2ODk0NTIz",
              "name": "Backbone",
              "full_name": "enja-oss/Backbone",
              "private": false,
              "owner": {
                "login": "enja-oss",
                "id": 2903126,
                "node_id": "MDEyOk9yZ2FuaXphdGlvbjI5MDMxMjY=",
                "avatar_url": "https://avatars.githubusercontent.com/u/2903126?v=4",
                "gravatar_id": "",
                "url": "https://api.github.com/users/enja-oss",
                "html_url": "https://github.com/enja-oss",
                "followers_url": "https://api.github.com/users/enja-oss/followers",
                "following_url": "https://api.github.com/users/enja-oss/following{/other_user}",
                "gists_url": "https://api.github.com/users/enja-oss/gists{/gist_id}",
                "starred_url": "https://api.github.com/users/enja-oss/starred{/owner}{/repo}",
                "subscriptions_url": "https://api.github.com/users/enja-oss/subscriptions",
                "organizations_url": "https://api.github.com/users/enja-oss/orgs",
                "repos_url": "https://api.github.com/users/enja-oss/repos",
                "events_url": "https://api.github.com/users/enja-oss/events{/privacy}",
                "received_events_url": "https://api.github.com/users/enja-oss/received_events",
                "type": "Organization",
                "site_admin": false
              },
              "html_url": "https://github.com/enja-oss/Backbone",
              "description": "Backbone ドキュメント日本語訳",
              "fork": false,
              "url": "https://api.github.com/repos/enja-oss/Backbone",
              "forks_url": "https://api.github.com/repos/enja-oss/Backbone/forks",
              "keys_url": "https://api.github.com/repos/enja-oss/Backbone/keys{/key_id}",
              "collaborators_url": "https://api.github.com/repos/enja-oss/Backbone/collaborators{/collaborator}",
              "teams_url": "https://api.github.com/repos/enja-oss/Backbone/teams",
              "hooks_url": "https://api.github.com/repos/enja-oss/Backbone/hooks",
              "issue_events_url": "https://api.github.com/repos/enja-oss/Backbone/issues/events{/number}",
              "events_url": "https://api.github.com/repos/enja-oss/Backbone/events",
              "assignees_url": "https://api.github.com/repos/enja-oss/Backbone/assignees{/user}",
              "branches_url": "https://api.github.com/repos/enja-oss/Backbone/branches{/branch}",
              "tags_url": "https://api.github.com/repos/enja-oss/Backbone/tags",
              "blobs_url": "https://api.github.com/repos/enja-oss/Backbone/git/blobs{/sha}",
              "git_tags_url": "https://api.github.com/repos/enja-oss/Backbone/git/tags{/sha}",
              "git_refs_url": "https://api.github.com/repos/enja-oss/Backbone/git/refs{/sha}",
              "trees_url": "https://api.github.com/repos/enja-oss/Backbone/git/trees{/sha}",
              "statuses_url": "https://api.github.com/repos/enja-oss/Backbone/statuses/{sha}",
              "languages_url": "https://api.github.com/repos/enja-oss/Backbone/languages",
              "stargazers_url": "https://api.github.com/repos/enja-oss/Backbone/stargazers",
              "contributors_url": "https://api.github.com/repos/enja-oss/Backbone/contributors",
              "subscribers_url": "https://api.github.com/repos/enja-oss/Backbone/subscribers",
              "subscription_url": "https://api.github.com/repos/enja-oss/Backbone/subscription",
              "commits_url": "https://api.github.com/repos/enja-oss/Backbone/commits{/sha}",
              "git_commits_url": "https://api.github.com/repos/enja-oss/Backbone/git/commits{/sha}",
              "comments_url": "https://api.github.com/repos/enja-oss/Backbone/comments{/number}",
              "issue_comment_url": "https://api.github.com/repos/enja-oss/Backbone/issues/comments{/number}",
              "contents_url": "https://api.github.com/repos/enja-oss/Backbone/contents/{+path}",
              "compare_url": "https://api.github.com/repos/enja-oss/Backbone/compare/{base}...{head}",
              "merges_url": "https://api.github.com/repos/enja-oss/Backbone/merges",
              "archive_url": "https://api.github.com/repos/enja-oss/Backbone/{archive_format}{/ref}",
              "downloads_url": "https://api.github.com/repos/enja-oss/Backbone/downloads",
              "issues_url": "https://api.github.com/repos/enja-oss/Backbone/issues{/number}",
              "pulls_url": "https://api.github.com/repos/enja-oss/Backbone/pulls{/number}",
              "milestones_url": "https://api.github.com/repos/enja-oss/Backbone/milestones{/number}",
              "notifications_url": "https://api.github.com/repos/enja-oss/Backbone/notifications{?since,all,participating}",
              "labels_url": "https://api.github.com/repos/enja-oss/Backbone/labels{/name}",
              "releases_url": "https://api.github.com/repos/enja-oss/Backbone/releases{/id}",
              "deployments_url": "https://api.github.com/repos/enja-oss/Backbone/deployments",
              "created_at": "2012-11-28T01:56:38Z",
              "updated_at": "2021-08-25T07:19:56Z",
              "pushed_at": "2017-04-18T05:09:47Z",
              "git_url": "git://github.com/enja-oss/Backbone.git",
              "ssh_url": "git@github.com:enja-oss/Backbone.git",
              "clone_url": "https://github.com/enja-oss/Backbone.git",
              "svn_url": "https://github.com/enja-oss/Backbone",
              "homepage": "",
              "size": 273,
              "stargazers_count": 213,
              "watchers_count": 213,
              "language": "JavaScript",
              "has_issues": true,
              "has_projects": true,
              "has_downloads": true,
              "has_wiki": true,
              "has_pages": false,
              "forks_count": 32,
              "mirror_url": null,
              "archived": false,
              "disabled": false,
              "open_issues_count": 2,
              "license": null,
              "allow_forking": true,
              "is_template": false,
              "topics": [

              ],
              "visibility": "public",
              "forks": 32,
              "open_issues": 2,
              "watchers": 213,
              "default_branch": "master",
              "score": 1.0
            }
          ]
        }
        """
    }

    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let data = GitHubRepositoryTest.exampleJson.data(using: .utf8)!
        let githubRepository = try jsonDecoder.decode(GitHubRepositry.self, from: data)

        XCTAssertEqual(githubRepository.items[0].repositoryName, "Backbone")
        XCTAssertEqual(githubRepository.items[0].language, "JavaScript")
        XCTAssertEqual(githubRepository.items[0].stargazersCount, 213)
        XCTAssertEqual(githubRepository.items[0].description, "Backbone ドキュメント日本語訳")
    }
}
