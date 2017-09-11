'use strict';

import React from 'react'
import EditCard from './EditCard'
import SavePieceOfNews from "../services/save_piece_of_news";

export default class EditCardContainer extends React.Component
{
  constructor(props)
  {
    super(props);
    this.state = {
      title: this.props.piece_of_news.title || '', title_error: false,
      description: this.props.piece_of_news.description || '', description_error: false,
      valid_until: this.props.piece_of_news.valid_until || '', valid_until_error: false,
      changed: false
    };

    this.inputChanged = this.inputChanged.bind(this);
    this.onSave = this.onSave.bind(this);
    this.validate = this.validate.bind(this);
    this.toggleErrorVisibility = this.toggleErrorVisibility.bind(this);
    this.checkChanged = this.checkChanged.bind(this);
    this.savedSuccessfully = this.savedSuccessfully.bind(this);
    this.saveError = this.saveError.bind(this);
    this.savingFinished = this.savingFinished.bind(this);
  }

  render()
  {
    return (<EditCard {...this.state}
                      inputChanged={this.inputChanged}
                      onSave={this.onSave}/>
    );
  }

  inputChanged(e)
  {
    let field = {};
    let field_name, new_value = '';
    if(e.target === void 0)
    {
      field_name = 'valid_until';
      if(typeof(e) !== 'string')
      {
        new_value = e.format();
      }
      else
      {
        new_value = this.state.valid_until;
      }
    }
    else
    {
      field_name = e.target.name;
      new_value = e.target.value;
    }
    field[field_name] = new_value;
    if(new_value > 0) field[`${field_name}_error`] = false;
    this.setState(field);
    this.checkChanged(field_name, new_value);
  }

  onSave()
  {
    if(this.validate())
    {
      this.setState({ saving: true });
      let info = {
        piece_of_news: this.state,
        successCallback: this.savedSuccessfully,
        errorCallback: this.saveError,
        alwaysCallback: this.savingFinished
      };
      let actor = new SavePieceOfNews(info);
      actor.call();
    }
    else
    {
      this.toggleErrorVisibility();
    }
  }

  savedSuccessfully()
  {

  }

  saveError()
  {

  }

  savingFinished()
  {
    this.setState({ saving: false })
  }

  validate()
  {
    return this.state.title.length > 0 &&
      this.state.description.length > 0 &&
      this.state.valid_until.length > 0;
  }

  toggleErrorVisibility()
  {
    let errors = {};
    ['title', 'description', 'valid_until'].map((key)=> {
      errors[`${key}_error`] = this.state[key].length === 0;
    });
    this.setState(errors);
  }

  checkChanged(changed_key, changed_value)
  {
    let changed = false;
    ['title', 'description', 'valid_until'].map((key)=> {
      changed = changed || (changed_key === key ? changed_value : this.state[key]) !== this.props.piece_of_news[key];
      return changed;
    });
    this.setState({ changed: changed });
  }
}