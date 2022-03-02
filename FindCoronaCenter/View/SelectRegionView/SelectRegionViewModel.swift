//
//  SelectRegionViewModel.swift
//  FindCoronaCenter
//
//  Created by Terry on 2022/03/02.
//

import Foundation
import Combine

//ObservableObject 컴바인에서 제공
// 외부에서 바라볼수 있는 오브젝트라고 선언하는 것
class SelectRegionViewModel:ObservableObject {
    @Published var centers = [Center.Sido: [Center]]()
    private var cancellables = Set<AnyCancellable>()
    
    init(centerNetwork: CenterNetwork = CenterNetwork()){
        centerNetwork.getCenterList()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] in
                guard case .failure(let error) = $0 else { return }
                print(error.localizedDescription)
                self?.centers = [Center.Sido: [Center]]()
            }, receiveValue: { [weak self] centers in
                self?.centers = Dictionary(grouping: centers) { $0.sido }
            })
            .store(in: &cancellables) // disposed(by: disposeBag
    }
}
