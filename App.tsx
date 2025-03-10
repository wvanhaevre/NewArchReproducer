import React from 'react';
import {
    NativeSyntheticEvent,
  SafeAreaView,
  StyleSheet, Text, View,
} from 'react-native';
import {
  default as NewArchView, NativeEvent1, NativeEvent2,
} from './src/specs/NewArchViewNativeComponent.ts';

function App(): React.JSX.Element {
  const [prop1Content, setProp1Content] = React.useState<string>('empty');
  const [prop2Content, setProp2Content] = React.useState<string>('empty');

  const nativeEvent1 = (event: NativeSyntheticEvent<NativeEvent1>) => {
    setProp1Content(event.nativeEvent.nativeEventContent);
  };
  const nativeEvent2 = (event: NativeSyntheticEvent<NativeEvent2>) => {
    setProp2Content(event.nativeEvent.nativeEventContent);
  };

  return (
      <SafeAreaView style={[StyleSheet.absoluteFill, styles.screen]}>
        <View style={styles.container}>
          <Text style={styles.text}>NewArch Reproducer</Text>
          <NewArchView
              style={styles.newarchview}
              prop1={{propContent: prop1Content}}
              prop2={{propContent: prop2Content}}
              onNativeEvent1={nativeEvent1}
              onNativeEvent2={nativeEvent2}
          />
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  screen: {
    backgroundColor: '#111',
  },
  container: {
    position: 'absolute',
    top: 60,
    left: 20,
    bottom: 20,
    right: 20,
    alignItems: 'flex-start',
    justifyContent: 'flex-start',
    backgroundColor: '#111',
  },
  text: {
    fontSize: 18,
    color: 'white',
  },
  newarchview: {
    overflow: 'hidden',
    position: 'absolute',
    top: 30,
    left: 0,
    bottom: 0,
    right: 0,
    backgroundColor: '#222',
  },
});

export default App;


/*
<NewArchView
              style={styles.newarchview}
              prop1={{prop1Value: 1.0}}
              prop2={{prop2Value: 2.0}}
              prop3={{prop3Value: 3.0}}
              onNativeEvent1={nativeEvent1}
              onNativeEvent2={nativeEvent2}
              onNativeEvent3={nativeEvent3}
          />
*/
