//
//  CellConfiguration.swift
//  Diffable
//
//  Created by J Oh on 7/19/24.
//

import UIKit
import SnapKit

final class CellConfiguration: UIView, UIContentView {
    var configuration: UIContentConfiguration
    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame:.zero)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


struct MyContentConfiguration : UIContentConfiguration {
    func makeContentView() -> UIView & UIContentView {
        return CellConfiguration(self)
    }
    func updated(for state: UIConfigurationState) -> MyContentConfiguration {
        return self
    }
}
