import React from 'react';
import {Button, View} from 'react-native';

import {NativeModules} from 'react-native';

export default function App() {
  console.log('modules', NativeModules);
  //NativeModules.TestClass.testMethod();
  return (
    <View style={{alignItems: 'center', justifyContent: 'center', flex: 1}}>
      <Button title="CLIQUER" onPress={() => console.log('CLIQUÉ')} />
    </View>
  );
}
