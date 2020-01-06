require 'test_helper'

class Lucid::Helpers::BemTest < ActionDispatch::IntegrationTest
  def setup
    @helpers = ApplicationController.helpers
  end
  
  test "can access helper" do
    assert @helpers.respond_to?(:bem)
  end
  
  test "can return block class" do
    assert_equal "c-person",
      @helpers.bem(block: 'person')                                    
  end

  test "can return block class with modifier" do
    assert_equal "c-person c-person--cool",
      @helpers.bem(block: 'person', modifier: 'cool') 
  end
  
  test "can return block class with multiple modifiers" do
    assert_equal "c-person c-person--hip c-person--cool",
      @helpers.bem(block: 'person', modifiers: %w(hip cool)) 
  end
  
  test "can return block class with element" do
    assert_equal "c-person__head",
      @helpers.bem(block: 'person', element: 'head')
  end
  
  test "can return block class with nested elements" do
    assert_equal "c-person__head__nose",
      @helpers.bem(block: 'person', elements: %w(head nose))
  end
  
  test "can return block class with element modifier" do
    assert_equal "c-person__nose c-person__nose--big",
      @helpers.bem(block: 'person', element: 'nose', modifier: 'big')  
  end
  
  test "can return block class with multiple element modifiers" do
    assert_equal "c-person__nose c-person__nose--hip c-person__nose--cool",
      @helpers.bem(block: 'person', element: 'nose', modifiers: %w(hip cool)) 
  end
  
  test "can return classes with span utility classes" do
    assert_equal "c-person u-1/2",
      @helpers.bem(block: 'person', span: '1/2')  

    assert_equal "c-person u-1/2 u-1/4@large",
      @helpers.bem(block: 'person', span: ['1/2', '1/4@large'])  

    assert_equal "c-person__nose u-1/2 u-1/4@large",
      @helpers.bem(block: 'person', element: 'nose', span: ['1/2', '1/4@large'])  

    assert_equal "c-person__nose c-person__nose--big u-1/2 u-1/4@large",
      @helpers.bem(block: 'person', element: 'nose', modifier: 'big', span: ['1/2', '1/4@large'])
      
    assert_equal "c-person u-1/2",
      @helpers.bem(block: 'person', span: :half)
      
    assert_equal "c-person__nose u-1/3",
        @helpers.bem(block: 'person', element: 'nose', span: :third)
        
    assert_equal "c-person__nose c-person__nose--big u-1/4",
      @helpers.bem(block: 'person', element: 'nose', modifier: 'big', span: :quarter)
    
    assert_equal "c-person u-1/3@medium u-1/4@large",
      @helpers.bem(block: 'person', span: { medium: :third, large: '1/4' })
    
    assert_equal "c-person u-1/2 u-1/3@medium u-1/4@large",
      @helpers.bem(block: 'person', span: { base: :half, medium: :third, large: '1/4' })
  end
  
  test "can prepend classes" do
    assert_equal "special-class c-person c-person--cool",
      @helpers.bem(block: 'person', modifier: 'cool', prepend: 'special-class')
  end
  
  test "can append classes" do
    assert_equal "c-person c-person--cool special-class",
      @helpers.bem(block: 'person', modifier: 'cool', append: 'special-class')
  end
end