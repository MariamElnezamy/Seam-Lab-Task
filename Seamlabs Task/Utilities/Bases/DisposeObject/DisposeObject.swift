//
//  DisposeObject.swift
//  Seamlabs Task
//
//  Created by Mariam on 05/09/2023.
//

import Combine

class DisposeObject {
    var deinitCalled: (() -> Void)?
    var cancellables: Set<AnyCancellable>

    init() {
        self.cancellables = Set<AnyCancellable>()
    }

    deinit {
        self.cancellables.removeAll()
        deinitCalled?()
    }
}
