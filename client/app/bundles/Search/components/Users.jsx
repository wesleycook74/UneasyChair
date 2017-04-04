import React, { PropTypes } from 'react';
import axios from 'axios';
import User from './User';
import SearchBar from './SearchBar'

const Users = React.createClass ({
  getInitialState: function() {
        return { 
          users: []
        };
  },  

  componentDidMount: function() {
    var self = this;

		axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
		axios.get('/users')
			.then(function (response) {
				console.log(response.data);
				self.setState({ users: response.data.users })
			})
			.catch(function (error) {
				console.log(error);
			});
  },


	handleSearch: function(users) {
		this.setState({ users: users });
	},

  render() {
    var users = [];

    console.log(this.state.users)

    this.state.users.forEach(function(user) {
      users.push(<User user={user}
                                    key={'user'+ user.id}/>);
    }.bind(this));

    return (
      <div className="parent">
        <div className="row">
					<div className="col-md-12">
						<SearchBar handleSearch={this.handleSearch} />
					</div>
				</div>
        <table className="table table-hover" width="auto">
          <thead>
            <tr>
              <th className="col-sm-2"><h3><strong>Name</strong></h3></th>                   
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

export default users;