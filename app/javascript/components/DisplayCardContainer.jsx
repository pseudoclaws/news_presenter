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
    this.subscription = new RootPageSubscription();
  }

  render()
  {
    return (<DisplayCard piece_of_news={this.state.piece_of_news}/>);
  }

  componentDidMount()
  {
    this.subscription.subscribe(this.stateChanged);
  }

  componentWillUnmount()
  {
    this.subscription.unsubscribe();
  }

  stateChanged(data)
  {
    this.setState({ piece_of_news: data });
  }
}