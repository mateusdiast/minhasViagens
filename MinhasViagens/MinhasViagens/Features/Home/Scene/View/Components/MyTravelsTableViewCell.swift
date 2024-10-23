//
//  MyTravelsTableViewCell.swift
//  MinhasViagens
//
//  Created by Mateus Dias on 21/10/24.
//

import UIKit

final class MyTravelsTableViewCell: UITableViewCell {
    
    static var identifier: String {String(describing: self)}
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(resource: .line).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            containerDerpature,
            lineView,
            containerArrival
        ])
        stack.backgroundColor = .clear
        stack.spacing = 25
        stack.axis = .vertical
        stack.distribution =  .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(resource: .line)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerDerpature: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var containerArrival: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var derpatureImage: UIImageView = {
        let image = UIImage(systemName: "airplane.departure")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var arrivelImage: UIImageView = {
        let image = UIImage(systemName: "airplane.arrival")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var chevronImage: UIImageView = {
        let image = UIImage(systemName: "chevron.right")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var derpatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Label"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var arrivelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Label"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(data: DataTravelsCell) {
        derpatureLabel.text = data.departure
        arrivelLabel.text = data.arrival
    }
    
    private func setupView(){
        buildViewHierarchy()
        setupConstraintsView()
        additionalSetup()
    }
    
    private func buildViewHierarchy(){
        addSubview(containerView)
        containerView.addSubview(containerStack)
        containerView.addSubview(chevronImage)
        containerDerpature.addSubview(derpatureImage)
        containerDerpature.addSubview(derpatureLabel)
        containerArrival.addSubview(arrivelImage)
        containerArrival.addSubview(arrivelLabel)
    }
    
    private func setupConstraintsView() {
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            chevronImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            chevronImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            containerStack.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            containerStack.trailingAnchor.constraint(equalTo: chevronImage.trailingAnchor, constant: -20),
            containerStack.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),

            
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            derpatureImage.centerYAnchor.constraint(equalTo: containerDerpature.centerYAnchor),
            derpatureImage.leadingAnchor.constraint(equalTo: containerDerpature.leadingAnchor, constant: 20),
            derpatureLabel.centerYAnchor.constraint(equalTo: containerDerpature.centerYAnchor),
            derpatureLabel.leadingAnchor.constraint(equalTo: derpatureImage.trailingAnchor, constant: 20),
         
            arrivelImage.centerYAnchor.constraint(equalTo: containerArrival.centerYAnchor),
            arrivelImage.leadingAnchor.constraint(equalTo: containerArrival.leadingAnchor, constant: 20),
            arrivelLabel.centerYAnchor.constraint(equalTo: containerArrival.centerYAnchor),
            arrivelLabel.leadingAnchor.constraint(equalTo: arrivelImage.trailingAnchor, constant: 20),
                    
        ])
    }
    
    private func additionalSetup(){
        backgroundColor = .clear
    }
    
    
}

