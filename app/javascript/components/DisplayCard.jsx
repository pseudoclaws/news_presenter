'use strict';
import React from 'react'

export default class DisplayCard extends React.Component {
  constructor(props)
  {
    super(props);
    this.Footer = this.Footer.bind(this);
  }

  render()
  {
    return (
      <div className="row">
        <div className="col s12">
          <div className="card blue-grey darken-1">
            <div className="card-content white-text">
              <span className="card-title">{this.props.piece_of_news.title}</span>
              <p dangerouslySetInnerHTML={ {__html: this.props.piece_of_news.description} }/>
            </div>
            <this.Footer/>
          </div>
        </div>
      </div>
    );
  }

  Footer()
  {
    if(!this.props.piece_of_news.authorized)
    {
      return (<div className="card-action">
        <a href={this.props.piece_of_news.link} >Перейти к новости</a>
      </div>);
    }
    return null;
  }
}