import React, { PropTypes } from 'react';
import axios from 'axios';

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
				self.setState({ conferences: response.data })
			})
			.catch(function (error) {
				console.log(error);
			});
  },

  render() {
    return (
      <div> </div>
    );
  }
});

export default Conferences;