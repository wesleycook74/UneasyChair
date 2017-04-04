import React, { PropTypes } from 'react';
import axios from 'axios';
import Conference from './Conference';
import SearchBar from './SearchBar'

const Conferences = React.createClass ({
  getInitialState: function() {
        return { 
          conferences: []
        };
  },  

  componentDidMount: function() {
    var self = this;

		axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
		axios.get('/conferences')
			.then(function (response) {
				console.log(response.data);
				self.setState({ conferences: response.data.conferences })
			})
			.catch(function (error) {
				console.log(error);
			});
  },


	handleSearch: function(conferences) {
		this.setState({ conferences: conferences });
	},

  render() {
    var conferences = [];

    console.log(this.state.conferences)

    this.state.conferences.forEach(function(conference) {
      conferences.push(<Conference conference={conference}
                                    key={'conference'+ conference.id}/>);
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
            {conferences}
          </tbody>
        </table>
      </div>
    );
  }
});

export default Conferences;