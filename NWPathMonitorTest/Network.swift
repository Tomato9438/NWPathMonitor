//
//  Network.swift
//  NWPathMonitorTest
//
//  Created by Susan on 2023/01/10.
//

import Foundation
import Network

class Network {
	static let shared = Network()
	private let monitor = NWPathMonitor()
	func setUp() {
		monitor.pathUpdateHandler = { _ in
		}
		let queue = DispatchQueue(label: "Monitor")
		// ネットワーク監視開始
		monitor.start(queue: queue)
	}
	func isConnected() -> Bool {
		return monitor.currentPath.status == .satisfied
	}
	func getStatus() -> Int {
		if monitor.currentPath.usesInterfaceType(.wifi) {
			return 1
		}
		else if monitor.currentPath.usesInterfaceType(.cellular) {
			return 2
		}
		else if monitor.currentPath.usesInterfaceType(.wiredEthernet) {
			return 3
		}
		else if monitor.currentPath.usesInterfaceType(.loopback) {
			return 4
		}
		else {
			return 5
		}
	}
}

// https://qiita.com/kogepan159/items/09478dfa3d3007130297


