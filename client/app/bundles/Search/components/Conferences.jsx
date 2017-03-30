import React, { PropTypes } from 'react';
import axios from 'axios';
import Conference from './Conference';

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

  render() {
    var conferences = [];

    console.log(this.state.conferences)

    this.state.conferences.forEach(function(conference) {
      conferences.push(<Conference conference={conference}
                                    key={'conference'+ conference.id}/>);
    }.bind(this));

    return (
      <table className="table table-hover" width="auto">
        <thead>
          <tr>
            <th className="col-sm-2">Name</th>          
            <th className="col-sm-2">Acronym</th>          
          </tr>
        </thead>
        <tbody>
          {conferences}
        </tbody>
      </table>
    );
  }
});

export default Conferences;