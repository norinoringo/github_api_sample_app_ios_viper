import UIKit

class GitHubAPICell: UITableViewCell {
    // MARK: - Constants

    // デザインはMaterialDesginを参考(https://material.io/components/lists)
    private let baseMargin = 16.0
    // UIParts
    let apiTypeLabel = UILabel()

    // MARK: - Outlets

    // MARK: - Variables

    // MARK: - Actions

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViewUIParts()
        // すべてのパーツをaddSubviewしてから制約をつけないとクラッシュする
        initUIParts()
        accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        // セルの再利用するときにセルの初期化に関する処理をここに書く
    }
}

// MARK: - Private Methods

extension GitHubAPICell {
    private func addSubViewUIParts() {
        apiTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(apiTypeLabel)
    }

    private func initUIParts() {
        initAPITypeLabel()
    }

    private func initAPITypeLabel() {
        apiTypeLabel.topAnchor.constraint(equalTo: topAnchor, constant: baseMargin).isActive = true
        apiTypeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: baseMargin).isActive = true
        apiTypeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -baseMargin).isActive = true
        apiTypeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -baseMargin).isActive = true
    }

    private func setDetail(cellType: GithubAPITypeCell) {
        switch cellType {
        case .searchGitHubUser:
            apiTypeLabel.text = "GitHubユーザー検索"
        case .searchGitHubRepository:
            apiTypeLabel.text = "GitHubリポジトリ検索"
        }
    }
}

// MARK: - Public Methods

extension GitHubAPICell {
    func createCell(cellType: GithubAPITypeCell) {
        setDetail(cellType: cellType)
    }
}

// MARK: - Delegate Methods
