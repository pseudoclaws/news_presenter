'use strict';

import React from 'react';
import DisplayCard from './DisplayCard'
import RootPageSubscription from '../cable/subscriptions/root_page_subscription'

export default class DisplayCardContainer extends React.Component
{
  constructor(props)
  {
    super(props);
    this.state = {
      piece_of_news: this.props.piece_of_news
    };

    this.stateChanged = this.stateChanged.bind(this);
  }

  render()
  {
    return (<DisplayCard piece_of_news={this.state.piece_of_news}/>);
  }

  componentDidMount()
  {
    RootPageSubscription.subscribe(this.stateChanged);
  }

  componentWillUnmount()
  {
    RootPageSubscription.unsubscribe();
  }

  stateChanged(data)
  {
    this.setState({ piece_of_news: data });
  }
}