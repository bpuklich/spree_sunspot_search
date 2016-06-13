module Spree
  ProductProperty.class_eval do
    after_save :reindex_product
    after_destroy :reindex_product

    private
    def reindex_product
      ::Sunspot.index! product if not product.nil? and product.persisted?
    end
  end
end