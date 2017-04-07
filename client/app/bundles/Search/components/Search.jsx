import React, { PropTypes } from 'react';
import axios from 'axios';
import Conferences from './Conferences/Conferences';
import Users from './Users/Users';
import SearchBar from './Conferences/SearchBar'

const Search = React.createClass ({
  getInitialState: function() {
        return { 
			searchParam: "conferences"
        };
  },  

  componentDidMount: function() {
    var self = this
	console.log(this.props.initialSearch)
  },

	handleSelectSearch: function(searchParam){
		this.setState({ searchParam: searchParam })
		console.log(this.state.searchParam);
	},

  render() {
		if(this.state.searchParam == "conferences"){
			return (
				<div className="parent">
					<div className="btn-group">
						<button type="button" className="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Search type <span className="caret"></span>
						</button>
						<ul className="dropdown-menu">
							<li onClick={() => this.handleSelectSearch("users")}><a>Users</a></li>
							<li onClick={() => this.handleSelectSearch("conferences")}><a>Conferences</a></li>
						</ul>


					</div>
					<Conferences />
				</div>
			);
		}
		else {
			return (
				<div className="parent">
					<div className="btn-group">
						<button type="button" className="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Search type <span className="caret"></span>
						</button>
						<ul className="dropdown-menu">
							<li onClick={() => this.handleSelectSearch("users")}><a>Users</a></li>
							<li onClick={() => this.handleSelectSearch("conferences")}><a>Conferences</a></li>
						</ul>


					</div>
					<Users />
				</div>
			);
		}
  }
});

export default Search;