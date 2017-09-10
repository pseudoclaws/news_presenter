'use strict';

import WebSocket from '../websocket';

class RootPageSubscription {
  constructor() {
  }
  subscribe(receivedCallback) {
    this.subscription = WebSocket.getConsumer().subscriptions.create("RootPageChannel", {
      connected: function () {
        console.log('connected to RootPageChannel');
      },
      received: function (data) {
        receivedCallback(data)
      }
    });
  }
  unsubscribe() {
    if(this.subscription)
      this.subscription.unsubscribe();
  }
}