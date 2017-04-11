import React, { PropTypes } from 'react';
import ReactOnRails from 'react-on-rails';
import axios from 'axios';
import User from './User';
import SearchBar from './SearchBar'

// import SearchBar from './SearchBar'

const Users = React.createClass ({
  getInitialState: function() {
        return { 
          users: [],
          initialSearch: this.props.initialSearch
        };
  },  

  componentDidMount: function() {
  },

  handleAddToContacts: function(user){
		var self = this;

		axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
    axios.defaults.headers.common['X-CSRF-Token'] =  ReactOnRails.authenticityToken();
		axios.post('/connections', {contact_id: user.id}, )
			.then(function (response) {
				console.log(response);
			})
			.catch(function (error) {
				console.log(error);
				alert('Cannot sort events: ', error);
		  });

  },


	handleSearch: function(users, currentSearch) {
		this.setState({ users: users });
    this.props.handleSearch(currentSearch)
	},

  render() {
    var users = [];

    this.state.users.forEach(function(user) {
      users.push(<User user={user}
                                    key={'user'+ user.id}
                                    handleAddToContacts={this.handleAddToContacts}/>);
    }.bind(this));
    console.log(this.state.initialSearch)
    return (
      <div className="parent">
        <div className="row">
          <div className="col-sm-4">
              <SearchBar handleSearch={this.handleSearch} initialSearch={this.state.initialSearch}/>
          </div>
				</div>
        <table className="table " width="auto">
          <thead>
            <tr>
              <th>UserName</th>
              <th>Name</th>
              <th>Affiliation</th>
              <th colSpan="3"></th>
            </tr>
          </thead>
          <tbody>
            {users}
          </tbody>
        </table>
      </div>
    );
  }
});

export default Users;