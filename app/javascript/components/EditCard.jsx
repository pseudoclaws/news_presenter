'use strict';
import 'moment/locale/ru'
import moment from 'moment'
import React from 'react'
import Datetime from 'react-datetime'

export default class EditCard extends React.Component
{
  constructor(props)
  {
    super(props);
    this.inputChanged = this.inputChanged.bind(this);
    this.save = this.save.bind(this);
  }

  render()
  {
    return (
      <div className="row">
        <div className="col s12">
          <div className="card">
            <div className="card-content">
              <div className="input-field">
                <input
                  id="title-input"
                  name="title"
                  type="text"
                  value={this.props.title || ''}
                  onChange={this.inputChanged}
                  disabled={this.props.saving ? 'disabled' : ''}
                />
                <label htmlFor="title-input">Заголовок новости</label>
                <div
                  className="error"
                  style={ {display: this.props.title_error ? '' : 'none'} }>
                  Введите заголовок новости.
                </div>
              </div>

              <div className="input-field">
                <textarea
                  id="description"
                  className="materialize-textarea"
                  name="description"
                  value={this.props.description || ''}
                  disabled={this.props.saving ? 'disabled' : ''}
                  onChange={this.inputChanged}
                />
                <label htmlFor="description">Описание новости</label>
                <div className="error" style={ {display: this.props.description_error ? '' : 'none'} }>Введите описание новости.</div>
              </div>

              <div className="row">
                <div className="col s12">
                  <span style={ {color: 'lightgray', paddingLeft: 10 } }>Действительна до:</span>
                  <div className="input-field inline">
                    <Datetime
                      inputProps={ {id: 'valid_until'} }
                      locale="ru"
                      value={moment(this.props.valid_until)}
                      onChange={this.inputChanged}
                      disabled={this.props.saving ? 'disabled' : ''}
                    />
                    <div
                         className="error"
                         style={ {display: this.props.valid_until_error ? '' : 'none'} }>Введите дату окончания показа новости.</div>
                  </div>
                </div>
              </div>
            </div>
            <div className="card-action">
              <a href="#" onClick={this.save} className={ this.props.changed && !this.props.disabled ? '' : 'disabled' }>
                Сохранить новость
              </a>
            </div>
          </div>
        </div>
      </div>
    );
  }

  inputChanged(e)
  {
    this.props.inputChanged(e);
  }

  save(e)
  {
    e.preventDefault();
    this.props.onSave();
  }
}