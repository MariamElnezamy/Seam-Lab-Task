//
//  Environments.swift
//  Seamlabs Task
//
//  Created by Mariam on 05/09/2023.
//

import Foundation

public enum Environment: String, CaseIterable {
    case development
}

extension Environment {
    var serviceBaseUrl: String {
        switch self {
        case .development:
            return "\(APIConstants.baseURL.rawValue + APIConstants.home.rawValue)"
        }
    }
}
