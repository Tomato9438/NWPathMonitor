//
//  ViewController.swift
//  NWPathMonitorTest
//
//  Created by Susan on 2023/01/10.
//

import UIKit

class ViewController: UIViewController {
	// MARK: - Variables
	
	
	// MARK: - IBOutlet
	@IBOutlet weak var label0: UILabel!
	@IBOutlet weak var label1: UILabel!
	
	
	// MARK: - IBAction
	
	// MARK: - Life cyle
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		Network.shared.setUp()
		DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
			let isConnected = Network.shared.isConnected()
			self.label0.text = "Connected? \(isConnected)"
			self.label1.text = "Status: \(Network.shared.getStatus())"
		}
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
	}
}

