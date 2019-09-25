import React from 'react';

import GiphysIndexItem from './giphys_index_item';

class GiphysIndex extends React.Component {
  constructor(props) {
    super(props)
  }

  render() {
    // debugger
    const giphys = this.props.giphys.map((giphy) => {
      return <GiphysIndexItem key={giphy.id} giphy={giphy} />;
    });
    return (
      <ul>
        { giphys }
      </ul>
    );
  }
}

export default GiphysIndex;