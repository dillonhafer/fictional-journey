/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';
import React, {
  AppRegistry,
  Component,
  StyleSheet,
  Text,
  TouchableOpacity,
  View
} from 'react-native';

var {
  RNAlertTimer
} = require('NativeModules');


class FictionalJourney extends Component {
  handleClick() {
    console.log('touch')
    RNAlertTimer.writeFile(
        'MyFile.txt',                       // File name
        'Some Text',                        // File contents
        function errorCallback(results) {},
        function successCallback(results) {}
    );
  }

  render() {
    return (
      <View style={styles.container}>
        <TouchableOpacity onPress={this.handleClick.bind(this)}>
          <Text style={styles.instructions}>😂</Text>
        </TouchableOpacity>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    fontSize: 175,
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

AppRegistry.registerComponent('FictionalJourney', () => FictionalJourney);
