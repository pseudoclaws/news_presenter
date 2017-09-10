'use strict';

export default class SavePieceOfNews
{
  constructor(piece_of_news)
  {
    this.info = piece_of_news;
  }

  call()
  {
    $.post(Routes.piece_of_news_index_path(), {
      piece_of_news: Object.assign({}, this.info.piece_of_news, { published_at: new Date() })
    }, (data)=> {
      if(this.info.successCallback !== void 0) this.info.successCallback(data);
      console.log('success!')
    }).fail(()=> {
      if(this.info.errorCallback !== void 0) this.info.errorCallback();
      console.log('error')
    }).always(()=> {
      if(this.info.alwaysCallback !== void 0) this.info.alwaysCallback();
    });
  }
}