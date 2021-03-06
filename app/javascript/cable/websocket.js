'use strict';

import Cable from 'es6-actioncable';

const WEBSOCKET_URL = '/cable';

export default class Websocket {
  connect() {
    console.log('connecting websocket');
    this.consumer = Cable.createConsumer(WEBSOCKET_URL);
  }

  getConsumer() {
    if(!this.consumer) {
      this.connect();
    }
    return this.consumer;
  }

  closeConnection() {
    if(this.consumer) {
      Cable.endConsumer(this.consumer);
    }
    delete this.consumer;
  }
}
