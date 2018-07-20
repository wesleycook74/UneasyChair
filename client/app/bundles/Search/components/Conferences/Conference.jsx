import React from 'react';

const Conference = React.createClass ({
  propTypes: {
    name: React.PropTypes.string,
    acronym: React.PropTypes.string
  },

    handleView: function(e) {   
      window.location.replace('/conferences/' + this.props.conference.id );
  },

  render: function() {

    return(
      <tr data-toggle="collapse" data-target={"#" + this.props.conference.id}>    
        <td>
          {this.props.conference.name}
            <div id={this.props.conference.id} className="accordian-body collapse">
              <br></br>
              {this.props.conference.description}
            </div>  
        </td>
          <td>
            <a className="btn btn-primary btn-sm" onClick={this.handleView}>
              Go to
            </a>
        </td> 
      </tr>
      
    );
  }
});

export default Conference;