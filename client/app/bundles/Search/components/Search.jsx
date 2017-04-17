import React, { PropTypes } from 'react';
import axios from 'axios';
import Conferences from './Conferences/Conferences';
import Users from './Users/Users';
import SearchBar from './Conferences/SearchBar'

const Search = React.createClass ({
	getInitialState: function() {
		return { 
			searchParam: "conferences",
			currentSearch: null
		};
	},  

	componentDidMount: function() {
		var self = this
		self.setState({currentSearch: this.props.search})
	},

	handleSelectSearch: function(searchParam){
		this.setState({ searchParam: searchParam })
	},

	handleSearch: function(currentSearch) {
		this.setState({currentSearch: currentSearch})
	},

  	render() {
	  	// This if block is needed since render is called before componentDidMount which sets currentSearch
	  	if(this.state.currentSearch == null) {
			console.log("made it")
			return(
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
					<Conferences initialSearch={this.props.search} handleSearch={this.handleSearch} />
				</div>
			);
		}
		//If-else blcok to switch between conferences and users components
		if(this.state.searchParam == "conferences") {
			return (
				<div className="parent">
					<div className="btn-group">
						<button type="button" className="btn btn-primary" onClick={() => this.handleSelectSearch("conferences")}>
							Conferences
						</button>
						<button type="button" className="btn btn-secondary" onClick={() => this.handleSelectSearch("users")}>
							Users
						</button>
					</div>
					<Conferences initialSearch={this.state.currentSearch} handleSearch={this.handleSearch}/>
				</div>
			);
		}
		else {
			console.log(this.state.currentSearch)
			return (
				<div className="parent">
					<div className="btn-group">
						<button type="button" className="btn btn-secondary" onClick={() => this.handleSelectSearch("conferences")}>
							Conferences
						</button>
						<button type="button" className="btn btn-primary" onClick={() => this.handleSelectSearch("users")}>
							Users
						</button>
					</div>
					<Users initialSearch={this.state.currentSearch}  handleSearch={this.handleSearch} signed_in={this.props.signed_in}/>
				</div>
			);
		}
  }
});

export default Search;