import React from 'react';

class GiphysIndexItem extends React.Component {
  constructor(props) {
    super(props);
  }
  
  render() {
    const giphy = this.props.giphy
    return (
      <li className="giphy-li">
        <img src={giphy.images.fixed_height.url} />
      </li>
    )
  };
}

export default GiphysIndexItem;