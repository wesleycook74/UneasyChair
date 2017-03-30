import React from 'react';

const conference = React.createClass ({
  propTypes: {
    name: React.PropTypes.string,
    acronym: React.PropTypes.string
  },

    handleViewConference: function(e) {   
      // this.props.handleAddToCart(this.props.book.id); 
      console.log(this.props.conference)
  },

  render: function() {
    return(
      <tr className="entry" onClick={this.handleViewConference}>    
        <td>{this.props.conference.name}</td>
      </tr>
    )
  }
});

export default conference;