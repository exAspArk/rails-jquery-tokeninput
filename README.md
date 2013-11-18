# rails-jquery-tokeninput [![Build Status](https://travis-ci.org/exAspArk/rails-jquery-tokeninput.png)](https://travis-ci.org/exAspArk/rails-jquery-tokeninput)

Integrating [Tokeninput](http://loopj.com/jquery-tokeninput/) jQuery plugin version 1.6.1.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails-jquery-tokeninput'
```

And then execute:

    $ bundle

Require jquery.tokeninput.js in your application.js:

```js
//= require rails-jquery-tokeninput
```

Add the stylesheets you want to use in your application.css:

```css
*= require token-input-facebook
```

## Usage

To start using gem you just have to add data-attribute to your text input:

```ruby
names = [{ id: 1, name: 'John' }, { id: 2, name: 'Mike' }]

f.text_field :names, 'data-tokeninput' => { collection: names }.to_json
```

Or if you are using Simple Form or Formtastic it may looks like:

```ruby
countries = [{ name: 'Hong Kong', iso_code: 'HK' }, { name: 'Jamaica', iso_code: 'JM' }]
options = { theme: 'facebook', tokenValue: 'iso_code' }

f.input :countries, as: :string, input_html: {
  data: { tokeninput: { collection: countries, options: options } }
}
```

It will automatically pass input values to your controller like an array (works well with pg_array).

It also automatically pre populate existed items.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
