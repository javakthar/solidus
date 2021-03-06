module Spree
  class ReturnItem::EligibilityValidator::RMARequired < Spree::ReturnItem::EligibilityValidator::BaseValidator
    def eligible_for_return?
      if @return_item.return_authorization.present?
        return true
      else
        add_error(:rma_required, Spree.t('return_item_rma_ineligible'))
        return false
      end
    end

    def requires_manual_intervention?
      false
    end
  end
end
