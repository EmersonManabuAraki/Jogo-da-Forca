class Category
    attr_accessor :category
    
    def initialize(element1, element2, element3, element4, element5)
        @category = [element1, element2, element3, element4, element5]
    end

    def get_category
        @category
    end
end
