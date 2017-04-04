import React from 'react';

const conference = React.createClass ({
  propTypes: {
    name: React.PropTypes.string,
    acronym: React.PropTypes.string
  },

  render: function() {

    return(
      <tr data-toggle="collapse" data-target={"#" + this.props.conference.id}>    
        <td>
          {this.props.conference.name}
            <div id={this.props.conference.id} className="accordian-body collapse">
              <br></br>
              hi
            </div>  
        </td>
      </tr>
      
    );
  }
});

export default conference;