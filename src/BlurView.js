
const React = require('react-native');

const {
  requireNativeComponent,
  Component,
  PropTypes
} = React;

class BlurView extends Component {
  render() {
    return <NativeBlurView {...this.props} />;
  }
}

BlurView.propTypes = {
  isVibrant: PropsTypes.boolean,
  blurType: PropTypes.string,
};

const NativeBlurView = requireNativeComponent('BlurView', BlurView);

module.exports = BlurView;
