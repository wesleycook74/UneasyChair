import React from 'react';

const Conference = React.createClass ({
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
              {this.props.conference.description}
            </div>  
        </td>
      </tr>
      
    );
  }
});

export default Conference;