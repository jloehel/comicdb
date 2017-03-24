FactoryGirl.define do
  factory :comic do
    ISBN13 "9781845764944"
    ISBN10 "1845764943"  
    title "The Boys #1"
    release_date 2007
    edition 1
    language "EN"
    format "Colour comic strip"
    shape  "258 x 170mm"
    pages 152
    price  9.95
    description "Meet Billy Butcher. He’s not a nice man, and neither are his team: the Frenchman, Mother’s Milk, and the Female"
    borrowd false
  end
end
