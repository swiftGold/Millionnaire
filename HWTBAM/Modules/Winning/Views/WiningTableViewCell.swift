import UIKit

final class WiningTableViewCell: UITableViewCell {

    static let id = "WiningTableViewCell"
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let prizeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .white
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear

        setupLayout()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        contentView.addSubview(questionLabel)
        contentView.addSubview(prizeLabel)
    }
    
    func configure(model: WinModel, currentQuestion: Bool) {
        prizeLabel.text = model.prize
        questionLabel.text = model.number
        if currentQuestion {
            backgroundColor = .systemGreen
            prizeLabel.font = .boldSystemFont(ofSize: 25)
        } else {
            prizeLabel.backgroundColor = model.backgroundcolorLabel
        }
    }
    
}

extension WiningTableViewCell {
    func setupConstraint() {
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            questionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            questionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),

            prizeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            prizeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            prizeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            prizeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
        ])
    }
}
