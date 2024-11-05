/**
 * @format
 */

import {AppRegistry} from 'react-native';
import App from './App';
import {name as appName} from './app.json';
import {NativeModules} from 'react-native';

console.log(NativeModules); // Vérifie si le module est présent

// const {SumUpSDKBridge} = NativeModules;

/*const SumUpSDK = {
  setupApiKey(apiKey) {
    return SumUpSDKBridge.setupApiKey(apiKey);
  },
  login(token) {
    return SumUpSDKBridge.login(token);
  },
  logout() {
    return SumUpSDKBridge.logout();
  },
  isLoggedIn() {
    return SumUpSDKBridge.isLoggedIn();
  },
  checkoutInProgress() {
    return SumUpSDKBridge.checkoutInProgress();
  },
  currentMerchant() {
    return SumUpSDKBridge.currentMerchant();
  },
  checkout(amount, title, currency) {
    return SumUpSDKBridge.checkout(amount, title, currency);
  },
};

export default SumUpSDK;*/

AppRegistry.registerComponent(appName, () => App);
