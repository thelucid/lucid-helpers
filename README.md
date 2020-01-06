# Lucid::Helpers
A set of Rails helpers that we use at SonicIQ to aid in development.

## Usage

### BEM

The `bem` helper allows for the creation of CSS class
attribute values that follow the BEM methodology. This can
be used in conjunction with Rails' tag helpers, or simply
by outputting the returned value in your view.

```erb
<%= content_tag 'h1', 'The Heading',
  class: bem(block: 'heading', modifier: 'large') %>
```
or
```erb
<h1 class="<%= bem(block: 'heading', modifier: 'large') %>">
  The Heading
</h1>
```

Both of these would output something like:

```text
<h1 class="c-heading c-heading--large">
  The Heading
</h1>
```

Note that the resulting BEM classes are namespaced, so
blocks are prefixed with 'c' to denote a 'component' by
default. This prefix can be overwridden by supplying a
`prefix` argument.

#### Block class

```ruby
bem(block: 'person')
  # "c-person"
```

#### Block class with modifier

```ruby
bem(block: 'person', modifier: 'cool')
  # "c-person c-person--cool"
```

#### Block class with multiple modifiers

```ruby
bem(block: 'person', modifiers: %w(hip cool))
  # "c-person c-person--hip c-person--cool"
```

#### Block class with element

```ruby
bem(block: 'person', element: 'head')
  # "c-person__head"
```

#### Block class with nested elements

```ruby
bem(block: 'person', elements: %w(head nose))
  # "c-person__head__nose"
```

#### Block class with element modifier

```ruby
bem(block: 'person', element: 'nose', modifier: 'big')
  # "c-person__nose c-person__nose--big"
```

#### Block class with multiple element modifiers

```ruby
bem(block: 'person', element: 'nose', modifiers: %w(hip cool))
  # "c-person__nose c-person__nose--hip c-person__nose--cool"
```

#### Span utility classes

```ruby
bem(block: 'person', span: '1/2')
  # "c-person u-1/2"
  
bem(block: 'person', span: ['1/2', '1/4@large'])
  # "c-person u-1/2 u-1/4@large"

bem(block: 'person', element: 'nose', span: ['1/2', '1/4@large'])
  # "c-person__nose u-1/2 u-1/4@large"
  
bem(block: 'person', element: 'nose', modifier: 'big', span: ['1/2', '1/4@large'])
  # "c-person__nose c-person__nose--big u-1/2 u-1/4@large"
  
bem(block: 'person', span: :half)
  # "c-person u-1/2"
  
bem(block: 'person', element: 'nose', span: :third)
  # "c-person__nose u-1/3"
  
bem(block: 'person', element: 'nose', modifier: 'big', span: :quarter)
  # "c-person__nose c-person__nose--big u-1/4"
  
bem(block: 'person', span: { medium: :third, large: '1/4' })
  # "c-person u-1/3@medium u-1/4@large"
  
bem(block: 'person', span: { base: :half, medium: :third, large: '1/4' })
  # "c-person u-1/2 u-1/3@medium u-1/4@large"
```

#### Prepend classes

```ruby
bem(block: 'person', modifier: 'cool', prepend: 'special-class') 
  # "special-class c-person c-person--cool"
```

#### Append classes

```ruby
bem(block: 'person', modifier: 'cool', append: 'special-class')
  # "c-person c-person--cool special-class"
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'lucid-helpers'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install lucid-helpers
```

## Contributing
Please submit a pull request if you'd like to contribute.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
