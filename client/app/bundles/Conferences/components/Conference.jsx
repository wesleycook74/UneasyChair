import React from 'react';

const conference = React.createClass ({
  propTypes: {
    name: React.PropTypes.string,
    acronym: React.PropTypes.string
  },

  render: function() {
    return(
      <tr className="entry">    
        <td>{this.props.conference.name}</td>
        <td>{this.props.conference.acronym}</td>
      </tr>
    )
  }
});

export default conference;