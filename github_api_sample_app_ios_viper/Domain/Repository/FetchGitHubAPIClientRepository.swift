protocol FetchGitHubAPIClientRepository {
    func fetchGitHubUserDetail(input: FetchGitHubUserDetailUseCaseInput, completion: @escaping (Result<GitHubUserDetail, GitHubClientError>) -> Void)
    func fetchGitHubUserList(input: FetchGitHubUserListUseCaseInput, completion: @escaping (Result<[GitHubUser], GitHubClientError>) -> Void)
    func fetchGitHubUserRepository(input: FetchGitHubUserRepositoryListUseCaseInput, completion: @escaping (Result<[GitHubUserRepositry], GitHubClientError>) -> Void)
    func fetchGitHubRepository(input: FetchGitHubRepositoryListUseCaseInput, completion: @escaping (Result<GitHubRepositry, GitHubClientError>) -> Void)
}
