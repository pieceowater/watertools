//
//  StoreKitManager.swift
//  MoneyGuard
//
//  Created by yury mid on 28.06.2023.
//

import Foundation
import StoreKit
import SwiftUI

@MainActor
public class StoreKitManager: NSObject, ObservableObject {
    private var productIds: [String] {
        if let plistPath = Bundle.main.path(forResource: "Products", ofType: "plist"),
           let plist = FileManager.default.contents(atPath: plistPath) {
            let products = (try? PropertyListSerialization.propertyList(from: plist, format: nil) as? [String:String]) ?? [:]
            var productIds: [String] = []
            for product in products {
                productIds.append(product.value)
            }
            return productIds
        } else {
            return []
        }
    }

    @Published
    private(set) var products: [Product] = []
    private var productsLoaded = false
    
    @Published
    private(set) var purchasedProductIDs = Set<String>()

    public var hasUnlockedPro: Bool {
       return !self.purchasedProductIDs.isEmpty
    }
    
    private var updates: Task<Void, Never>? = nil
    
    private let entitlementManager: EntitlementManager

    public init(entitlementManager: EntitlementManager) {
        self.entitlementManager = entitlementManager
        super.init()
        SKPaymentQueue.default().add(self)
    }


    public deinit {
        updates?.cancel()
    }
    
    
    private func observeTransactionUpdates() -> Task<Void, Never> {
        Task(priority: .background) { [unowned self] in
            for await _ in StoreKit.Transaction.updates {
                await self.updatePurchasedProducts()
            }
        }
    }
    
    public func loadProducts() async throws {
        guard !self.productsLoaded else { return }
        self.products = try await Product.products(for: productIds)
        self.productsLoaded = true
    }

    public func purchase(_ product: Product) async throws -> Bool {
        let result = try await product.purchase()

        switch result {
        case let .success(.verified(transaction)):
            await transaction.finish()
            await self.updatePurchasedProducts()
            return true
        case let .success(.unverified(_, error)):
            print(error)
            return false
        case .pending:
            return false
        case .userCancelled:
            return false
        @unknown default:
            return false
        }
    }
    
    public func restorePurchase() async {
        do {
            try await AppStore.sync()
        } catch {
            print(error)
        }
    }
    
    public func updatePurchasedProducts() async {
        for await result in StoreKit.Transaction.currentEntitlements {
            guard case .verified(let transaction) = result else {
                continue
            }

            if transaction.revocationDate == nil {
                self.purchasedProductIDs.insert(transaction.productID)
            } else {
                self.purchasedProductIDs.remove(transaction.productID)
            }
        }

        self.entitlementManager.hasPro = !self.purchasedProductIDs.isEmpty
    }
    
}

extension StoreKitManager: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {

    }

    func paymentQueue(_ queue: SKPaymentQueue, shouldAddStorePayment payment: SKPayment, for product: SKProduct) -> Bool {
        return true
    }
}

public class EntitlementManager: ObservableObject {
    static let userDefaults = UserDefaults(suiteName: Bundle.main.bundleIdentifier)

    @AppStorage("hasPro", store: userDefaults)
    public var hasPro: Bool = false
    
    init(hasPro: Bool) {
        self.hasPro = hasPro
    }
}
