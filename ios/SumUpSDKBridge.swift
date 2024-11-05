

import Foundation
import SumUpSDK
import React

@objc(TestClass)
class TestClass: NSObject {
  func testMethod() {
    print("testMethod is called !")
  }
}

@objc(SumUpSDKBridge)
class SumUpSDKBridge: NSObject {
  
  func fromArrayToJSONString(_ array: [String: Any]) -> String {
    if let json = try? JSONSerialization.data(withJSONObject: array){
      if let string = String(data: json, encoding: .utf8) {
        return string
      }
    }
    return ""
  }
  
  @objc func setupApiKey(_ apiKey :String, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) -> Void {
    let isSetup = SumUpSDK.setup(withAPIKey: apiKey)
    if isSetup {
      resolve(true)
    } else {
      let error = NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: "Could not setup API Key"])
      reject("API_KEY_ERROR", "Could not setup API Key", error)
    }
  }
  
  @objc func logout(_ resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) -> Void {
    SumUpSDK.logout(completionBlock: {(success: Bool, error: Error?) in
      if success {
        resolve(true)
      } else {
        let message = error?.localizedDescription ?? "Error"
        let error = NSError(domain: "", code: 500, userInfo: [NSLocalizedDescriptionKey: message])
        reject("LOGOUT_ERROR", message, error)
      }
    })
  }
  
  @objc func login(_ token: String, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    if SumUpSDK.isLoggedIn {
      resolve(true)
    } else {
      SumUpSDK.login(withToken: token) {
        (success: Bool, error: Error?) in
        if success {
          resolve(true)
        } else {
          reject("LOGIN_ERROR", error?.localizedDescription, error)
        }
      }
    }
  }
  
  @objc func isLoggedIn(_ resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    resolve(SumUpSDK.isLoggedIn)
  }
  
  @objc func checkoutInProgress(_ resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    resolve(SumUpSDK.checkoutInProgress)
  }
  
  @objc func currentMerchant(_ resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    guard let merchant = SumUpSDK.currentMerchant else {
      reject("NO_MERCHANT_ERROR", "There is no current merchant", nil)
      return
    }
    
    resolve(["id": merchant.merchantCode, "description": merchant.description, "currencyCode": merchant.currencyCode])
  }
  
  @objc func checkout(_ amount: Double, title: String, currency: String, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
    let checkoutRequest = CheckoutRequest(total: NSDecimalNumber(value: amount), title: title,  currencyCode: currency)
    
    let windowScenes = UIApplication.shared.connectedScenes.compactMap { $0 as? UIWindowScene }
    let activeScenes = windowScenes.filter { $0.activationState == .foregroundActive }
    let firstActiveScene = activeScenes.first
    guard let viewController = firstActiveScene?.keyWindow?.rootViewController else {
      reject("NO_CONTROLLER_FOUND", "No ViewController found", nil)
      return
    }
    
    SumUpSDK.checkout(with: checkoutRequest, from: viewController) {(result, error) in
      if error != nil {
        reject("CHECKOUT_ERROR", error?.localizedDescription, error)
      } else if result != nil {
        resolve(self.fromArrayToJSONString(
          [
            "transactionCode": result?.transactionCode ?? "",
            "success": result?.success ?? true,
            "additionalInfo": result?.additionalInfo ?? [:]
          ]))
      } else {
        reject("CHECKOUT_FAILED", "The checkout failed", nil)
      }
    }

  }
  
  
}
