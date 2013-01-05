require "ans-draper-form_build_decorator/version"

module Ans
  module Draper
    module FormBuildDecorator
      def self.included(decorator)
        decorator.send :extend, ClassMethods
        decorator.send :include, InstanceMethods

        decorator.class_eval do
          attr_accessor :form_builder
          alias_method :f, :form_builder
        end
      end

      module ClassMethods
        def bind(form_builder)
          new(form_builder.object).tap{|d| d.form_builder = form_builder}
        end
        def decorate_form(field,method,opts)
          define_method field do
            case method
            when :form
              send "_#{method}", field, opts
            end
          end
        end
      end

      module InstanceMethods
        private

        def _form(field,opts)
          case type = (opts[:type] || :string).to_sym
          when :boolean
            f.label field, raw("#{h.h _label(field,opts)} #{f.check_box field, class: opts[:class]}"), class: "checkbox"
          else
            f.send _method(type), field, placeholder: _label(field,opts), class: opts[:class]
          end
        end
        def _method(type)
          case type
          when :password
            :password_field
          when :text
            :text_area
          else
            :text_field
          end
        end
        def _label(field,opts)
          opts[:label] || model.class.human_attribute_name(field)
        end
      end
    end
  end
end
