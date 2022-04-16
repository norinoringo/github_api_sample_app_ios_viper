protocol FetchGitHubAPIClientRepository {
    func fetchGitHubUserDetail(input: FetchGitHubUserDetailUseCaseInput, completion: @escaping (Result<GitHubUserDetail, Error>) -> Void)
    func fetchGitHubUserList(input: FetchGitHubUserListUseCaseInput, completion: @escaping (Result<[GitHubUser], Error>) -> Void)
    func fetchGitHubUserRepository(input: FetchGitHubUserRepositoryUseCaseInput, completion: @escaping (Result<[GitHubUserRepositry], Error>) -> Void)
    func fetchGitHubRepository(input: FetchGitHubRepositoryListUseCaseInput, completion: @escaping (Result<GitHubRepositry, Error>) -> Void)
}
