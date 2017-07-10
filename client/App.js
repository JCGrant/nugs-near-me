import React from 'react';
import { MapView } from 'expo';

console.ignoredYellowBox = ['Warning: View.propTypes'];

export default class App extends React.Component {
  constructor() {
    super();

    this.state = {
      shops: [],
    };
  }

  componentWillMount() {
    this._getShopsAsync();
  }

  _getShopsAsync = async () => {
    const response = await fetch('http://192.168.1.114:3000/shops');
    const shops = await response.json();
    this.setState({ shops });
  };

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
        {this.state.shops.map((shop, i) => (
          <MapView.Marker
            key={i}
            coordinate={shop.coordinate}
            image={require('./assets/nugget.png')}
          />
        ))}
      </MapView>
    );
  }
}
