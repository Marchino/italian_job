module ActiveModel
  module Validations
    class CodiceFiscaleOrPartitaIvaFormatValidator < ActiveModel::EachValidator
      def validate_each(object, attribute, value)
        cf_validator = CodiceFiscaleFormatValidator.new attributes: [attribute]
        pi_validator = PartitaIvaFormatValidator.new attributes: [attribute]

        if !( cf_validator.send(:control_code_valid?, value) || pi_validator.send(:control_code_valid?, value) )
          object.errors[attribute] << I18n.t("activerecord.errors.#{attribute}.invalid_format")
        end
      end
    end
  end
end
