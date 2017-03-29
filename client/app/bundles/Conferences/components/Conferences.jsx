import React, { PropTypes } from 'react';

const Conferences = React.createClass ({
  getInitialState: function() {
        return { };
  },  

  componentDidMount: function() {
        this.setState({ books: this.props.catalog });
  },

  render() {
    return (
      <p> Conferences </p>
    );
  }
});

export default Conferences;