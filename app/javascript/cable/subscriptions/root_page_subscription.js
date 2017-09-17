'use strict';

import WebSocket from '../websocket';

export default class RootPageSubscription {
  subscribe(receivedCallback) {
    this.socket = new WebSocket();
    this.subscription = this.socket.getConsumer().subscriptions.create("RootPageChannel", {
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