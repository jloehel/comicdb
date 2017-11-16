module Wizard
  module Comic
    STEPS = %w(step1 step2 step3).freeze
    
    class IsbnValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        unless ISBN.valid? value
          record.errors["attribute"] << (options[:message] || "wrong ISBN format")
        end   
      end
    end

    class ReleaseDateValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        unless (DateTime.parse(happened_at) rescue ArgumentError) == ArgumentError
          record.errors["attribute"] << (options[:message] || "release date must be a valid datetime")
        end   
      end
    end

    class Base
      include Active::Model
      attr_accessor :comic

      delegate *::Comic.attribute_names.map { |attr| [attr, "#{attr}="] }.flatten, to: :comic

      def initialize(comic_attributes)
        @comic = ::Comic.new(comic_attributes)
      end

      def only_numbers(isbn)
        isbn.gsub(/[^0-9]/, "")
      end
    end

    class Step1 < Base
      def at_least_one_isbn
        if self.ISBN10.blank? && self.ISBN13.blank?
          errors.add(:isbn, "please fill in at least one correct ISBN")
        end
      end

      validate :at_least_one_isbn
      validates :ISBN10, length: {is: 10}, isbn: true, allow_nil: true, allow_blank: true
      validates :ISBN13, length: {is: 13}, isbn: true, allow_nil: true, allow_blank: true
    end

    class Step2 < Step1
      validates :title, presence: true
      validates :price, numericality: true, :format => { :with => /\A\d{1,4}(.\d{0,2})?\z/ }
      validates :release_date, release_date: true
    end

    class Step3 < Step2
      validates :edition, numericality: true
      validates :pages, numericality: true
    end
  end
end
