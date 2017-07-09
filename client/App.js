import React from 'react';
import { MapView } from 'expo';

const MARKERS = [
  {
    coordinate: {
      latitude: 51.500,
      longitude: -0.172,
    }
  },
  {
    coordinate: {
      latitude: 51.500,
      longitude: -0.177,
    }
  },
  {
    coordinate: {
      latitude: 51.505,
      longitude: -0.172,
    }
  },
  {
    coordinate: {
      latitude: 51.505,
      longitude: -0.177,
    }
  },
];

export default class App extends React.Component {
  constructor() {
    super();

    this.state = {
      markers: MARKERS,
    };
  }

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
      >
        {this.state.markers.map((marker, i) => (
          <MapView.Marker
            key={i}
            coordinate={marker.coordinate}
            image={require('./assets/nugget.png')}
          />
        ))}
      </MapView>
    );
  }
}
