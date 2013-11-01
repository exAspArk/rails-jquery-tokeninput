module ActionView
  module Helpers
    def text_field(object_name, method, options = {})
      if tokeninput?(options) && need_to_pre_populate?(object_name, method)
        options[:data][:tokeninput][:options][:prePopulate] = items_to_prepopulation(object_name, method, options)
      end
      Tags::TextField.new(object_name, method, self, options).render
    end

  private

    def tokeninput?(options)
      options[:data] && options[:data][:tokeninput]
    end

    def need_to_pre_populate?(object_name, method)
      sent_items(object_name, method).any?
    end

    def sent_items(object_name, method)
      default = []
      begin
        params[object_name][method] || default
      rescue
        default
      end
    end

    def token_value(options)
      default = :id
      begin
        options[:data][:tokeninput][:options][:tokenValue] || default
      rescue
        default
      end
    end

    def items_to_prepopulation(object_name, method, options)
      _token_value = token_value(options)
      _sent_items = sent_items(object_name, method)

      options[:data][:tokeninput][:collection].select do |item|
        _sent_items.include?(item[_token_value].to_s)
      end
    end
  end
end
