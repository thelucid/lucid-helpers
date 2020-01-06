module Lucid::Helpers::BemHelper
  def bem(block:, prefix: 'c', span: [], prepend: nil, append: nil, **options)
    elements = [*options[:element], *options[:elements]]
    modifiers = [*options[:modifier], *options[:modifiers]]
    
    cast = -> (value) {
      case value
      when :half then '1/2'
      when :third then '1/3'
      when :quarter then '1/4'
      else value
      end
    }
    
    span = if span.respond_to?(:keys)
      span.inject([*cast.call(span.delete(:base))]) do |items, (key, value)|
        items << "#{cast.call(value)}@#{key}"
      end
    else
      Array(span).map(&cast)
    end

    [*prepend,
      ([[*prefix, block].join('-') , *elements].join('__')).then do |base|
        [base, *modifiers.map { |modifier| [base, modifier].join('--') }]
      end, *span.map { |value| "u-#{value}" }, *append
    ].join(' ')
  end
end