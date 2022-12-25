//
//  ProfileDataFormViewViewModel.swift
//  TwitterClone
//
//  Created by Rıdvan Yılmaz on 24.12.2022.
//

import Foundation
import Combine

final class ProfileDataFormViewModel: ObservableObject {
    @Published var displayName: String?
    @Published var username: String?
    @Published var bio: String?
    @Published var avatarPath: String?
}
