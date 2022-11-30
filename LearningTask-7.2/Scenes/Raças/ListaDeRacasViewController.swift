//
//  ViewController.swift
//  LearningTask-7.2
//
//  Created by rafael.rollo on 13/05/2022.
//

import UIKit

class ListaDeRacasViewController: UICollectionViewController {

    var dogsAPI: DogsAPI?
    
    var raças: [Raça] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
        listaRaças()
    }
    
    private func listaRaças() {
        guard let dogsAPI = dogsAPI else { return }
        raças = dogsAPI.listaRaças()
    }

}

// MARK: - UICollectionViewDataSource implementations
extension ListaDeRacasViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return raças.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RaçaViewCell", for: indexPath) as? RaçaViewCell else {
            fatalError("Couldn't retrieve RaçaViewCell")
        }
        
        let raça = raças[indexPath.row]
        cell.raça = raça
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            return configureReusableHeaderView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
        default:
            fatalError("Tipo de view não suportador: \(kind))")
        }
    }
    
    func configureReusableHeaderView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "RacaSectionHeaderView", for: indexPath)
        return header
    }
}

// MARK: - UICollectionViewDelegateFlowLayout implementations
extension ListaDeRacasViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            fatalError("Esperado que a lista de raças trabalhe com base em UICollectionViewFlowLayout")
        }
        
        let itemsPerLine: CGFloat = 3
        
        let sectionMargins = flowLayout.sectionInset
        let itemsSpacing = flowLayout.minimumInteritemSpacing
        
        let utilArea = collectionView.bounds.width - (sectionMargins.left + sectionMargins.right) - itemsSpacing * (itemsPerLine - 1)
        
        let itemWidth = utilArea / itemsPerLine
        
        return CGSize(width: itemWidth, height: itemWidth * 1.26)
    }
}
