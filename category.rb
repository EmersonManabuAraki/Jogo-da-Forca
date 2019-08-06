class Category
    attr_accessor :category
    
    def initialize(elements)
        @category = []
        elements.each {|e| @category << e}
    end

    def get_category
        @category
    end
end
