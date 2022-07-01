//
//  ViewController.swift
//  Polecat
//
//  Created by Anatoliy on 21.06.2022.
//

import UIKit

class ViewController: UIViewController {

    let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var viewModel: PolecatViewModel?
    
    let customNavBar: UIView = {
        let navBar = UIView()
        navBar.translatesAutoresizingMaskIntoConstraints = false
        return navBar
    } ()
    
    // вычисляемые свойства
    lazy var buttonNavBar: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "cat"), for: .normal)
        button.addTarget(self, action: #selector(presentCat), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    } ()
    
    let labelNavBar: UILabel = {
        let label = UILabel()
        label.text = "Что бы показать киску - жямкни ->"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    let imageCat: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cat3")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    } ()
    
    
    let factCatLabel: UILabel = {
        let factLabel = UILabel()
        factLabel.translatesAutoresizingMaskIntoConstraints = false
        factLabel.lineBreakMode = .byTruncatingMiddle
        factLabel.numberOfLines = 10
        factLabel.text = "Хоть лев и считается царем зверей, но он не самый крупный представитель кошачьих. Гораздо крупнее льва тигры,вырастающие до трех метров и имеющие вес около трехсот килограммов. Тигр может съесть за один раз около 40 килограммов мяса."
        return factLabel
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
       // isHiddenCollection(ishidden: true)
    }
    
    @objc
    func presentCat(){
        Task {
            let model = await viewModel?.configureModel()
            print(model)
            self.imageCat.image = model?.image
            factCatLabel.text = model?.facts.first?.text
            collection.reloadData()
        }
        //        service.requestUrlCat(completion: {[weak self] _ in
        //                self?.imageCat.loadImage()})
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.arrayImage.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cellModel", for: indexPath) as? CollectionViewCell  else { return UICollectionViewCell() }
       // cell.icon = viewModel?.arrayImage[indexPath.row] ?? UIImage(systemName: "phone")!
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 100)
    }
}

//MARK: - Setting CollectionView
private extension ViewController {
    
    
    func setupCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
                flowLayout.minimumInteritemSpacing = 0.0
                flowLayout.minimumLineSpacing = 0.0
                flowLayout.scrollDirection = .horizontal
                collection.collectionViewLayout = flowLayout
        
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cellModel")
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .darkGray
        
        view.addSubview(customNavBar)
        view.addSubview(collection)
        view.addSubview(imageCat)
        view.addSubview(factCatLabel)
        customNavBar.addSubview(buttonNavBar)
        customNavBar.addSubview(labelNavBar)
        makeConstrainNavBar()
        makeConstraintLableNavBar()
        makeConstrintNavBarButton()
        constraintCollectionView()
        makeConstrainImage()
        makeConstraintFactLabel()
    }
    
    func constraintCollectionView() {
        NSLayoutConstraint.activate([
            collection.leftAnchor.constraint(equalTo: view.leftAnchor),
            collection.rightAnchor.constraint(equalTo: view.rightAnchor),
            collection.topAnchor.constraint(equalTo: customNavBar.bottomAnchor),
            collection.heightAnchor.constraint(equalToConstant: 112)
        ])
    }
    
    func isHiddenCollection(ishidden: Bool) {
        collection.isHidden = ishidden
    }
    
    func makeConstrainImage() {
        NSLayoutConstraint.activate([
            imageCat.topAnchor.constraint(equalTo: collection.bottomAnchor, constant: 8),
            imageCat.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            imageCat.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8),
            imageCat.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    func makeConstrainNavBar() {
        NSLayoutConstraint.activate([
            customNavBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            customNavBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            customNavBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            customNavBar.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    func makeConstraintLableNavBar() {
        NSLayoutConstraint.activate([
            labelNavBar.topAnchor.constraint(equalTo: customNavBar.topAnchor),
            labelNavBar.leftAnchor.constraint(equalTo: customNavBar.leftAnchor, constant: 16),
            labelNavBar.bottomAnchor.constraint(equalTo: customNavBar.bottomAnchor)
        ])
    }
    
    func makeConstrintNavBarButton() {
        NSLayoutConstraint.activate([
            buttonNavBar.topAnchor.constraint(equalTo: customNavBar.topAnchor,constant: 8),
            buttonNavBar.rightAnchor.constraint(equalTo: customNavBar.rightAnchor, constant: -8),
            buttonNavBar.bottomAnchor.constraint(equalTo: customNavBar.bottomAnchor, constant: -8),
            buttonNavBar.widthAnchor.constraint(equalToConstant: 36)
        ])
    }
    
    func makeConstraintFactLabel() {
        NSLayoutConstraint.activate([
            factCatLabel.topAnchor.constraint(equalTo: imageCat.bottomAnchor,constant: 8),
            factCatLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            factCatLabel.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -8),
            factCatLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        ])
    }
}
