//
//  NewsDetailsViewController.swift
//  AppleNewsApp
//
//  Created by Anastasiya Omak on 22/11/2023.
//

import UIKit
import SDWebImage

class NewsDetailsViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private let scrollView: UIScrollView = {
        let element = UIScrollView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let scrollStackViewContainer: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 0
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let newsContainerView: UIView = {
        let element = UIView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let titleLabel: UILabel = {
        let element = UILabel()
        element.textAlignment = .left
        element.minimumScaleFactor = 0.5
        element.numberOfLines = 0
        element.font = .systemFont(ofSize: 30, weight: .bold)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let authorLabel: UILabel = {
        let element = UILabel()
        element.font = .systemFont(ofSize: 20)
        element.numberOfLines = 0
        element.textAlignment = .left
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let imageView: UIImageView = {
        let element = UIImageView()
        element.contentMode = .scaleAspectFit
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let contentLabel: UILabel = {
        let element = UILabel()
        element.numberOfLines = 0
        element.font = .systemFont(ofSize: 18)
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        applyConstraints()
    }
    
    // MARK: - Public Methods
    
    public func configureUI(with model: Article) {
        titleLabel.text = model.title
        authorLabel.text = "Author: \(model.author ?? "")"
        if let urlString = model.urlToImage, let url = URL(string: urlString) {
            imageView.sd_setImage(with: url)
        }
        contentLabel.text = model.content
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollStackViewContainer)
        
        scrollStackViewContainer.addArrangedSubview(newsContainerView)
        
        newsContainerView.addSubview(titleLabel)
        newsContainerView.addSubview(authorLabel)
        newsContainerView.addSubview(imageView)
        newsContainerView.addSubview(contentLabel)
    }
    
    private func applyConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollStackViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollStackViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollStackViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollStackViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollStackViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            newsContainerView.heightAnchor.constraint(equalToConstant: 600),
            
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            authorLabel.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            authorLabel.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor),
            
            imageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            
            contentLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15),
            contentLabel.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            contentLabel.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
}
