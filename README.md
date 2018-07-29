# Develop With Style

> Enjoy writing CSS in your Rails application and Develop With Style!

Style your Rails views with [CSS modules](https://github.com/css-modules/css-modules), and your layouts with global CSS. Just create a stylesheet and decorate the HTML, then  you're good to go.

 - **No need for long class naming or having to decide on naming conventions such as BEM, etc.**
 - **Each view has its own CSS module, so no need to worry about style or naming conflicts.**
 - **The required stylesheets are automatically included.**
 - **Optionally define global styles in your layout stylesheet.**

For locally styled views (CSS Modules)...

```css
/* app/javascript/pages/home.module.css */
.main {
  background-color: red;
}
```

```ruby
<!-- app/views/pages/home.html.erb -->
<div class="<%= style 'main' %>">
  <h1>Hello world</h1>
</div>
```

You can do the same anywhere else, even using the same class names, but because a CSS module is used for each, we have no fear of style or class naming conflicts.

No fighting with stylesheet includes; just drop the `developed_with_style` helper in your layout and the Gem will include whatever you need.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'develop_with_style'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install develop_with_style

## Usage

First, run the installer:

    $ bin/rails develop_with_style

This will set everything up and add a couple of example CSS files:

 - `app/javascript/packs/layouts/application.css`
 - `app/javascript/packs/pages/home.module.scss`

DevelopWithStyle groups your stylesheets in to two types that will be very familiar to you; layouts and views. Layouts correspond to your Rails layouts, and Views correspond to your Rails views - obviously ;)

These two types also allow us to define global and local styles. So everything in your layout stylesheets will be global, and everything in your view stylesheets will be local using [CSS modules](https://github.com/css-modules/css-modules).

### Helpers

DevelopWithStyle comes with two little helpers to including and using layout and view styles.

#### `developed_with_style`

If you successfully ran the installer above, then this helper will already have been inserted in to the `<head>` of your `app/views/layouts/application` layout file.

The `developed_with_style` helper will first include the stylesheet that matches the name of the layout, then any view stylesheets that have been defined using the `style` helper.

#### `style`

The `style` helper can be used to insert the CSS class name.

So if you have a view at `pages/home.html.erb`, with the following contenets:

```ruby
<div>
  <h1>Hello world</h1>
</div>
```

Create a CSS module file at `app/javascript/pages/home.module.css`:

```css
.main {
  background-color: red;
}
```

You can style any HTML element as follows:

```ruby
<div class="<%= style 'main' %>">
  <h1>Hello world</h1>
</div>
```

Which will be rendered something like this:

```ruby
<div class="de5gdrhj56jkU8J034gsdd__main">
  <h1>Hello world</h1>
</div>
```

This will automatically include the stylesheet with the same path and name as the view when using the `developed_with_style` helper above.

For additional syntactic sugar, you can pass a block and the HTML `div` tag will be rendered for you.

```ruby
<%= style 'main' do %>
  <h1>Hello world</h1>
<% end %>
```

Pass the `:tag_name` option to specify which HTML tag you want to use:

```ruby
<%= style 'main', tag_name: :span do %>
  <h1>Hello world</h1>
<% end %>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joelmoss/develop_with_style. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DevelopWithStyle project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/joelmoss/develop_with_style/blob/master/CODE_OF_CONDUCT.md).
