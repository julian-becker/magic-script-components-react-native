import React from 'react';
import { StyleSheet, Switch, Text, View } from 'react-native';
import { Scene3dView } from 'react-native-scene3d';

export default class App extends React.Component {
  state = { 
    debugNodesValue: false,
  }

  onSwitchValueChange = () => {
    const value = this.state.debugNodesValue ? false : true;
    this.setState({ debugNodesValue: value });
  }

  render() {
    return (
      <View style={styles.container}>
        <Text style={styles.titleText}>Sample React Native App</Text>
        <Scene3dView showStatistics={true} style={styles.scene3d}>
          <Text>Sample</Text>
        </Scene3dView>
        <View style={styles.footer}>
          <Text style={styles.footerText}>Render debug nodes</Text>
          <Switch
            value={this.state.debugNodesValue}
            style={styles.switch}
            onValueChange={this.onSwitchValueChange}
          />
        </View>
        
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: 'white',
  },
  titleText: {
    color: 'black',
    fontSize: 20,
    fontWeight: '900',
    fontStyle: 'normal',
    fontFamily: 'System',
    lineHeight: 41,
    marginTop: 44,
  },
  scene3d: {
    flex: 1,
    width: '100%',
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#555555',
  },
  footer: {
    width: '90%',
    height: 60,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'flex-end',
    marginBottom: 30,
  },
  footerText: {
    color: 'black',
    fontSize: 16,
    fontWeight: '400',
    fontStyle: 'normal',
    fontFamily: 'System',
  },
  switch: {
    marginLeft: 10,
  }
});
