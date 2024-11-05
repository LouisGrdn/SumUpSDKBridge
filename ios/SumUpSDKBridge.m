#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(TestClass, NSObject)

RCT_EXTERN_METHOD(testMethod)

@end

//@interface RCT_EXTERN_MODULE(SumUpSDKBridge, NSObject)
//
//RCT_EXTERN_METHOD(setupApiKey:(NSString *)apiKey
//                  resolve:(RCTPromiseResolveBlock)resolve
//                  reject:(RCTPromiseRejectBlock)reject)
//
//RCT_EXTERN_METHOD(login:(NSString *)userToken
//                  resolve:(RCTPromiseResolveBlock)resolve
//                  reject:(RCTPromiseRejectBlock)reject)
//
//RCT_EXTERN_METHOD(isLoggedIn:(RCTPromiseResolveBlock)resolve
//                  reject:(RCTPromiseRejectBlock)reject)
//
//RCT_EXTERN_METHOD(checkoutInProgress:(RCTPromiseResolveBlock)resolve
//                  reject:(RCTPromiseRejectBlock)reject)
//
//RCT_EXTERN_METHOD(currentMerchant:(RCTPromiseResolveBlock)resolve
//                  reject:(RCTPromiseRejectBlock)reject)
//
//RCT_EXTERN_METHOD(checkout:(double)amount
//                  currency:(NSString *)currency
//                  resolve:(RCTPromiseResolveBlock)resolve
//                  reject:(RCTPromiseRejectBlock)reject)
//
//RCT_EXTERN_METHOD(prepareForCheckout:(RCTPromiseResolveBlock)resolve
//                  reject:(RCTPromiseRejectBlock)reject)
//
//RCT_EXTERN_METHOD(presentCheckoutPreferences:(RCTPromiseResolveBlock)resolve
//                  reject:(RCTPromiseRejectBlock)reject)
//
//@end
