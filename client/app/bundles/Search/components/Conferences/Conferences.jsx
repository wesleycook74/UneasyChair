import React, { PropTypes } from 'react';
import axios from 'axios';
import Conference from './Conference';
import SearchBar from './SearchBar'

const Conferences = React.createClass ({
  getInitialState: function() {
        return { 
          conferences: [],
          initialSearch: this.props.initialSearch
        };
  },  

  componentDidMount: function() {
    var self = this;

  },

	handleSearch: function(conferences) {
    console.log(conferences)
		this.setState({ conferences: conferences });
	},

  handleView: function(conference){
		var self = this;

		axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
    axios.defaults.headers.common['X-CSRF-Token'] =  ReactOnRails.authenticityToken();
		axios.get('/conferences/' + conference.id )
			.then(function (response) {
				console.log(response);
			})
			.catch(function (error) {
				console.log(error);
				alert('Cannot sort events: ', error);
		  });

  },

  render() {
    
    var conferences = [];

    this.state.conferences.forEach(function(conference) {
      conferences.push(<Conference conference={conference}
                                    handleView={this.handleView}
                                    key={'conference'+ conference.id}/>);
    }.bind(this));
    console.log(this.props.initialSearch)
    return (
      <div className="parent">
        <div className="row">
					<div className="col-sm-8">
						<SearchBar handleSearch={this.handleSearch} initialSearch={this.state.initialSearch} />
					</div>
				</div>
        <table className="table table-hover" width="auto">
          <thead>
            <tr>
              <th className="col-sm-6">Name</th>                   
            </tr>
          </thead>
          <tbody>
            {conferences}
          </tbody>  
        </table>
      </div>
    );
  }
});

export default Conferences;