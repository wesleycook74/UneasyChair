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
			})
			.catch(function (error) {
				console.log(error);
				alert('Cannot sort events: ', error);
		  });
    // Sends a search request again to update data
    axios.get('/users/search', {params: {query: this.props.initialSearch }})
    .then(function (response) {
      console.log(response)
      self.setState({ users: response.data.users});
    })
    .catch(function (error) {
      console.log(error);
      alert('Cannot sort events: ', error);
    });
  },

  handleRemoveFromContacts: function(user){
		var self = this;

		axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
    axios.defaults.headers.common['X-CSRF-Token'] =  ReactOnRails.authenticityToken();
		axios.delete('/connections/' + user.contact_id )
			.then(function (response) {
			})
			.catch(function (error) {
				console.log(error);
				alert('Cannot sort events: ', error);
		  });
    // Sends a search request again to update data
    axios.get('/users/search', {params: {query: this.props.initialSearch }})
    .then(function (response) {
      console.log(response)
      self.setState({ users: response.data.users });
    })
    .catch(function (error) {
      console.log(error);
      alert('Cannot sort events: ', error);
  });

  },

	handleSearch: function(users, currentSearch) {
		this.setState({ users: users.users });
    this.props.handleSearch(currentSearch)
	},

  render() {
    var users = [];
    console.log(this.state.users)
    this.state.users.forEach(function(user) {
      users.push(<User user={user}  signed_in = {this.props.signed_in}
                                    key={'user'+ user.id}
                                    handleAddToContacts={this.handleAddToContacts}
                                    handleRemoveFromContacts={this.handleRemoveFromContacts}/>);
    }.bind(this));
    console.log(this.state.initialSearch)
    return (
      <div className="parent">
        <div className="row">
          <div className="col-sm-4">
              <SearchBar handleSearch={this.handleSearch} initialSearch={this.state.initialSearch}/>
          </div>
				</div>
        <table className="table table-hover" width="auto">
          <thead>
            <tr>
              <th/> 
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