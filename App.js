import React from 'react';
import { MapView } from 'expo';

export default class App extends React.Component {
  render() {
    return (
      <MapView
        style={{flex: 1}}
        initialRegion={{
          latitude: 51.5005149,
          longitude: -0.1773262,
          latitudeDelta: 0.0922,
          longitudeDelta: 0.0421,
        }}
      />
    );
  }
}
