//
//  LoignInteractor.swift
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

protocol LoignBusinessLogic
{
  func doSomething(request: Loign.Something.Request)
}

protocol LoignDataStore
{
  //var name: String { get set }
}

class LoignInteractor: LoignBusinessLogic, LoignDataStore
{
  var presenter: LoignPresentationLogic?
  var worker: LoignWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: Loign.Something.Request)
  {
    worker = LoignWorker()
    worker?.doSomeWork()
    
    let response = Loign.Something.Response()
    presenter?.presentSomething(response: response)
  }
}