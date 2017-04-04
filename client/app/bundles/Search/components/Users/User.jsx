import React from 'react';

const User = React.createClass ({
  propTypes: {
    name: React.PropTypes.string,
    acronym: React.PropTypes.string
  },

  handleAddToContacts: function(e) {   
      this.props.handleAddToContacts(this.props.user); 
  },

  render: function() {

    return(
      <tr>   
        <td> {this.props.user.name} </td>
        <td> {this.props.user.affiliation} </td>
        <td>
            <a className="btn btn-primary btn-xs" onClick={this.handleAddToContacts}>
              Add to Contacts
            </a>
        </td> 
      </tr>
    );
  }
});

export default User;