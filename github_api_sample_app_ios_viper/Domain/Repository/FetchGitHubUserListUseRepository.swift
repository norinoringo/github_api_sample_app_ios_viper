protocol FetchGitHubUserListRepository {
    func fetchGitHubUserList(input: FetchGitHubUserListUseCaseInput, block: @escaping ([GitHubUser]?, Error?) -> Void)
}
