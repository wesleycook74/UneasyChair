import React from 'react';
import ReactDOM from 'react-dom';
import axios from 'axios';

const SearchBar = React.createClass({
  handleSearch: function() {
    var query = ReactDOM.findDOMNode(this.refs.query).value;

    var self = this;
    axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
    axios.get('/conferences/search', {params: {query: query }})
      .then(function (response) {
        console.log(response.data);
        self.props.handleSearch(response.data);
      })
      .catch(function (error) {
        console.log(error);
        alert('Cannot sort events: ', error);
    });
  },

  render: function() {
    return(
      <input onChange={this.handleSearch}
             type="text"
             className="form-control"
             placeholder="Type what you are searching for here..."
             ref="query" />
    )
  }
});

export default SearchBar;