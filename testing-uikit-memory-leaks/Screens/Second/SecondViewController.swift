//
//  SecondViewController.swift
//  testing-uikit-memory-leaks
//
//

import Combine
import UIKit

class SecondViewController: UIViewController {
    let viewModel: SecondViewModel
    var cancellables: Set<AnyCancellable> = []
    
    init(viewModel: SecondViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let sui = SecondView(viewModel: viewModel)
        view = container(with: sui)
        title = "Second"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.$seconds
            // .sink(receiveValue: log(seconds:)) // ~ memory leak ~
            .sink { [weak self] in self?.log(seconds: $0) }
            .store(in: &cancellables)
        
        viewModel.$finished
            .compactMap { $0 }
            // .sink(receiveValue: back) // ~ memory leak ~
            .sink { [weak self] in self?.goBack() }
            .store(in: &cancellables)
    }
}

private extension SecondViewController {
    func log(seconds: Int) {
        print("output", seconds)
    }
    
    func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
