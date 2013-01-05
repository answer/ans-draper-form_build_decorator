Ans::Draper::FormBuildDecorator
===============================

draper 用の form 生成用 decorator module

## Installation

Add this line to your application's Gemfile:

    gem 'ans-draper-form_build_decorator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ans-draper-form_build_decorator

## Usage

    class MyDecorator
      include Ans::Draper::FormBuildDecorator

      decorate_form :username, :form, class: "input-medium"
    end

    <%= form_for @user do |f| %>
      <% d = MyDecorator.bind f %>
      <%= d.username %>
    <% end %>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
