//
//  MoviesViewModel.swift
//  SimplestreamTest
//
//  Created by Ivan Tsanev on 14/07/2021.
//

import Foundation
import UIKit
import AVFoundation
import MediaPlayer
import AVKit

enum VoidResult {
    case success
    case failure(Error)
}

protocol MoviesViewModelProtocol: AnyObject {
    
    func fetchData(completion: @escaping (VoidResult) -> Void)
    func didSelectItem(at index: Int, viewController: UIViewController)
    
    var contentTitle: String { get }
    var numberOfItems: Int { get }
    var videos: [Video] { get }
}

class MoviesViewModel: MoviesViewModelProtocol {
        
    //MARK: - Properties
    let networkManager: NetworkManagerProtocol
    var currentVideos: [Video]?
    var currentTitle: String?
    let url : String = "https://api.npoint.io/7fa288206895fb66528c"

    private lazy var player = AVPlayer()
    private lazy var playerViewController = AVPlayerViewController()

    var numberOfItems: Int {
        return currentVideos?.count ?? 0
    }

    var contentTitle: String {
        return currentTitle ?? ""
    }
    
    var videos: [Video] {
        return currentVideos ?? []
    }

    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func fetchData(completion: @escaping (VoidResult) -> Void) {
        
        networkManager.fetchCategories(fromURLString: url) { (result) in
            switch result {
            case .success(let data):
                do {
                    let category = try JSONDecoder().decode(Category.self, from: data)
                    self.currentVideos = category.videos
                    self.currentTitle = category.name
                    completion(.success)
                } catch let error {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func didSelectItem(at index: Int, viewController: UIViewController) {
        
        guard let videoSource = videos[index].sources.first,
              let sourceURL = URL(string: videoSource) else { return }

        player = AVPlayer(url: sourceURL)
        playerViewController.player = player
        viewController.present(playerViewController, animated: true) {
            self.playerViewController.player!.play()
        }
    }
}
