//
//  LoignPresenter.swift
//  HelpMe
//
//  Created by mohamed hashem on 2/13/20.
//  Copyright (c) 2020 mohamed hashem. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LoignPresentationLogic
{
  func presentSomething(response: Loign.Something.Response)
}

class LoignPresenter: LoignPresentationLogic
{
  weak var viewController: LoignDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Loign.Something.Response)
  {
    let viewModel = Loign.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
