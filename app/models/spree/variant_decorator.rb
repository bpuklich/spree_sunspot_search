module Spree
  Variant.class_eval do
    after_save :reindex_product
    after_destroy :reindex_product

    private
    def reindex_product
      ::Sunspot.index! product unless is_master?
    end
  end
end